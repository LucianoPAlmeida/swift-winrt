// WARNING: Please don't edit this file. It was generated by Swift/WinRT v0.0.1
// swiftlint:disable all
import Ctest_component

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.collectionchange)
public typealias CollectionChange = __x_ABI_CWindows_CFoundation_CCollections_CCollectionChange
/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset)
public final class PropertySet : WinRTClass, IObservableMap, IMap, IIterable, IPropertySet {
    public typealias K = String
    public typealias V = Any?
    public typealias T = AnyIKeyValuePair<String, Any?>?
    private typealias SwiftABI = __ABI_Windows_Foundation_Collections.IPropertySet
    private typealias CABI = __x_ABI_CWindows_CFoundation_CCollections_CIPropertySet
    private var _default: SwiftABI!
    public func _getABI<T>() -> UnsafeMutablePointer<T>? {
        if T.self == CABI.self {
            return RawPointer(_default)
        }   
        if T.self == NativeIInspectable.self {
            return RawPointer(_default)
        }
        if T.self == NativeIUnknown.self {
            return RawPointer(_default)
        }
        return nil
    }

    public var thisPtr: test_component.IInspectable { _default }

    public static func from(abi: UnsafeMutablePointer<__x_ABI_CWindows_CFoundation_CCollections_CIPropertySet>?) -> PropertySet? {
        guard let abi = abi else { return nil }
        return .init(fromAbi: .init(abi))
    }

    public init(fromAbi: test_component.IInspectable) {
        _default = try! fromAbi.QueryInterface()
    }

    public func queryInterface(_ iid: test_component.IID) -> IUnknownRef? {
        return test_component.queryInterface(sealed: self, iid)}
    public init() {
        try! _default = RoActivateInstance(HString("Windows.Foundation.Collections.PropertySet"))
    }

    internal lazy var _IObservableMap: IObservableMapString_Any = try! _default.QueryInterface()
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset.mapchanged)
    public lazy var mapChanged : Event<MapChangedEventHandler<String, Any?>> = {
      .init(
        add: { [weak this = _IObservableMap] in
          guard let this else { return .init() }
          let wrapper = test_component.__x_ABI_C__FMapChangedEventHandler_2_HSTRING_IInspectableWrapper($0)
          let abi = try! wrapper?.toABI { $0 }
          return try! this.add_MapChangedImpl(abi)
        },
        remove: { [weak this = _IObservableMap] in
         try? this?.remove_MapChangedImpl($0) 
       }
      )
    }()

    internal lazy var _IMap: IMapString_Any = try! _default.QueryInterface()
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset.lookup)
    public func lookup(_ key: String) -> Any? {
        let _key = try! HString(key)
        let result = try! _IMap.LookupImpl(_key.get())
        return __ABI_.AnyWrapper.unwrapFrom(abi: result)
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset.haskey)
    public func hasKey(_ key: String) -> Bool {
        let _key = try! HString(key)
        let result = try! _IMap.HasKeyImpl(_key.get())
        return .init(from: result)
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset.getview)
    public func getView() -> AnyIMapView<String, Any?>? {
        let result = try! _IMap.GetViewImpl()
        return test_component.__x_ABI_C__FIMapView_2_HSTRING_IInspectableWrapper.unwrapFrom(abi: result)
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset.insert)
    public func insert(_ key: String, _ value: Any?) -> Bool {
        let _key = try! HString(key)
        let valueWrapper = __ABI_.AnyWrapper(value)
        let _value = try! valueWrapper?.toABI { $0 }
        let result = try! _IMap.InsertImpl(_key.get(), _value)
        return .init(from: result)
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset.remove)
    public func remove(_ key: String) {
        let _key = try! HString(key)
        try! _IMap.RemoveImpl(_key.get())
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset.clear)
    public func clear() {
        try! _IMap.ClearImpl()
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset.size)
    public var size : UInt32 {
        get {
            let result = try! _IMap.get_SizeImpl()
            return result
        }

    }

    internal lazy var _IIterable: IIterableIKeyValuePairString_Any = try! _default.QueryInterface()
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset.first)
    public func first() -> AnyIIterator<AnyIKeyValuePair<String, Any?>?>? {
        let result = try! _IIterable.FirstImpl()
        return test_component.__x_ABI_C__FIIterator_1___x_ABI_C__FIKeyValuePair_2_HSTRING_IInspectableWrapper.unwrapFrom(abi: result)
    }

}

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap)
public final class StringMap : WinRTClass, IMap, IIterable, IObservableMap {
    public typealias K = String
    public typealias V = String
    public typealias T = AnyIKeyValuePair<String, String>?
    private typealias SwiftABI = IMapString_String
    private typealias CABI = __x_ABI_C__FIMap_2_HSTRING_HSTRING
    private var _default: SwiftABI!
    public func _getABI<T>() -> UnsafeMutablePointer<T>? {
        if T.self == CABI.self {
            return RawPointer(_default)
        }   
        if T.self == NativeIInspectable.self {
            return RawPointer(_default)
        }
        if T.self == NativeIUnknown.self {
            return RawPointer(_default)
        }
        return nil
    }

    public var thisPtr: test_component.IInspectable { _default }

    public static func from(abi: UnsafeMutablePointer<__x_ABI_C__FIMap_2_HSTRING_HSTRING>?) -> StringMap? {
        guard let abi = abi else { return nil }
        return .init(fromAbi: .init(abi))
    }

    public init(fromAbi: test_component.IInspectable) {
        _default = try! fromAbi.QueryInterface()
    }

    public func queryInterface(_ iid: test_component.IID) -> IUnknownRef? {
        return test_component.queryInterface(sealed: self, iid)}
    public init() {
        try! _default = RoActivateInstance(HString("Windows.Foundation.Collections.StringMap"))
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap.lookup)
    public func lookup(_ key: String) -> String {
        let _key = try! HString(key)
        let result = try! _default.LookupImpl(_key.get())
        return .init(from: result)
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap.haskey)
    public func hasKey(_ key: String) -> Bool {
        let _key = try! HString(key)
        let result = try! _default.HasKeyImpl(_key.get())
        return .init(from: result)
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap.getview)
    public func getView() -> AnyIMapView<String, String>? {
        let result = try! _default.GetViewImpl()
        return test_component.__x_ABI_C__FIMapView_2_HSTRING_HSTRINGWrapper.unwrapFrom(abi: result)
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap.insert)
    public func insert(_ key: String, _ value: String) -> Bool {
        let _key = try! HString(key)
        let _value = try! HString(value)
        let result = try! _default.InsertImpl(_key.get(), _value.get())
        return .init(from: result)
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap.remove)
    public func remove(_ key: String) {
        let _key = try! HString(key)
        try! _default.RemoveImpl(_key.get())
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap.clear)
    public func clear() {
        try! _default.ClearImpl()
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap.size)
    public var size : UInt32 {
        get {
            let result = try! _default.get_SizeImpl()
            return result
        }

    }

    internal lazy var _IIterable: IIterableIKeyValuePairString_String = try! _default.QueryInterface()
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap.first)
    public func first() -> AnyIIterator<AnyIKeyValuePair<String, String>?>? {
        let result = try! _IIterable.FirstImpl()
        return test_component.__x_ABI_C__FIIterator_1___x_ABI_C__FIKeyValuePair_2_HSTRING_HSTRINGWrapper.unwrapFrom(abi: result)
    }

    internal lazy var _IObservableMap: IObservableMapString_String = try! _default.QueryInterface()
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap.mapchanged)
    public lazy var mapChanged : Event<MapChangedEventHandler<String, String>> = {
      .init(
        add: { [weak this = _IObservableMap] in
          guard let this else { return .init() }
          let wrapper = test_component.__x_ABI_C__FMapChangedEventHandler_2_HSTRING_HSTRINGWrapper($0)
          let abi = try! wrapper?.toABI { $0 }
          return try! this.add_MapChangedImpl(abi)
        },
        remove: { [weak this = _IObservableMap] in
         try? this?.remove_MapChangedImpl($0) 
       }
      )
    }()

}

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset)
public final class ValueSet : WinRTClass, IObservableMap, IMap, IIterable, IPropertySet {
    public typealias K = String
    public typealias V = Any?
    public typealias T = AnyIKeyValuePair<String, Any?>?
    private typealias SwiftABI = __ABI_Windows_Foundation_Collections.IPropertySet
    private typealias CABI = __x_ABI_CWindows_CFoundation_CCollections_CIPropertySet
    private var _default: SwiftABI!
    public func _getABI<T>() -> UnsafeMutablePointer<T>? {
        if T.self == CABI.self {
            return RawPointer(_default)
        }   
        if T.self == NativeIInspectable.self {
            return RawPointer(_default)
        }
        if T.self == NativeIUnknown.self {
            return RawPointer(_default)
        }
        return nil
    }

    public var thisPtr: test_component.IInspectable { _default }

    public static func from(abi: UnsafeMutablePointer<__x_ABI_CWindows_CFoundation_CCollections_CIPropertySet>?) -> ValueSet? {
        guard let abi = abi else { return nil }
        return .init(fromAbi: .init(abi))
    }

    public init(fromAbi: test_component.IInspectable) {
        _default = try! fromAbi.QueryInterface()
    }

    public func queryInterface(_ iid: test_component.IID) -> IUnknownRef? {
        return test_component.queryInterface(sealed: self, iid)}
    public init() {
        try! _default = RoActivateInstance(HString("Windows.Foundation.Collections.ValueSet"))
    }

    internal lazy var _IObservableMap: IObservableMapString_Any = try! _default.QueryInterface()
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset.mapchanged)
    public lazy var mapChanged : Event<MapChangedEventHandler<String, Any?>> = {
      .init(
        add: { [weak this = _IObservableMap] in
          guard let this else { return .init() }
          let wrapper = test_component.__x_ABI_C__FMapChangedEventHandler_2_HSTRING_IInspectableWrapper($0)
          let abi = try! wrapper?.toABI { $0 }
          return try! this.add_MapChangedImpl(abi)
        },
        remove: { [weak this = _IObservableMap] in
         try? this?.remove_MapChangedImpl($0) 
       }
      )
    }()

    internal lazy var _IMap: IMapString_Any = try! _default.QueryInterface()
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset.lookup)
    public func lookup(_ key: String) -> Any? {
        let _key = try! HString(key)
        let result = try! _IMap.LookupImpl(_key.get())
        return __ABI_.AnyWrapper.unwrapFrom(abi: result)
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset.haskey)
    public func hasKey(_ key: String) -> Bool {
        let _key = try! HString(key)
        let result = try! _IMap.HasKeyImpl(_key.get())
        return .init(from: result)
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset.getview)
    public func getView() -> AnyIMapView<String, Any?>? {
        let result = try! _IMap.GetViewImpl()
        return test_component.__x_ABI_C__FIMapView_2_HSTRING_IInspectableWrapper.unwrapFrom(abi: result)
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset.insert)
    public func insert(_ key: String, _ value: Any?) -> Bool {
        let _key = try! HString(key)
        let valueWrapper = __ABI_.AnyWrapper(value)
        let _value = try! valueWrapper?.toABI { $0 }
        let result = try! _IMap.InsertImpl(_key.get(), _value)
        return .init(from: result)
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset.remove)
    public func remove(_ key: String) {
        let _key = try! HString(key)
        try! _IMap.RemoveImpl(_key.get())
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset.clear)
    public func clear() {
        try! _IMap.ClearImpl()
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset.size)
    public var size : UInt32 {
        get {
            let result = try! _IMap.get_SizeImpl()
            return result
        }

    }

    internal lazy var _IIterable: IIterableIKeyValuePairString_Any = try! _default.QueryInterface()
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset.first)
    public func first() -> AnyIIterator<AnyIKeyValuePair<String, Any?>?>? {
        let result = try! _IIterable.FirstImpl()
        return test_component.__x_ABI_C__FIIterator_1___x_ABI_C__FIKeyValuePair_2_HSTRING_IInspectableWrapper.unwrapFrom(abi: result)
    }

}

public typealias MapChangedEventHandler<K,V> = (AnyIObservableMap<K, V>?, AnyIMapChangedEventArgs<K>?) -> ()
public typealias VectorChangedEventHandler<T> = (AnyIObservableVector<T>?, AnyIVectorChangedEventArgs?) -> ()
/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.iiterable-1)
public protocol IIterable<T> : WinRTInterface {
    associatedtype T
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.iiterable-1.first)
    func first() -> test_component.AnyIIterator<T>?
}

public typealias AnyIIterable<T> = any IIterable<T>

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.iiterator-1)
public protocol IIterator<T> : WinRTInterface {
    associatedtype T
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.iiterator-1.movenext)
    func moveNext() -> Bool
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.iiterator-1.current)
    var current: T { get }
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.iiterator-1.hascurrent)
    var hasCurrent: Bool { get }
}

public typealias AnyIIterator<T> = any IIterator<T>

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ikeyvaluepair-2)
public protocol IKeyValuePair<K,V> : WinRTInterface {
    associatedtype K
    associatedtype V
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ikeyvaluepair-2.key)
    var key: K { get }
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ikeyvaluepair-2.value)
    var value: V { get }
}

public typealias AnyIKeyValuePair<K,V> = any IKeyValuePair<K,V>

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.imapchangedeventargs-1)
public protocol IMapChangedEventArgs<K> : WinRTInterface {
    associatedtype K
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.imapchangedeventargs-1.collectionchange)
    var collectionChange: test_component.CollectionChange { get }
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.imapchangedeventargs-1.key)
    var key: K { get }
}

public typealias AnyIMapChangedEventArgs<K> = any IMapChangedEventArgs<K>

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.imapview-2)
public protocol IMapView<K,V> : IIterable where T == AnyIKeyValuePair<K,V>? {
    associatedtype K
    associatedtype V
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.imapview-2.lookup)
    func lookup(_ key: K) -> V
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.imapview-2.haskey)
    func hasKey(_ key: K) -> Bool
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.imapview-2.split)
    func split(_ first: inout test_component.AnyIMapView<K, V>?, _ second: inout test_component.AnyIMapView<K, V>?)
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.imapview-2.size)
    var size: UInt32 { get }
}

public typealias AnyIMapView<K,V> = any IMapView<K,V>

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.imap-2)
public protocol IMap<K,V> : IIterable where T == AnyIKeyValuePair<K,V>? {
    associatedtype K
    associatedtype V
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.imap-2.lookup)
    func lookup(_ key: K) -> V
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.imap-2.haskey)
    func hasKey(_ key: K) -> Bool
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.imap-2.getview)
    func getView() -> test_component.AnyIMapView<K, V>?
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.imap-2.insert)
    func insert(_ key: K, _ value: V) -> Bool
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.imap-2.remove)
    func remove(_ key: K)
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.imap-2.clear)
    func clear()
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.imap-2.size)
    var size: UInt32 { get }
}

public typealias AnyIMap<K,V> = any IMap<K,V>

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.iobservablemap-2)
public protocol IObservableMap<K,V> : IIterable, IMap {
    associatedtype K
    associatedtype V
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.iobservablemap-2.mapchanged)
    var mapChanged: Event<MapChangedEventHandler<K,V>> { get }
}

public typealias AnyIObservableMap<K,V> = any IObservableMap<K,V>

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.iobservablevector-1)
public protocol IObservableVector<T> : IIterable, IVector {
    associatedtype T
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.iobservablevector-1.vectorchanged)
    var vectorChanged: Event<VectorChangedEventHandler<T>> { get }
}

public typealias AnyIObservableVector<T> = any IObservableVector<T>

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ipropertyset)
public protocol IPropertySet : IObservableMap<String, Any?>, IMap<String, Any?>, IIterable<AnyIKeyValuePair<String, Any?>?> {
}

extension IPropertySet {
    public func queryInterface(_ iid: test_component.IID) -> IUnknownRef? {
        switch iid {
            case __ABI_Windows_Foundation_Collections.IPropertySetWrapper.IID:
                let wrapper = __ABI_Windows_Foundation_Collections.IPropertySetWrapper(self)
                return wrapper!.queryInterface(iid)
            case test_component.__x_ABI_C__FIObservableMap_2_HSTRING_IInspectableWrapper.IID:
                let wrapper = test_component.__x_ABI_C__FIObservableMap_2_HSTRING_IInspectableWrapper(self)
                return wrapper!.queryInterface(iid)
            case test_component.__x_ABI_C__FIMap_2_HSTRING_IInspectableWrapper.IID:
                let wrapper = test_component.__x_ABI_C__FIMap_2_HSTRING_IInspectableWrapper(self)
                return wrapper!.queryInterface(iid)
            case test_component.__x_ABI_C__FIIterable_1___x_ABI_C__FIKeyValuePair_2_HSTRING_IInspectableWrapper.IID:
                let wrapper = test_component.__x_ABI_C__FIIterable_1___x_ABI_C__FIKeyValuePair_2_HSTRING_IInspectableWrapper(self)
                return wrapper!.queryInterface(iid)
            default: return nil
        }
    }
}
public typealias AnyIPropertySet = any IPropertySet

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivectorchangedeventargs)
public protocol IVectorChangedEventArgs : WinRTInterface {
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivectorchangedeventargs.collectionchange)
    var collectionChange: test_component.CollectionChange { get }
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivectorchangedeventargs.index)
    var index: UInt32 { get }
}

extension IVectorChangedEventArgs {
    public func queryInterface(_ iid: test_component.IID) -> IUnknownRef? {
        switch iid {
            case __ABI_Windows_Foundation_Collections.IVectorChangedEventArgsWrapper.IID:
                let wrapper = __ABI_Windows_Foundation_Collections.IVectorChangedEventArgsWrapper(self)
                return wrapper!.queryInterface(iid)
            default: return nil
        }
    }
}
public typealias AnyIVectorChangedEventArgs = any IVectorChangedEventArgs

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivectorview-1)
public protocol IVectorView<T> : IIterable, Collection where Element == T, Index == Int {
    associatedtype T
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivectorview-1.getat)
    func getAt(_ index: UInt32) -> T
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivectorview-1.indexof)
    func indexOf(_ value: T, _ index: inout UInt32) -> Bool
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivectorview-1.size)
    var size: UInt32 { get }
}

public typealias AnyIVectorView<T> = any IVectorView<T>

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1)
public protocol IVector<T> : IIterable, Collection where Element == T, Index == Int {
    associatedtype T
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.getat)
    func getAt(_ index: UInt32) -> T
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.getview)
    func getView() -> test_component.AnyIVectorView<T>?
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.indexof)
    func indexOf(_ value: T, _ index: inout UInt32) -> Bool
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.setat)
    func setAt(_ index: UInt32, _ value: T)
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.insertat)
    func insertAt(_ index: UInt32, _ value: T)
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.removeat)
    func removeAt(_ index: UInt32)
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.append)
    func append(_ value: T)
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.removeatend)
    func removeAtEnd()
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.clear)
    func clear()
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.size)
    var size: UInt32 { get }
}

public typealias AnyIVector<T> = any IVector<T>

extension test_component.CollectionChange {
    public static var reset : test_component.CollectionChange {
        CollectionChange_Reset
    }
    public static var itemInserted : test_component.CollectionChange {
        CollectionChange_ItemInserted
    }
    public static var itemRemoved : test_component.CollectionChange {
        CollectionChange_ItemRemoved
    }
    public static var itemChanged : test_component.CollectionChange {
        CollectionChange_ItemChanged
    }
}
extension test_component.CollectionChange: Hashable, Codable {}

