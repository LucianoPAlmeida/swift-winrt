// WARNING: Please don't edit this file. It was generated by Swift/WinRT v0.0.1
// swiftlint:disable all
import Ctest_component

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.asyncstatus)
public typealias AsyncStatus = __x_ABI_CWindows_CFoundation_CAsyncStatus
/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.propertytype)
public typealias PropertyType = __x_ABI_CWindows_CFoundation_CPropertyType
/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.deferral)
public final class Deferral : WinRTClass, IClosable {
    @_spi(WinRTInternal)
    private (set) public var _inner: test_component.IInspectable!
    private typealias SwiftABI = __ABI_Windows_Foundation.IDeferral
    private typealias CABI = __x_ABI_CWindows_CFoundation_CIDeferral
    private lazy var _default: SwiftABI! = try! _inner.QueryInterface()
    @_spi(WinRTInternal)
    public func _getABI<T>() -> UnsafeMutablePointer<T>? {
        if T.self == CABI.self {
            return RawPointer(_default)
        }
        if T.self == C_IInspectable.self {
            return RawPointer(_default)
        }
        if T.self == C_IUnknown.self {
            return RawPointer(_default)
        }
        return nil
    }

    public var thisPtr: test_component.IInspectable { try! _inner.QueryInterface() }

    @_spi(WinRTInternal)
    public static func from(abi: UnsafeMutablePointer<__x_ABI_CWindows_CFoundation_CIDeferral>?) -> Deferral? {
        guard let abi = abi else { return nil }
        return .init(fromAbi: test_component.IInspectable(consuming: abi))
    }

    @_spi(WinRTInternal)
    public init(fromAbi: test_component.IInspectable) {
        _inner = fromAbi
    }

    public func queryInterface(_ iid: test_component.IID) -> IUnknownRef? {
        return test_component.queryInterface(self, iid)
    }
    private static let _IDeferralFactory: __ABI_Windows_Foundation.IDeferralFactory = try! RoGetActivationFactory(HString("Windows.Foundation.Deferral"))
    public init(_ handler: DeferralCompletedHandler!) {
        _inner = try! Self._IDeferralFactory.CreateImpl(handler)
    }

    internal lazy var _IClosable: __ABI_Windows_Foundation.IClosable = try! _inner.QueryInterface()
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.deferral.close)
    public func close() throws {
        try _IClosable.CloseImpl()
    }

    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.deferral.complete)
    public func complete() throws {
        try _default.CompleteImpl()
    }

}

public typealias AsyncActionCompletedHandler = (AnyIAsyncAction?, AsyncStatus) -> ()
public typealias AsyncOperationCompletedHandler<TResult> = (AnyIAsyncOperation<TResult>?, AsyncStatus) -> ()
public typealias AsyncOperationProgressHandler<TResult,TProgress> = (AnyIAsyncOperationWithProgress<TResult, TProgress>?, TProgress) -> ()
public typealias AsyncOperationWithProgressCompletedHandler<TResult,TProgress> = (AnyIAsyncOperationWithProgress<TResult, TProgress>?, AsyncStatus) -> ()
public typealias DeferralCompletedHandler = () -> ()
public typealias EventHandler<T> = (Any?, T) -> ()
public typealias TypedEventHandler<TSender,TResult> = (TSender, TResult) -> ()
/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.datetime)
public struct DateTime: Hashable, Codable {
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.datetime.universaltime)
    public var universalTime: Int64 = 0
    public init() {}
    public init(universalTime: Int64) {
        self.universalTime = universalTime
    }
    public static func from(abi: __x_ABI_CWindows_CFoundation_CDateTime) -> DateTime {
        .init(universalTime: abi.UniversalTime)
    }
}

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.point)
public struct Point: Hashable, Codable {
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.point.x)
    public var x: Float = 0.0
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.point.y)
    public var y: Float = 0.0
    public init() {}
    public init(x: Float, y: Float) {
        self.x = x
        self.y = y
    }
    public static func from(abi: __x_ABI_CWindows_CFoundation_CPoint) -> Point {
        .init(x: abi.X, y: abi.Y)
    }
}

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.rect)
public struct Rect: Hashable, Codable {
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.rect.x)
    public var x: Float = 0.0
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.rect.y)
    public var y: Float = 0.0
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.rect.width)
    public var width: Float = 0.0
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.rect.height)
    public var height: Float = 0.0
    public init() {}
    public init(x: Float, y: Float, width: Float, height: Float) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    }
    public static func from(abi: __x_ABI_CWindows_CFoundation_CRect) -> Rect {
        .init(x: abi.X, y: abi.Y, width: abi.Width, height: abi.Height)
    }
}

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.size)
public struct Size: Hashable, Codable {
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.size.width)
    public var width: Float = 0.0
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.size.height)
    public var height: Float = 0.0
    public init() {}
    public init(width: Float, height: Float) {
        self.width = width
        self.height = height
    }
    public static func from(abi: __x_ABI_CWindows_CFoundation_CSize) -> Size {
        .init(width: abi.Width, height: abi.Height)
    }
}

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.timespan)
public struct TimeSpan: Hashable, Codable {
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.timespan.duration)
    public var duration: Int64 = 0
    public init() {}
    public init(duration: Int64) {
        self.duration = duration
    }
    public static func from(abi: __x_ABI_CWindows_CFoundation_CTimeSpan) -> TimeSpan {
        .init(duration: abi.Duration)
    }
}

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.iasyncaction)
public protocol IAsyncAction : IAsyncInfo {
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.iasyncaction.getresults)
    func getResults() throws
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.iasyncaction.completed)
    var completed: test_component.AsyncActionCompletedHandler! { get set }
}

extension IAsyncAction {
    public func queryInterface(_ iid: test_component.IID) -> IUnknownRef? {
        switch iid {
            case __ABI_Windows_Foundation.IAsyncActionWrapper.IID:
                let wrapper = __ABI_Windows_Foundation.IAsyncActionWrapper(self)
                return wrapper!.queryInterface(iid)
            case __ABI_Windows_Foundation.IAsyncInfoWrapper.IID:
                let wrapper = __ABI_Windows_Foundation.IAsyncInfoWrapper(self)
                return wrapper!.queryInterface(iid)
            default: return nil
        }
    }
}
public typealias AnyIAsyncAction = any IAsyncAction

public extension IAsyncAction {
    func get() async throws {
        if status == .started {
            let event = WaitableEvent()
            completed = { _, _ in
                Task { await event.signal() }
            }
            await event.wait()
        }
        return try getResults()
    }
}

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.iasyncinfo)
public protocol IAsyncInfo : WinRTInterface {
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.iasyncinfo.cancel)
    func cancel() throws
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.iasyncinfo.close)
    func close() throws
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.iasyncinfo.errorcode)
    var errorCode: HRESULT { get }
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.iasyncinfo.id)
    var id: UInt32 { get }
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.iasyncinfo.status)
    var status: test_component.AsyncStatus { get }
}

extension IAsyncInfo {
    public func queryInterface(_ iid: test_component.IID) -> IUnknownRef? {
        switch iid {
            case __ABI_Windows_Foundation.IAsyncInfoWrapper.IID:
                let wrapper = __ABI_Windows_Foundation.IAsyncInfoWrapper(self)
                return wrapper!.queryInterface(iid)
            default: return nil
        }
    }
}
public typealias AnyIAsyncInfo = any IAsyncInfo

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.iasyncoperationwithprogress-2)
public protocol IAsyncOperationWithProgress<TResult,TProgress> : IAsyncInfo {
    associatedtype TResult
    associatedtype TProgress
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.iasyncoperationwithprogress-2.getresults)
    func getResults() throws -> TResult
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.iasyncoperationwithprogress-2.progress)
    var progress: test_component.AsyncOperationProgressHandler<TResult, TProgress>? { get set }
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.iasyncoperationwithprogress-2.completed)
    var completed: test_component.AsyncOperationWithProgressCompletedHandler<TResult, TProgress>? { get set }
}

public typealias AnyIAsyncOperationWithProgress<TResult,TProgress> = any IAsyncOperationWithProgress<TResult,TProgress>

public extension IAsyncOperationWithProgress {
    func get() async throws -> TResult {
        if status == .started {
            let event = WaitableEvent()
            completed = { _, _ in
                Task { await event.signal() }
            }
            await event.wait()
        }
        return try getResults()
    }
}

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.iasyncoperation-1)
public protocol IAsyncOperation<TResult> : IAsyncInfo {
    associatedtype TResult
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.iasyncoperation-1.getresults)
    func getResults() throws -> TResult
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.iasyncoperation-1.completed)
    var completed: test_component.AsyncOperationCompletedHandler<TResult>? { get set }
}

public typealias AnyIAsyncOperation<TResult> = any IAsyncOperation<TResult>

public extension IAsyncOperation {
    func get() async throws -> TResult {
        if status == .started {
            let event = WaitableEvent()
            completed = { _, _ in
                Task { await event.signal() }
            }
            await event.wait()
        }
        return try getResults()
    }
}

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.iclosable)
public protocol IClosable : WinRTInterface {
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.iclosable.close)
    func close() throws
}

extension IClosable {
    public func queryInterface(_ iid: test_component.IID) -> IUnknownRef? {
        switch iid {
            case __ABI_Windows_Foundation.IClosableWrapper.IID:
                let wrapper = __ABI_Windows_Foundation.IClosableWrapper(self)
                return wrapper!.queryInterface(iid)
            default: return nil
        }
    }
}
public typealias AnyIClosable = any IClosable

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue)
public protocol IPropertyValue : WinRTInterface {
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getuint8)
    func getUInt8() throws -> UInt8
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getint16)
    func getInt16() throws -> Int16
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getuint16)
    func getUInt16() throws -> UInt16
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getint32)
    func getInt32() throws -> Int32
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getuint32)
    func getUInt32() throws -> UInt32
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getint64)
    func getInt64() throws -> Int64
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getuint64)
    func getUInt64() throws -> UInt64
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getsingle)
    func getSingle() throws -> Float
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getdouble)
    func getDouble() throws -> Double
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getchar16)
    func getChar16() throws -> Character
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getboolean)
    func getBoolean() throws -> Bool
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getstring)
    func getString() throws -> String
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getguid)
    func getGuid() throws -> test_component.GUID
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getdatetime)
    func getDateTime() throws -> test_component.DateTime
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.gettimespan)
    func getTimeSpan() throws -> test_component.TimeSpan
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getpoint)
    func getPoint() throws -> test_component.Point
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getsize)
    func getSize() throws -> test_component.Size
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getrect)
    func getRect() throws -> test_component.Rect
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.isnumericscalar)
    var isNumericScalar: Bool { get }
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.type)
    var type: test_component.PropertyType { get }
}

public typealias AnyIPropertyValue = any IPropertyValue

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ireference-1)
public protocol IReference<T> : IPropertyValue {
    associatedtype T
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.ireference-1.value)
    var value: T { get }
}

public typealias AnyIReference<T> = any IReference<T>

/// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.istringable)
public protocol IStringable : WinRTInterface {
    /// [Open Microsoft documentation](https://learn.microsoft.com/uwp/api/windows.foundation.istringable.tostring)
    func toString() throws -> String
}

extension IStringable {
    public func queryInterface(_ iid: test_component.IID) -> IUnknownRef? {
        switch iid {
            case __ABI_Windows_Foundation.IStringableWrapper.IID:
                let wrapper = __ABI_Windows_Foundation.IStringableWrapper(self)
                return wrapper!.queryInterface(iid)
            default: return nil
        }
    }
}
public typealias AnyIStringable = any IStringable

extension test_component.AsyncStatus {
    public static var canceled : test_component.AsyncStatus {
        __x_ABI_CWindows_CFoundation_CAsyncStatus_Canceled
    }
    public static var completed : test_component.AsyncStatus {
        __x_ABI_CWindows_CFoundation_CAsyncStatus_Completed
    }
    public static var error : test_component.AsyncStatus {
        __x_ABI_CWindows_CFoundation_CAsyncStatus_Error
    }
    public static var started : test_component.AsyncStatus {
        __x_ABI_CWindows_CFoundation_CAsyncStatus_Started
    }
}
extension test_component.AsyncStatus: @retroactive Hashable, @retroactive Codable {}

extension test_component.PropertyType {
    public static var empty : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Empty
    }
    public static var uint8 : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_UInt8
    }
    public static var int16 : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Int16
    }
    public static var uint16 : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_UInt16
    }
    public static var int32 : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Int32
    }
    public static var uint32 : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_UInt32
    }
    public static var int64 : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Int64
    }
    public static var uint64 : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_UInt64
    }
    public static var single : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Single
    }
    public static var double : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Double
    }
    public static var char16 : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Char16
    }
    public static var boolean : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Boolean
    }
    public static var string : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_String
    }
    public static var inspectable : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Inspectable
    }
    public static var dateTime : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_DateTime
    }
    public static var timeSpan : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_TimeSpan
    }
    public static var guid : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Guid
    }
    public static var point : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Point
    }
    public static var size : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Size
    }
    public static var rect : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Rect
    }
    public static var otherType : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_OtherType
    }
    public static var uint8Array : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_UInt8Array
    }
    public static var int16Array : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Int16Array
    }
    public static var uint16Array : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_UInt16Array
    }
    public static var int32Array : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Int32Array
    }
    public static var uint32Array : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_UInt32Array
    }
    public static var int64Array : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Int64Array
    }
    public static var uint64Array : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_UInt64Array
    }
    public static var singleArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_SingleArray
    }
    public static var doubleArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_DoubleArray
    }
    public static var char16Array : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Char16Array
    }
    public static var booleanArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_BooleanArray
    }
    public static var stringArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_StringArray
    }
    public static var inspectableArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_InspectableArray
    }
    public static var dateTimeArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_DateTimeArray
    }
    public static var timeSpanArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_TimeSpanArray
    }
    public static var guidArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_GuidArray
    }
    public static var pointArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_PointArray
    }
    public static var sizeArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_SizeArray
    }
    public static var rectArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_RectArray
    }
    public static var otherTypeArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_OtherTypeArray
    }
}
extension test_component.PropertyType: @retroactive Hashable, @retroactive Codable {}

