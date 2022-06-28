#pragma once

namespace swiftwinrt
{
    struct finish_with
    {
        writer& w;
        void (*finisher)(writer&);

        finish_with(writer& w, void (*finisher)(writer&)) : w(w), finisher(finisher) {}
        finish_with(finish_with const&)= delete;
        void operator=(finish_with const&) = delete;

        ~finish_with() { finisher(w); }
    };

    static void write_nothing(writer&)
    {
    }

    static void write_preamble(writer& w)
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
        }

        w.write("import CWinRT\n\n");
    }

    static void write_version_assert(writer& w)
    {
        w.write_root_include("base");
        auto format = R"(static_assert(winrt::check_version(CPPWINRT_VERSION, "%"), "Mismatched C++/WinRT headers.");
#define CPPWINRT_VERSION "%"
)";
        w.write(format, SWIFTWINRT_VERSION_STRING, SWIFTWINRT_VERSION_STRING);
    }


    static void write_enum_field(writer& w, Field const& field)
    {
        auto format = R"(        % = %,
)";

        if (auto constant = field.Constant())
        {
            w.write(format, field.Name(), *constant);
        }
    }

    static void write_enum(writer& w, TypeDef const& type)
    {

    }

    static void write_generic_typenames(writer& w, std::pair<GenericParam, GenericParam> const& params)
    {
        separator s{ w };

        for (auto&& param : params)
        {
            s();
            w.write("typename %", param);
        }
    }


    static void write_comma_generic_typenames(writer& w, std::pair<GenericParam, GenericParam> const& params)
    {
        for (auto&& param : params)
        {
            w.write(", typename %", param);
        }
    }

    static void write_comma_generic_types(writer& w, std::pair<GenericParam, GenericParam> const& params)
    {
        for (auto&& param : params)
        {
            w.write(", %", param);
        }
    }

    static void write_guid_value(writer& w, std::vector<FixedArgSig> const& args)
    {
        using std::get;

        w.write_printf("Data1: 0x%08X, Data2: 0x%04X, Data3: 0x%04X, Data4: ( 0x%02X,0x%02X,0x%02X,0x%02X,0x%02X,0x%02X,0x%02X,0x%02X )",
            get<uint32_t>(get<ElemSig>(args[0].value).value),
            get<uint16_t>(get<ElemSig>(args[1].value).value),
            get<uint16_t>(get<ElemSig>(args[2].value).value),
            get<uint8_t>(get<ElemSig>(args[3].value).value),
            get<uint8_t>(get<ElemSig>(args[4].value).value),
            get<uint8_t>(get<ElemSig>(args[5].value).value),
            get<uint8_t>(get<ElemSig>(args[6].value).value),
            get<uint8_t>(get<ElemSig>(args[7].value).value),
            get<uint8_t>(get<ElemSig>(args[8].value).value),
            get<uint8_t>(get<ElemSig>(args[9].value).value),
            get<uint8_t>(get<ElemSig>(args[10].value).value));
    }

    static void write_guid_comment(writer& w, std::vector<FixedArgSig> const& args)
    {
        using std::get;

        w.write_printf("%08X-%04X-%04X-%02X%02X-%02X%02X%02X%02X%02X%02X",
            get<uint32_t>(get<ElemSig>(args[0].value).value),
            get<uint16_t>(get<ElemSig>(args[1].value).value),
            get<uint16_t>(get<ElemSig>(args[2].value).value),
            get<uint8_t>(get<ElemSig>(args[3].value).value),
            get<uint8_t>(get<ElemSig>(args[4].value).value),
            get<uint8_t>(get<ElemSig>(args[5].value).value),
            get<uint8_t>(get<ElemSig>(args[6].value).value),
            get<uint8_t>(get<ElemSig>(args[7].value).value),
            get<uint8_t>(get<ElemSig>(args[8].value).value),
            get<uint8_t>(get<ElemSig>(args[9].value).value),
            get<uint8_t>(get<ElemSig>(args[10].value).value));
    }

    static void write_guid(writer& w, TypeDef const& type)
    {
        auto attribute = get_attribute(type, "Windows.Foundation.Metadata", "GuidAttribute");

        auto abi_guard = w.push_abi_types(true);

        if (!attribute)
        {
            throw_invalid("'Windows.Foundation.Metadata.GuidAttribute' attribute for type '", type.TypeNamespace(), ".", type.TypeName(), "' not found");
        }

        auto generics = type.GenericParam();
        auto guid = attribute.Value().FixedArgs();
        auto format = R"(private var IID_%: IID {
%IID(%)// %
}

)";

        w.write(format,
            type,
            indent { 1 },
            bind<write_guid_value>(guid),
            bind<write_guid_comment>(guid));
    }

    static void write_default_interface(writer& w, TypeDef const& type)
    {
        if (auto default_interface = get_default_interface(type))
        {
            auto format = R"(    template <> struct default_interface<%>{ using type = %; };
)";
            w.write(format, type, default_interface);
        }
    }

    static void write_array_size_name(writer& w, Param const& param)
    {
        w.write(" __%Size", param.Name());
    }

    static void write_convert_to_abi_arg(writer& w, std::string_view const& param_name, TypeSig const& type)
    {
        if (std::holds_alternative<GenericTypeIndex>(type.Type()))
        {
            XLANG_ASSERT("**TODO: implement write_convert_to_abi_arg**");
        }
        else if (is_interface(type))
        {
            w.write("RawPointer(%)", param_name);
        }
        else if (is_class(type))
        {
            w.write("RawPointer(%.interface)", param_name);
        }
        else
        {
            auto guard = w.push_abi_types(true);
            w.write("%(from: %)", type, param_name);
        }
    }


    static void write_abi_arg_in(writer& w, Param const& param, TypeSig const& type)
    {
        if (std::holds_alternative<GenericTypeIndex>(type.Type()))
        {
            XLANG_ASSERT("**TODO: implement write_abi_arg_in**");
        }
        else
        {
            auto category = get_category(type);
            if (category == param_category::object_type)
            {
                if (auto default_interface = get_default_interface(type))
                {
                    w.write("_ %: UnsafeMutablePointer<%>?", param.Name(), default_interface);
                }
                else
                {
                    w.write("_ %: UnsafeMutablePointer<%>?", param.Name(), type);
                }
            }
            else if (category == param_category::string_type)
            { 
                w.write("_ %: %?", param.Name(), type);
            }
            else
            {
                w.write("_ %: %", param.Name(), type);
            }
        }
    }

    static void write_abi_arg_out(writer& w, Param const& param, TypeSig const& type)
    {
        if (std::holds_alternative<GenericTypeIndex>(type.Type()))
        {
            XLANG_ASSERT("**TODO: implement write_abi_arg_out**");
        }
        else
        {
            w.write("%*", type);
        }
    }

    static void write_abi_params(writer& w, method_signature const& method_signature)
    {
        auto abi_guard = w.push_abi_types(true);
        separator s{ w };

        for (auto&& [param, param_signature] : method_signature.params())
        {
            s();

            if (param_signature->Type().is_szarray())
            {
                XLANG_ASSERT("**TODO: implement szarray in write_abi_params **");
            }
            else
            {
                if (param.Flags().In())
                {
                    write_abi_arg_in(w, param, param_signature->Type());
                }
                else
                {
                    write_abi_arg_out(w,param, param_signature->Type());
                }
            }
        }

    }

    static void write_swift_arg_in(writer& w, Param const& param, TypeSig const& type)
    {
        if (std::holds_alternative<GenericTypeIndex>(type.Type()))
        {
            XLANG_ASSERT("**TODO: implement write_swift_arg_in**");
        }
        else
        {
            w.write("_ %: %", param.Name(), type);
        }
    }

    static void write_swift_arg_out(writer& w, Param const& param, TypeSig const& type)
    {
        if (std::holds_alternative<GenericTypeIndex>(type.Type()))
        {
            XLANG_ASSERT("**TODO: implement write_swift_arg_out**");
        }
        else
        {
            w.write("inout %: %", param.Name(), type);
        }
    }

    static void write_swift_params(writer& w, method_signature const& method_signature)
    {
        separator s{ w };

        for (auto&& [param, param_signature] : method_signature.params())
        {
            s();

            if (param_signature->Type().is_szarray())
            {
                XLANG_ASSERT("**TODO: implement szarray in write_swift_params**");
            }
            else
            {
                if (param.Flags().In())
                {
                    write_swift_arg_in(w, param, param_signature->Type());
                }
                else
                {
                    write_swift_arg_out(w, param, param_signature->Type());
                }
            }
        }

    }

    static void write_abi_args(writer& w, method_signature const& method_signature)
    {
        separator s{ w };

        w.write("pThis");

        s();
        for (auto&& [param, param_signature] : method_signature.params())
        {
            s();
            w.write(param.Name());
        }

        if (method_signature.return_signature())
        {
            s();
            auto param_name = method_signature.return_param_name();
            w.write("&%", param_name);
        }
    }

    static void write_fast_interface_abi(writer& w, TypeDef const& default_interface)
    {
        if (!settings.fastabi)
        {
            return;
        }

        auto pair = settings.fastabi_cache.find(default_interface);

        if (pair == settings.fastabi_cache.end())
        {
            return;
        }

        auto bases = get_bases(pair->second);

        std::for_each(bases.rbegin(), bases.rend(), [&](auto&& base)
        {
            auto format = R"(            virtual void* __stdcall base_%() noexcept = 0;
)";

            w.write(format, base.TypeName());
        });

        for (auto&& [name, info] : get_interfaces(w, pair->second))
        {
            if (info.is_default)
            {
                continue;
            }
            
            if (!info.fastabi)
            {
                break;
            }

            auto format = R"(            virtual int32_t __stdcall %(%) noexcept = 0;
)";

            for (auto&& method : info.type.MethodList())
            {
                method_signature signature{ method };
                w.write(format, get_abi_name(method), bind<write_abi_params>(signature));
            }
        }
    }

    static void write_consume_return_type(writer& w, method_signature const& signature, bool delegate_types)
    {
        if (!signature.return_signature())
        {
            return;
        }

        auto return_type = signature.return_signature().Type();
        auto category = get_category(return_type);

        if (category == param_category::array_type)
        {
            XLANG_ASSERT("**TODO: implement array type in write_consume_return_type");
        }
        else if (category == param_category::object_type)
        {
            auto format = "%(%(consuming: %))";
            auto default_interface = get_default_interface(return_type);
            w.write(format, return_type, default_interface, signature.return_param_name());
        }
        else if (category == param_category::generic_type)
        {
            XLANG_ASSERT("**TODO: implement generic type in write_consume_return_type");
        }
        else
        {
            auto format = "%(from: %)";
            w.write(format, signature.return_signature(), signature.return_param_name());
        }
    }

    static void write_init_return_val(writer& w, RetTypeSig const& signature)
    {
        auto category = get_category(signature.Type());
        if (category == param_category::object_type || category == param_category::string_type)
        {
            w.write(signature);
        }
        else
        {
            auto format = "% = %";
            w.write(format,
                signature.Type(),
                is_floating_point(signature.Type()) ? "0.0" : "0");
        }
    }

    static void write_abi_func_body(writer& w, TypeDef const& type, winmd::reader::MethodDef method)
    {
        std::string_view funcName = method.Name();
        method_signature signature{ method };

        auto return_sig = signature.return_signature();
        if (return_sig)
        {
            w.write("%var %: %\n",
                indent{ 2 },
                signature.return_param_name(),
                bind<write_init_return_val>(return_sig));
        }

        w.write(R"(%_ = try perform(as: %.self) { pThis in
%try CHECKED(pThis.pointee.lpVtbl.pointee.%(%))
)",
indent{ 2 },
type,
indent{ 3 },
funcName,
bind<write_abi_args>(signature));

        w.write("%}\n", indent{ 2 });
        if (return_sig)
        {
            w.write("%return %\n", indent{ 2 }, signature.return_param_name());
        }
    }

    static void write_return_type_declaration(writer& w, method_signature signature)
    {
        auto return_sig = signature.return_signature();
        if (!return_sig)
        {
            return;
        }

        /*if (w.abi_types && get_category(return_sig.Type()) == param_category::object_type)
        {
            auto format = "-> UnsafeMutablePointer<%> ";

            if (auto default_interface = get_default_interface(return_sig.Type()))
            {
                w.write(format, default_interface);
            }
            else
            {
                w.write(format, return_sig);
            }
        }
        else*/
        {
            auto format = "-> % ";
            w.write(format,
                return_sig);
        }
    }

    static void write_interface_abi(writer& w, TypeDef const& type)
    {
        //auto generics = type.GenericParam();
        //auto guard{ w.push_generic_params(generics) };

        //if (empty(generics))
        {
            auto format = R"(public class % : IInspectable {
)";
            w.write(format, type);
        }

        auto abi_guard = w.push_abi_types(true);

        auto iid_format = "    override public class var IID: IID { IID_% }\n\n";
        w.write(iid_format, type);

        auto format_method = R"(    public func %(%) throws %{
%    }
)";

        for (auto&& method : type.MethodList())
        {
            try
            {
                method_signature signature{ method };

                w.write(format_method,
                    get_abi_name(method),
                    bind<write_abi_params>(signature),
                    bind<write_return_type_declaration>(signature),
                    bind<write_abi_func_body>(type, method));
            }
            catch (std::exception const& e)
            {
                throw_invalid(e.what(),
                    "\n method: ", get_name(method),
                    "\n type: ", type.TypeNamespace(), ".", type.TypeName(),
                    "\n database: ", type.get_database().path());
            }
        }
        
        //write_fast_interface_abi(w, type);
        w.write("}\n\n");
    }

    static void write_delegate_abi(writer& w, TypeDef const& type)
    {

    }

    static void write_field_abi(writer& w, Field const& field)
    {
        w.write("        % %;\n", get_field_abi(w, field), field.Name());
    }

    static void write_struct_abi(writer& w, TypeDef const& type)
    {
    
    }

    static void write_consume_params(writer& w, method_signature const& signature)
    {
        separator s{ w };

        for (auto&& [param, param_signature] : signature.params())
        {
            s();

            if (param_signature->Type().is_szarray())
            {
                std::string_view format;

                if (param.Flags().In())
                {
                    format = "array_view<% const>";
                }
                else if (param_signature->ByRef())
                {
                    format = "com_array<%>&";
                }
                else
                {
                    format = "array_view<%>";
                }

                w.write(format, param_signature->Type().Type());
            }
            else
            {
                if (param.Flags().In())
                {
                    assert(!param.Flags().Out());
                    w.consume_types = true;

                    auto param_type = std::get_if<ElementType>(&param_signature->Type().Type());

                    if (param_type && *param_type != ElementType::String && *param_type != ElementType::Object)
                    {
                        w.write("%", param_signature->Type());
                    }
                    else if (std::holds_alternative<GenericTypeIndex>(param_signature->Type().Type()))
                    {
                        w.write("impl::param_type<%> const&", param_signature->Type());
                    }
                    else
                    {
                        w.write("% const&", param_signature->Type());
                    }

                    w.consume_types = false;
                }
                else
                {
                    assert(!param.Flags().In());
                    assert(param.Flags().Out());

                    w.write("%&", param_signature->Type());
                }
            }

            w.write(" %", param.Name());
        }
    }

    static void write_implementation_params(writer& w, method_signature const& method_signature)
    {
        separator s{ w };

        for (auto&& [param, param_signature] : method_signature.params())
        {
            s();

            if (param_signature->Type().is_szarray())
            {
                std::string_view format;

                if (param.Flags().In())
                {
                    format = "array_view<% const>";
                }
                else if (param_signature->ByRef())
                {
                    format = "com_array<%>&";
                }
                else
                {
                    format = "array_view<%>";
                }

                w.write(format, param_signature->Type().Type());
            }
            else
            {
                if (param.Flags().In())
                {
                    assert(!param.Flags().Out());

                    auto param_type = std::get_if<ElementType>(&param_signature->Type().Type());

                    if ((!is_put_overload(method_signature.method()) && w.async_types) ||
                        (param_type && *param_type != ElementType::String && *param_type != ElementType::Object))
                    {
                        w.write("%", param_signature->Type());
                    }
                    else
                    {
                        w.write("% const&", param_signature->Type());
                    }
                }
                else
                {
                    assert(!param.Flags().In());
                    assert(param.Flags().Out());

                    w.write("%&", param_signature->Type());
                }
            }

            w.write(" %", param.Name());
        }
    }


    static void write_consume_return_statement(writer& w, method_signature const& signature)
    {
        if (!signature.return_signature())
        {
            return;
        }

        auto category = get_category(signature.return_signature().Type());

        if (category == param_category::array_type)
        {
            w.write("\n        return %{ %, %_impl_size, take_ownership_from_abi };",
                signature.return_signature(),
                signature.return_param_name(),
                signature.return_param_name());
        }
        else if (category == param_category::object_type || category == param_category::string_type)
        {
            w.write("\n        return %{ %, take_ownership_from_abi };",
                signature.return_signature(),
                signature.return_param_name());
        }
        else
        {
            w.write("\n        return %;", signature.return_param_name());
        }
    }

    static void write_consume_args(writer& w, method_signature const& signature)
    {
        separator s{ w };

        for (auto&& [param, param_signature] : signature.params())
        {
            s();
            w.write(param.Name());
        }
    }

    static void write_interface_override_method(writer& w, MethodDef const& method, std::string_view const& interface_name)
    {
        auto format = R"(    template <typename D> auto %T<D>::%(%) const%
    {
        return shim().template try_as<%>().%(%);
    }
)";

        method_signature signature{ method };
        auto method_name = get_name(method);

        w.write(format,
            interface_name,
            method_name,
            bind<write_consume_params>(signature),
            is_noexcept(method) ? " noexcept" : "",
            interface_name,
            method_name,
            bind<write_consume_args>(signature));
    }

    static void write_interface_override_methods(writer& w, TypeDef const& class_type)
    {
        for (auto&& [interface_name, info] : get_interfaces(w, class_type))
        {
            if (info.overridable && !info.base)
            {
                auto name = info.type.TypeName();

                w.write_each<write_interface_override_method>(info.type.MethodList(), name);
            }
        };
    }


    static void write_call_factory(writer& w, TypeDef const& type, TypeDef const& factory)
    {
        std::string factory_name;

        if (type.TypeNamespace() == factory.TypeNamespace())
        {
            factory_name = factory.TypeName();
        }
        else
        {
            factory_name = w.write_temp("%", factory);
        }

        auto format = "impl::call_factory<%, %>([&](% const& f)";

        w.write(format,
            type.TypeName(),
            factory_name,
            factory_name);
    }

    static void write_class_override_constructors(writer& w, TypeDef const& type, std::map<std::string, factory_info> const& factories)
    {
        auto type_name = type.TypeName();

        auto format = R"(        %T(%)
        {
            % { [[maybe_unused]] auto winrt_impl_discarded = f.%(%%*this, this->m_inner); });
        }
)";

        for (auto&& [factory_name, factory] : factories)
        {
            if (!factory.composable)
            {
                continue;
            }

            for (auto&& method : factory.type.MethodList())
            {
                method_signature signature{ method };
                auto& params = signature.params();
                params.resize(params.size() - 2);

                w.write(format,
                    type_name,
                    bind<write_consume_params>(signature),
                    bind<write_call_factory>(type, factory.type),
                    get_name(method),
                    bind<write_consume_args>(signature),
                    signature.params().empty() ? "" : ", ");
            }
        }
    }


    static void write_class_override_usings(writer& w, get_interfaces_t const& required_interfaces)
    {
        std::map<std::string_view, std::set<std::string>> method_usage;

        for (auto&& [interface_name, info] : required_interfaces)
        {
            for (auto&& method : info.type.MethodList())
            {
                method_usage[get_name(method)].insert(interface_name);
            }
        }

        for (auto&& [method_name, interfaces] : method_usage)
        {
            if (interfaces.size() <= 1)
            {
                continue;
            }

            for (auto&& interface_name : interfaces)
            {
                w.write("        using impl::consume_t<D, %>::%;\n",
                    interface_name,
                    method_name);
            }
        }
    }



    static void write_interface_requires(writer& w, TypeDef const& type)
    {
        auto interfaces = get_interfaces(w, type);

        if (interfaces.empty())
        {
            return;
        }

        w.write(",\n        impl::require<%", type);

        for (auto&& [name, info] : interfaces)
        {
            w.write(", %", name);
        }

        w.write('>');
    }


    static void write_interface(writer& w, TypeDef const& type)
    {
      
    }

    static void write_delegate(writer& w, TypeDef const& type)
    {

    }

    static void write_delegate_implementation(writer& w, TypeDef const& type)
    {
      
    }


    static void write_class_requires(writer& w, TypeDef const& type)
    {
        bool first{ true };

        for (auto&& [interface_name, info] : get_interfaces(w, type))
        {
            if (!info.defaulted || info.base)
            {
                if (first)
                {
                    first = false;
                    w.write(",\n        impl::require<%", type.TypeName());
                }

                w.write(", %", interface_name);
            }
        }

        if (!first)
        {
            w.write('>');
        }
    }

    static void write_class_base(writer& w, TypeDef const& type)
    {
        bool first{ true };

        for (auto&& base : get_bases(type))
        {
            if (first)
            {
                first = false;
                w.write(",\n        impl::base<%", type.TypeName());
            }

            w.write(", %", base);
        }

        if (!first)
        {
            w.write('>');
        }
    }


    static void write_constructor_declarations(writer& w, TypeDef const& type)
    {

        w.write(R"^-^(    public init() {
        try! interface = RoActivateInstance(HString("%"))
    }

)^-^",
get_full_type_name(type));

        if (auto default_interface = get_default_interface(type))
        {
            w.write(R"^-^(    internal init(_ fromInterface: %) {
        interface = fromInterface
    }

)^-^",
get_type_name(default_interface));

        }
    }

    static void write_constructor_definition(writer& w, MethodDef const& method, TypeDef const& type, TypeDef const& factory)
    {

    }

    static void write_class_definitions(writer& w, TypeDef const& type)
    {
        if (settings.component_opt && settings.component_filter.includes(type))
        {
            return;
        }

        auto type_name = type.TypeName();
    }

    static void write_class_func_body(writer& w, winmd::reader::MethodDef method)
    {
        std::string_view funcName = method.Name();
        method_signature signature { method };

        auto return_sig = signature.return_signature();
        /*
        This code isn't ideal, but due to the difference in strings between Swift and WinRT
        we need to allocate an HString on the stack so that the lifetime is properly handled.
        If we pass the HString in directly to a function like this:
               interface.load(HString(url).get()).
        It doesn't work because the lifetime of the HString is shorter than the method
        it's passed into and so the string is destroyed before the load method is called.

         Also because the strings are different, we can't create something like an HStringReference,
         because the underlying buffers are differnet, we have to allocate a new HString to hold the
         memory.
        */
        indent extra_indent{ 0 };
        for (auto&& [param, param_signature] : signature.params())
        {
            if (get_category(param_signature->Type()) == param_category::string_type)
            {
                w.write("let _% = try! HString(%)\n",
                    param.Name(),
                    param.Name());

                extra_indent = { 1 };
            }
        }

        if (return_sig)
        {
            w.write("%let % = try! interface.%(",
                extra_indent,
                signature.return_param_name(),
                funcName);
        }
        else
        {
            w.write("%try! interface.%(",
                extra_indent,
                funcName);
        }

        std::string_view prefix = ""sv;

        for (auto&& [param, param_signature] : signature.params())
        {
            if (get_category(param_signature->Type()) == param_category::string_type)
            {
                w.write("%_%.get()",
                    prefix,
                    param.Name());
            }
            else if (param.Flags().In())
            {
                w.write("%%",
                    prefix,
                    bind<write_convert_to_abi_arg>(param.Name(), param_signature->Type()));
            }
            else
            {
                XLANG_ASSERT("**TODO: write_class_func_body**");
            }

            prefix = ", ";

        }

        w.write(")");

        if (return_sig)
        {
            w.write(R"(
    return % )", bind<write_consume_return_type>(signature, false));
        }
    }

    static void write_class_impl_property(writer& w, winmd::reader::Property prop)
    {
        auto format = "    public var % : % {\n";

        auto [getter, setter] = get_property_methods(prop);
        w.write(format,
            prop.Name(),
            prop.Type().Type());

        if (getter)
        {
            auto format = R"(get {
    let value = try! interface.%()
    return %
}

)";
            auto guard = w.push_indent(indent{ 2 });
            method_signature signature{ getter };
            w.write(format,
                getter.Name(),
                bind<write_consume_return_type>(signature, false));
        }

        if (setter)
        {
            auto format = R"(set {
    try! interface.%(%) 
}
)";
            auto guard = w.push_indent(indent{ 2 });

            w.write(format,
                setter.Name(),
                bind<write_convert_to_abi_arg>("newValue", prop.Type().Type()));
        }
        
        w.write("    }\n");
    }

    static void write_class_impl_func(writer& w, winmd::reader::MethodDef method)
    {
        if (method.SpecialName())
        {
            // don't write methods which are really properties
            return;
        }

        auto format = R"(public func %(%) %{
    %
}

)";
        method_signature signature{ method };

        auto return_sig = signature.return_signature();
        auto guard = w.push_indent(indent{ 1 });
        w.write(format,
            method.Name(), 
            bind<write_swift_params>(signature),
            bind<write_return_type_declaration>(signature),
            bind<write_class_func_body>(method));
    }

    static void write_class_impl(writer& w, TypeDef const& type, coded_index<TypeDefOrRef> const& base_type)
    {
        if (auto default_interface = get_default_interface(type))
        {
            auto type_name = type.TypeName();
            w.write("public class % {\n", type_name);

            w.write("   internal var interface : %\n\n", get_type_name(default_interface));

            write_constructor_declarations(w, type);

            for (auto&& [interface_name, info] : get_interfaces(w, type))
            {
                for (auto&& method : info.type.MethodList())
                {
                    write_class_impl_func(w, method);
                }

                for (auto&& prop : info.type.PropertyList())
                {
                    write_class_impl_property(w, prop);
                }

            }

            w.write("}\n\n");
        }
    }


    static void write_static_class(writer& w, TypeDef const& type)
    {
      
    }

    static void write_class(writer& w, TypeDef const& type)
    {
        if (auto default_interface = get_default_interface(type))
        {
            write_class_impl(w, type, default_interface);
        }
        else
        {
            write_static_class(w, type);
        }
    }

    static void write_std_hash(writer& w, TypeDef const& type)
    {
        auto generics = type.GenericParam();

        w.write("    template<%> struct hash<%> : winrt::impl::hash_base {};\n",
            bind<write_generic_typenames>(generics),
            type);
    }


}
