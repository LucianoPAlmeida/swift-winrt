#include "pch.h"
#include <ctime>
#include "settings.h"
#include "type_helpers.h"
#include "type_writers.h"
#include "helpers.h"
#include "code_writers.h"
#include "component_writers.h"
#include "file_writers.h"
#include "type_writers.h"

namespace swiftwinrt
{
    settings_type settings;

    struct usage_exception {};

    static constexpr option options[]
    {
        { "input", 0, option::no_max, "<spec>", "Windows metadata to include in projection" },
        { "reference", 0, option::no_max, "<spec>", "Windows metadata to reference from projection" },
        { "output", 0, 1, "<path>", "Location of generated projection and component templates" },
        { "component", 0, 1, "[<path>]", "Generate component templates, and optional implementation" },
        { "name", 0, 1, "<name>", "Specify explicit name for component files" },
        { "verbose", 0, 0, {}, "Show detailed progress information" },
        { "ns-prefix", 0, 1, "<always|optional|never>", "Sets policy for prefixing type names with 'ABI' namespace (default: never)" },
        { "overwrite", 0, 0, {}, "Overwrite generated component files" },
        { "import", 0, 1, "<import>", "c module to import" },
        { "include", 0, option::no_max, "<prefix>", "One or more prefixes to include in input" },
        { "exclude", 0, option::no_max, "<prefix>", "One or more prefixes to exclude from input" },
        { "help", 0, option::no_max, {}, "Show detailed help with examples" },
        { "?", 0, option::no_max, {}, {} },
        { "library", 0, 1, "<prefix>", "Specify library prefix (defaults to winrt)" },
        { "filter" }, // One or more prefixes to include in input (same as -include)
        { "license", 0, 0 }, // Generate license comment
        { "brackets", 0, 0 }, // Use angle brackets for #includes (defaults to quotes)
        { "fastabi", 0, 0 }, // Enable support for the Fast ABI
        { "ignore_velocity", 0, 0 }, // Ignore feature staging metadata and always include implementations
        { "synchronous", 0, 0 }, // Instructs cppwinrt to run on a single thread to avoid file system issues in batch builds
    };

    static void print_usage(writer& w)
    {
        static auto printColumns = [](writer& w, std::string_view const& col1, std::string_view const& col2)
        {
            w.write_printf("  %-20s%s\n", col1.data(), col2.data());
        };

        static auto printOption = [](writer& w, option const& opt)
        {
            if(opt.desc.empty())
            {
                return;
            }
            printColumns(w, w.write_temp("-% %", opt.name, opt.arg), opt.desc);
        };

        auto format = R"(
Swift/WinRT v%
Copyright (c) The Browser Company. All rights reserved.

  swiftwinrt.exe [options...]

Options:

%  ^@<path>             Response file containing command line options

Where <spec> is one or more of:

  path                Path to winmd file or recursively scanned folder
  local               Local ^%WinDir^%\System32\WinMetadata folder
  sdk[+]              Current version of Windows SDK [with extensions]
  10.0.12345.0[+]     Specific version of Windows SDK [with extensions]
)";
        w.write(format, SWIFTWINRT_VERSION_STRING, bind_each(printOption, options));
    }

    static void process_args(reader const& args)
    {
        settings.verbose = args.exists("verbose");
        settings.fastabi = args.exists("fastabi");

        settings.input = args.files("input", database::is_database);
        settings.reference = args.files("reference", database::is_database);

        settings.component = args.exists("component");

        settings.license = args.exists("license");
        settings.brackets = args.exists("brackets");

        path output_folder = args.value("output", ".");
        
        settings.c_import = args.value("import", "CWinRT");
        
        create_directories(output_folder / "winrt/impl");
        settings.output_folder = canonical(output_folder).string();
        settings.output_folder += '\\';

        for (auto && include : args.values("include"))
        {
            settings.include.insert(include);
        }

        for (auto && include : args.values("filter"))
        {
            settings.include.insert(include);
        }

        for (auto && exclude : args.values("exclude"))
        {
            settings.exclude.insert(exclude);
        }

        if (settings.component)
        {
            settings.component_overwrite = args.exists("overwrite");
            settings.component_name = args.value("name");

            if (settings.component_name.empty())
            {
                // For compatibility with C++/WinRT 1.0, the component_name defaults to the *first*
                // input, hence the use of values() here that will return the args in input order.

                auto& values = args.values("input");

                if (!values.empty())
                {
                    settings.component_name = path(values[0]).filename().replace_extension().string();
                }
            }

            settings.component_prefix = args.exists("prefix");
            settings.component_lib = args.value("library", "winrt");
            settings.component_opt = args.exists("optimize");
            settings.component_ignore_velocity = args.exists("ignore_velocity");

            auto component = args.value("component");

            if (!component.empty())
            {
                create_directories(component);
                settings.component_folder = canonical(component).string();
                settings.component_folder += '\\';
            }
        }

        if (args.exists("ns-prefix"))
        {
            auto const& values = args.values("ns-prefix");
            if (values.empty())
            {
                settings.nsprefix = ns_prefix::always;
            }
            else
            {
                auto const& value = values[0];
                if (value == "always")
                {
                    settings.nsprefix = ns_prefix::always;
                }
                else if (value == "never")
                {
                    settings.nsprefix = ns_prefix::never;
                }
                else if (value == "optional")
                {
                    settings.nsprefix = ns_prefix::optional;
                }
                else
                {
                    throw_invalid("'" + value + "' is not a valid argument for 'ns-prefix'");
                }
            }
        }
        else
        {
            settings.nsprefix = ns_prefix::never;
        }
    }

    static auto get_files_to_cache()
    {
        std::vector<std::string> files;
        files.insert(files.end(), settings.input.begin(), settings.input.end());
        files.insert(files.end(), settings.reference.begin(), settings.reference.end());
        return files;
    }

    static void build_filters(cache const& c)
    {
        if (settings.reference.empty())
        {
            return;
        }

        std::set<std::string> include;

        for (auto file : settings.input)
        {
            auto db = std::find_if(c.databases().begin(), c.databases().end(), [&](auto&& db)
            {
                return db.path() == file;
            });

            for (auto&& type : db->TypeDef)
            {
                if (!type.Flags().WindowsRuntime())
                {
                    continue;
                }

                std::string full_name{ type.TypeNamespace() };
                full_name += '.';
                full_name += type.TypeName();
                include.insert(full_name);
            }
        }

        settings.projection_filter = { include, {} };
        
        settings.component_filter = { settings.include.empty() ? include : settings.include, settings.exclude };
    }

    static void build_fastabi_cache(cache const& c)
    {
        if (!settings.fastabi)
        {
            return;
        }

        for (auto&& [ns, members] : c.namespaces())
        {
            for (auto&& type : members.classes)
            {
                if (!has_fastabi(type))
                {
                    continue;
                }

                auto default_interface = get_default_interface(type);

                if (default_interface.type() == TypeDefOrRef::TypeDef)
                {
                    settings.fastabi_cache.try_emplace(default_interface.TypeDef(), type);
                }
                else
                {
                    settings.fastabi_cache.try_emplace(find_required(default_interface.TypeRef()), type);
                }
            }
        }
    }

    static void remove_foundation_types(cache& c)
    {
        c.remove_type("Windows.Foundation", "DateTime");
        c.remove_type("Windows.Foundation", "EventRegistrationToken");
        c.remove_type("Windows.Foundation", "HResult");
        c.remove_type("Windows.Foundation", "Point");
        c.remove_type("Windows.Foundation", "Rect");
        c.remove_type("Windows.Foundation", "Size");
        c.remove_type("Windows.Foundation", "TimeSpan");

        c.remove_type("Windows.Foundation.Numerics", "Matrix3x2");
        c.remove_type("Windows.Foundation.Numerics", "Matrix4x4");
        c.remove_type("Windows.Foundation.Numerics", "Plane");
        c.remove_type("Windows.Foundation.Numerics", "Quaternion");
        c.remove_type("Windows.Foundation.Numerics", "Vector2");
        c.remove_type("Windows.Foundation.Numerics", "Vector3");
        c.remove_type("Windows.Foundation.Numerics", "Vector4");
    }

    static int run(int const argc, char** argv)
    {
        int result{};
        writer w;

        try
        {
            auto start = get_start_time();

            reader args{ argc, argv, options };

            if (!args || args.exists("help") || args.exists("?"))
            {
                throw usage_exception{};
            }

            process_args(args);
            cache c{ get_files_to_cache(), [](TypeDef const& type) { return type.Flags().WindowsRuntime(); } };
            remove_foundation_types(c);
            build_filters(c);
            build_fastabi_cache(c);

            if (settings.verbose)
            {
                char* path = nullptr;
                _get_pgmptr(&path);
                w.write(" tool:  %\n", path);
                w.write(" ver:   %\n", SWIFTWINRT_VERSION_STRING);

                for (auto&& file : settings.input)
                {
                    w.write(" in:    %\n", file);
                }

                for (auto&& file : settings.reference)
                {
                    w.write(" ref:   %\n", file);
                }

                w.write(" out:   %\n", settings.output_folder);

                if (!settings.component_folder.empty())
                {
                    w.write(" cout:  %\n", settings.component_folder);
                }
            }

            w.flush_to_console();
            task_group group;
            group.synchronous(args.exists("synchronous"));
            writer swift;
            write_preamble(swift, settings.c_import);

            for (auto&&[ns, members] : c.namespaces())
            {
                if (!has_projected_types(members) || !settings.projection_filter.includes(members))
                {
                    continue;
                }

                group.add([&, &ns = ns, &members = members]
                {
                    write_namespace_abi(ns, members, settings);
                    write_namespace_wrapper(ns, members, settings);
                });
            }

            if (settings.component)
            {
                throw std::exception("component generation not yet supported");
            }

            group.get();

            if (settings.verbose)
            {
                w.write(" time:  %ms\n", get_elapsed_time(start));
            }
        }
        catch (usage_exception const&)
        {
            print_usage(w);
        }
        catch (std::exception const& e)
        {
            w.write("swiftwinrt : error %\n", e.what());
            result = 1;
        }

        w.flush_to_console(result == 0);
        return result;
    }
}

int main(int const argc, char** argv)
{
    return swiftwinrt::run(argc, argv);
}
