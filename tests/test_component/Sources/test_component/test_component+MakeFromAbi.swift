// WARNING: Please don't edit this file. It was generated by Swift/WinRT v0.0.1
// swiftlint:disable all
import Ctest_component

fileprivate func makeIAsyncActionFrom(abi: test_component.IInspectable) -> Any {
    let swiftAbi: __ABI_Windows_Foundation.IAsyncAction = try! abi.QueryInterface()
    return __IMPL_Windows_Foundation.IAsyncActionBridge.from(abi: RawPointer(swiftAbi))!
}

fileprivate func makeIAsyncInfoFrom(abi: test_component.IInspectable) -> Any {
    let swiftAbi: __ABI_Windows_Foundation.IAsyncInfo = try! abi.QueryInterface()
    return __IMPL_Windows_Foundation.IAsyncInfoBridge.from(abi: RawPointer(swiftAbi))!
}

fileprivate func makeIClosableFrom(abi: test_component.IInspectable) -> Any {
    let swiftAbi: __ABI_Windows_Foundation.IClosable = try! abi.QueryInterface()
    return __IMPL_Windows_Foundation.IClosableBridge.from(abi: RawPointer(swiftAbi))!
}

fileprivate func makeIStringableFrom(abi: test_component.IInspectable) -> Any {
    let swiftAbi: __ABI_Windows_Foundation.IStringable = try! abi.QueryInterface()
    return __IMPL_Windows_Foundation.IStringableBridge.from(abi: RawPointer(swiftAbi))!
}

fileprivate func makeIPropertySetFrom(abi: test_component.IInspectable) -> Any {
    let swiftAbi: __ABI_Windows_Foundation_Collections.IPropertySet = try! abi.QueryInterface()
    return __IMPL_Windows_Foundation_Collections.IPropertySetBridge.from(abi: RawPointer(swiftAbi))!
}

fileprivate func makeIVectorChangedEventArgsFrom(abi: test_component.IInspectable) -> Any {
    let swiftAbi: __ABI_Windows_Foundation_Collections.IVectorChangedEventArgs = try! abi.QueryInterface()
    return __IMPL_Windows_Foundation_Collections.IVectorChangedEventArgsBridge.from(abi: RawPointer(swiftAbi))!
}

fileprivate func makeIAsyncMethodsWithProgressFrom(abi: test_component.IInspectable) -> Any {
    let swiftAbi: __ABI_test_component.IAsyncMethodsWithProgress = try! abi.QueryInterface()
    return __IMPL_test_component.IAsyncMethodsWithProgressBridge.from(abi: RawPointer(swiftAbi))!
}

fileprivate func makeIAsyncOperationIntFrom(abi: test_component.IInspectable) -> Any {
    let swiftAbi: __ABI_test_component.IAsyncOperationInt = try! abi.QueryInterface()
    return __IMPL_test_component.IAsyncOperationIntBridge.from(abi: RawPointer(swiftAbi))!
}

fileprivate func makeIBasicFrom(abi: test_component.IInspectable) -> Any {
    let swiftAbi: __ABI_test_component.IBasic = try! abi.QueryInterface()
    return __IMPL_test_component.IBasicBridge.from(abi: RawPointer(swiftAbi))!
}

fileprivate func makeIIAmImplementableFrom(abi: test_component.IInspectable) -> Any {
    let swiftAbi: __ABI_test_component.IIAmImplementable = try! abi.QueryInterface()
    return __IMPL_test_component.IIAmImplementableBridge.from(abi: RawPointer(swiftAbi))!
}

fileprivate func makeIInterfaceWithObservableVectorFrom(abi: test_component.IInspectable) -> Any {
    let swiftAbi: __ABI_test_component.IInterfaceWithObservableVector = try! abi.QueryInterface()
    return __IMPL_test_component.IInterfaceWithObservableVectorBridge.from(abi: RawPointer(swiftAbi))!
}

fileprivate func makeISimpleDelegateFrom(abi: test_component.IInspectable) -> Any {
    let swiftAbi: __ABI_test_component.ISimpleDelegate = try! abi.QueryInterface()
    return __IMPL_test_component.ISimpleDelegateBridge.from(abi: RawPointer(swiftAbi))!
}

fileprivate func makeInterfaceWithReturnDelegateFrom(abi: test_component.IInspectable) -> Any {
    let swiftAbi: __ABI_test_component.InterfaceWithReturnDelegate = try! abi.QueryInterface()
    return __IMPL_test_component.InterfaceWithReturnDelegateBridge.from(abi: RawPointer(swiftAbi))!
}

fileprivate func makeWithKeywordFrom(abi: test_component.IInspectable) -> Any {
    let swiftAbi: __ABI_test_component.WithKeyword = try! abi.QueryInterface()
    return __IMPL_test_component.WithKeywordBridge.from(abi: RawPointer(swiftAbi))!
}

fileprivate func makeDeferralFrom(abi: test_component.IInspectable) -> Any {
    return Deferral(fromAbi: abi)
}

fileprivate func makePropertySetFrom(abi: test_component.IInspectable) -> Any {
    return PropertySet(fromAbi: abi)
}

fileprivate func makeStringMapFrom(abi: test_component.IInspectable) -> Any {
    return StringMap(fromAbi: abi)
}

fileprivate func makeValueSetFrom(abi: test_component.IInspectable) -> Any {
    return ValueSet(fromAbi: abi)
}

fileprivate func makeAsyncOperationIntFrom(abi: test_component.IInspectable) -> Any {
    return AsyncOperationInt(fromAbi: abi)
}

fileprivate func makeBaseFrom(abi: test_component.IInspectable) -> Any {
    return Base(fromAbi: abi)
}

fileprivate func makeBaseCollectionFrom(abi: test_component.IInspectable) -> Any {
    return BaseCollection(fromAbi: abi)
}

fileprivate func makeBaseMapCollectionFrom(abi: test_component.IInspectable) -> Any {
    return BaseMapCollection(fromAbi: abi)
}

fileprivate func makeBaseNoOverridesFrom(abi: test_component.IInspectable) -> Any {
    return BaseNoOverrides(fromAbi: abi)
}

fileprivate func makeBaseObservableCollectionFrom(abi: test_component.IInspectable) -> Any {
    return BaseObservableCollection(fromAbi: abi)
}

fileprivate func makeClassFrom(abi: test_component.IInspectable) -> Any {
    return Class(fromAbi: abi)
}

fileprivate func makeCollectionTesterFrom(abi: test_component.IInspectable) -> Any {
    return CollectionTester(fromAbi: abi)
}

fileprivate func makeDeferrableEventArgsFrom(abi: test_component.IInspectable) -> Any {
    return DeferrableEventArgs(fromAbi: abi)
}

fileprivate func makeDerivedFrom(abi: test_component.IInspectable) -> Any {
    return Derived(fromAbi: abi)
}

fileprivate func makeDerivedFromNoConstructorFrom(abi: test_component.IInspectable) -> Any {
    return DerivedFromNoConstructor(fromAbi: abi)
}

fileprivate func makeEventTesterFrom(abi: test_component.IInspectable) -> Any {
    return EventTester(fromAbi: abi)
}

fileprivate func makeNoopClosableFrom(abi: test_component.IInspectable) -> Any {
    return NoopClosable(fromAbi: abi)
}

fileprivate func makeSimpleFrom(abi: test_component.IInspectable) -> Any {
    return Simple(fromAbi: abi)
}

fileprivate func makeUnsealedDerivedFrom(abi: test_component.IInspectable) -> Any {
    return UnsealedDerived(fromAbi: abi)
}

fileprivate func makeUnsealedDerived2From(abi: test_component.IInspectable) -> Any {
    return UnsealedDerived2(fromAbi: abi)
}

fileprivate func makeUnsealedDerivedFromNoConstructorFrom(abi: test_component.IInspectable) -> Any {
    return UnsealedDerivedFromNoConstructor(fromAbi: abi)
}

fileprivate func makeUnsealedDerivedNoConstructorFrom(abi: test_component.IInspectable) -> Any {
    return UnsealedDerivedNoConstructor(fromAbi: abi)
}

fileprivate func makeUnsealedDerivedNoOverridesFrom(abi: test_component.IInspectable) -> Any {
    return UnsealedDerivedNoOverrides(fromAbi: abi)
}

@_spi(__MakeFromAbi_DoNotImport)
public class __MakeFromAbi: MakeFromAbi {
    public static func from(typeName: String, abi: test_component.IInspectable) -> Any? {
        switch typeName {
            case "IAsyncAction": return makeIAsyncActionFrom(abi: abi)
            case "IAsyncInfo": return makeIAsyncInfoFrom(abi: abi)
            case "IClosable": return makeIClosableFrom(abi: abi)
            case "IStringable": return makeIStringableFrom(abi: abi)
            case "IPropertySet": return makeIPropertySetFrom(abi: abi)
            case "IVectorChangedEventArgs": return makeIVectorChangedEventArgsFrom(abi: abi)
            case "IAsyncMethodsWithProgress": return makeIAsyncMethodsWithProgressFrom(abi: abi)
            case "IAsyncOperationInt": return makeIAsyncOperationIntFrom(abi: abi)
            case "IBasic": return makeIBasicFrom(abi: abi)
            case "IIAmImplementable": return makeIIAmImplementableFrom(abi: abi)
            case "IInterfaceWithObservableVector": return makeIInterfaceWithObservableVectorFrom(abi: abi)
            case "ISimpleDelegate": return makeISimpleDelegateFrom(abi: abi)
            case "InterfaceWithReturnDelegate": return makeInterfaceWithReturnDelegateFrom(abi: abi)
            case "WithKeyword": return makeWithKeywordFrom(abi: abi)
            case "Deferral": return makeDeferralFrom(abi: abi)
            case "PropertySet": return makePropertySetFrom(abi: abi)
            case "StringMap": return makeStringMapFrom(abi: abi)
            case "ValueSet": return makeValueSetFrom(abi: abi)
            case "AsyncOperationInt": return makeAsyncOperationIntFrom(abi: abi)
            case "Base": return makeBaseFrom(abi: abi)
            case "BaseCollection": return makeBaseCollectionFrom(abi: abi)
            case "BaseMapCollection": return makeBaseMapCollectionFrom(abi: abi)
            case "BaseNoOverrides": return makeBaseNoOverridesFrom(abi: abi)
            case "BaseObservableCollection": return makeBaseObservableCollectionFrom(abi: abi)
            case "Class": return makeClassFrom(abi: abi)
            case "CollectionTester": return makeCollectionTesterFrom(abi: abi)
            case "DeferrableEventArgs": return makeDeferrableEventArgsFrom(abi: abi)
            case "Derived": return makeDerivedFrom(abi: abi)
            case "DerivedFromNoConstructor": return makeDerivedFromNoConstructorFrom(abi: abi)
            case "EventTester": return makeEventTesterFrom(abi: abi)
            case "NoopClosable": return makeNoopClosableFrom(abi: abi)
            case "Simple": return makeSimpleFrom(abi: abi)
            case "UnsealedDerived": return makeUnsealedDerivedFrom(abi: abi)
            case "UnsealedDerived2": return makeUnsealedDerived2From(abi: abi)
            case "UnsealedDerivedFromNoConstructor": return makeUnsealedDerivedFromNoConstructorFrom(abi: abi)
            case "UnsealedDerivedNoConstructor": return makeUnsealedDerivedNoConstructorFrom(abi: abi)
            case "UnsealedDerivedNoOverrides": return makeUnsealedDerivedNoOverridesFrom(abi: abi)
            default: return nil
        }
    }
}
