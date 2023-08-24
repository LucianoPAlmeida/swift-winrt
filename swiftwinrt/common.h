#pragma once

#include "type_writers.h"
namespace swiftwinrt
{
    inline void write_preamble(writer& w, bool swift_code)
    {
        if (settings.license)
        {
            w.write(R"(// Swift/WinRT v%
// Copyright (c) The Browser Company. All rights reserved.
)", SWIFTWINRT_VERSION_STRING);
        }
        else
        {
            w.write(R"(// WARNING: Please don't edit this file. It was generated by Swift/WinRT v%
)", SWIFTWINRT_VERSION_STRING);
            if (swift_code)
            {
                w.write("// swiftlint:disable all\n");
            }
        }
        if (swift_code && !w.type_namespace.empty() && !w.support.empty())
        {
            auto module = w.swift_module;
            if (!settings.test)
            {
                if (module != w.support)
                {
                    w.depends.emplace(w.support);
                }

                for (auto& import : w.depends)
                {
                    if (import == w.support)
                    {
                        w.write("@_spi(WinRTInternal) @_spi(WinRTImplements) ");
                    }
                    w.write("import %\n", import);
                }
            }

            w.write("import %\n", w.c_mod);
        }
        w.write("\n");
    }

    // Note: If you're changing the structure here you'll need to clean the generated files.
    // The best thing to do is just delete the folder they are written to (even if checked in)
    inline std::string get_swift_module(std::string_view const& ns)
    {
        if (settings.test)
        {
            return settings.support;
        }

        if (ns.starts_with("Windows.Foundation"))
        {
            return "WindowsFoundation";
        }
        // Put both system xaml and winui3 in the "WinUI" module. In WinUI3 applications, there are still
        // types in the Windows.UI.Xaml.Interop namespace and it doesn't make sense to pull in the whole
        // UWP module for that. Plus, WinUI is such a distinct chunk, that even a non-winui3 app it makes
        // sense to have it be it's own thing. There will be compilation errors if the user tries to use
        // both, but this is a non-supported scenario anyway.
        else if (ns.starts_with("Microsoft.UI.Xaml") || ns.starts_with("Windows.UI.Xaml"))
        {
            return "WinUI";
        }
        else if (ns.starts_with("Windows"))
        {
            return "UWP";
        }
        else if (ns.starts_with("Microsoft.Web.WebView2.Core"))
        {
            return "WebView2Core";
        }
        else if (ns.starts_with("Microsoft.Graphics.Canvas"))
        {
            return "Win2D";
        }
        else if (ns.starts_with("Microsoft"))
        {
            return "WinAppSDK";
        }
        else
        {
            auto mod = std::string(ns);
            mod.erase(std::remove(mod.begin(), mod.end(), '.'), mod.end());
            return mod;
        }
    }

    inline std::string get_swift_module(TypeDef const& type)
    {
        return get_swift_module(type.TypeNamespace());
    }

    inline std::string get_swift_namespace(writer const&, std::string_view const& ns)
    {
        // We don't nest names in Swift due to not being able to create nested types.
        // See: https://github.com/apple/swift-corelibs-foundation/blob/de5f7edc3040057717f7da0ba875df04d3dc3e9e/Sources/Foundation/NSObjCRuntime.swift#L431-L433
        return get_swift_module(ns);
    }

    inline std::string get_swift_namespace(writer const& w, TypeDef const& type)
    {
        return get_swift_namespace(w, type.TypeNamespace());
    }

    inline std::string get_full_swift_type_name(writer const& w, TypeDef const& type)
    {
        // writing a generic, don't include the '.' because the type name here should
        // be something like IVectorView_UIElement not IVectorView_MicrosoftUIXaml.UIElement
        bool use_full_name = w.full_type_names || !w.writing_generic;
        std::string result = use_full_name ? get_swift_namespace(w, type) : "";
        if (!result.empty())
        {
            result += '.';
        }
        result += type.TypeName();
        return result;
    }

    inline std::string get_full_swift_type_name(writer const& w, const metadata_type* type)
    {
        auto swift_full_name = type->swift_full_name();
        auto last_ns_index = swift_full_name.find_last_of('.');
        bool use_full_name = w.full_type_names || !w.writing_generic;
        if (last_ns_index != swift_full_name.npos)
        {
            auto ns = swift_full_name.substr(0, last_ns_index);
            auto typeName = swift_full_name.substr(last_ns_index + 1);
            // writing a generic, don't include the '.' because the type name here should
            // be something like IVectorView_UIElement not IVectorView_MicrosoftUIXaml.UIElement
            std::string result = use_full_name ? get_swift_namespace(w, ns) : "";
            if (!result.empty())
            {
                result += '.';
            }
            result += typeName;
            return result;
        }
        else if (swift_full_name == "IInspectable" && use_full_name)
        {
            writer temp;
            return temp.write_temp("%.IInspectable", w.support);
        }
        else
        {
            return std::string(swift_full_name);
        }
    }

    inline std::string get_full_swift_type_name(writer const& w, const metadata_type& type)
    {
        return get_full_swift_type_name(w, &type);
    }
}
