// WARNING: Please don't edit this file. It was generated by Swift/WinRT v0.0.1
// swiftlint:disable all
import Ctest_component

public enum __IMPL_test_component {
    public class IAsyncMethodsWithProgressBridge : AbiInterfaceBridge {
        public typealias CABI = __x_ABI_Ctest__component_CIAsyncMethodsWithProgress
        public typealias SwiftABI = __ABI_test_component.IAsyncMethodsWithProgress
        public typealias SwiftProjection = AnyIAsyncMethodsWithProgress
        public static func from(abi: UnsafeMutablePointer<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return IAsyncMethodsWithProgressImpl(abi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_test_component.IAsyncMethodsWithProgressVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
    }

    fileprivate class IAsyncMethodsWithProgressImpl: IAsyncMethodsWithProgress, WinRTAbiImpl {
        fileprivate typealias Bridge = IAsyncMethodsWithProgressBridge
        fileprivate let _default: Bridge.SwiftABI
        fileprivate var thisPtr: test_component.IInspectable { _default }
        fileprivate init(_ fromAbi: UnsafeMutablePointer<Bridge.CABI>) {
            _default = Bridge.SwiftABI(fromAbi)
        }

        fileprivate func operationWithProgress(_ value: test_component.DateTime) throws -> AnyIAsyncOperationWithProgress<Int32, Double>! {
            try _default.OperationWithProgressImpl(value)
        }

    }

    public class IAsyncOperationIntBridge : AbiInterfaceBridge {
        public typealias CABI = __x_ABI_Ctest__component_CIAsyncOperationInt
        public typealias SwiftABI = __ABI_test_component.IAsyncOperationInt
        public typealias SwiftProjection = AnyIAsyncOperationInt
        public static func from(abi: UnsafeMutablePointer<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return IAsyncOperationIntImpl(abi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_test_component.IAsyncOperationIntVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
    }

    fileprivate class IAsyncOperationIntImpl: IAsyncOperationInt, WinRTAbiImpl {
        fileprivate typealias Bridge = IAsyncOperationIntBridge
        fileprivate let _default: Bridge.SwiftABI
        fileprivate var thisPtr: test_component.IInspectable { _default }
        fileprivate init(_ fromAbi: UnsafeMutablePointer<Bridge.CABI>) {
            _default = Bridge.SwiftABI(fromAbi)
        }

        fileprivate func complete(_ result: Int32) throws {
            try _default.CompleteImpl(result)
        }

        fileprivate func completeWithError(_ errorCode: HRESULT) throws {
            try _default.CompleteWithErrorImpl(errorCode)
        }

    }

    public class IBasicBridge : AbiInterfaceBridge {
        public typealias CABI = __x_ABI_Ctest__component_CIBasic
        public typealias SwiftABI = __ABI_test_component.IBasic
        public typealias SwiftProjection = AnyIBasic
        public static func from(abi: UnsafeMutablePointer<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return IBasicImpl(abi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_test_component.IBasicVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
    }

    fileprivate class IBasicImpl: IBasic, WinRTAbiImpl {
        fileprivate typealias Bridge = IBasicBridge
        fileprivate let _default: Bridge.SwiftABI
        fileprivate var thisPtr: test_component.IInspectable { _default }
        fileprivate init(_ fromAbi: UnsafeMutablePointer<Bridge.CABI>) {
            _default = Bridge.SwiftABI(fromAbi)
        }

        fileprivate func method() {
            try! _default.MethodImpl()
        }

    }

    public class IIAmImplementableBridge : AbiInterfaceBridge {
        public typealias CABI = __x_ABI_Ctest__component_CIIAmImplementable
        public typealias SwiftABI = __ABI_test_component.IIAmImplementable
        public typealias SwiftProjection = AnyIIAmImplementable
        public static func from(abi: UnsafeMutablePointer<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return IIAmImplementableImpl(abi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_test_component.IIAmImplementableVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
    }

    fileprivate class IIAmImplementableImpl: IIAmImplementable, WinRTAbiImpl {
        fileprivate typealias Bridge = IIAmImplementableBridge
        fileprivate let _default: Bridge.SwiftABI
        fileprivate var thisPtr: test_component.IInspectable { _default }
        fileprivate init(_ fromAbi: UnsafeMutablePointer<Bridge.CABI>) {
            _default = Bridge.SwiftABI(fromAbi)
        }

        fileprivate func inInt32(_ value: Int32) throws -> String {
            try _default.InInt32Impl(value)
        }

        fileprivate func inString(_ value: String) throws -> String {
            try _default.InStringImpl(value)
        }

        fileprivate func inObject(_ value: Any!) throws -> String {
            try _default.InObjectImpl(value)
        }

        fileprivate func inEnum(_ value: Signed) throws -> String {
            try _default.InEnumImpl(value)
        }

        fileprivate func outInt32(_ value: inout Int32) throws {
            try _default.OutInt32Impl(&value)
        }

        fileprivate func outString(_ value: inout String) throws {
            try _default.OutStringImpl(&value)
        }

        fileprivate func outObject(_ value: inout Any!) throws {
            try _default.OutObjectImpl(&value)
        }

        fileprivate func outBlittableStruct(_ value: inout BlittableStruct) throws {
            try _default.OutBlittableStructImpl(&value)
        }

        fileprivate func outNonBlittableStruct(_ value: inout NonBlittableStruct) throws {
            try _default.OutNonBlittableStructImpl(&value)
        }

        fileprivate func outEnum(_ value: inout Signed) throws {
            try _default.OutEnumImpl(&value)
        }

        fileprivate func returnObject() throws -> Any! {
            try _default.ReturnObjectImpl()
        }

        fileprivate func returnEnum() throws -> Signed {
            try _default.ReturnEnumImpl()
        }

        fileprivate func fireEvent(_ data: String) throws {
            try _default.FireEventImpl(data)
        }

        fileprivate var enumProperty : Fruit {
            get { try! _default.get_EnumPropertyImpl() }
            set { try! _default.put_EnumPropertyImpl(newValue) }
        }

        fileprivate var id : test_component.GUID? {
            get { try! _default.get_IdImpl() }
            set { try! _default.put_IdImpl(newValue) }
        }

        fileprivate lazy var implementableEvent : Event<test_component.InDelegate> = {
          .init(
            add: { [weak this = _default] in
              guard let this else { return .init() }
              return try! this.add_ImplementableEventImpl($0)
            },
            remove: { [weak this = _default] in
             try? this?.remove_ImplementableEventImpl($0)
           }
          )
        }()

    }

    public class IInterfaceWithObservableVectorBridge : AbiInterfaceBridge {
        public typealias CABI = __x_ABI_Ctest__component_CIInterfaceWithObservableVector
        public typealias SwiftABI = __ABI_test_component.IInterfaceWithObservableVector
        public typealias SwiftProjection = AnyIInterfaceWithObservableVector
        public static func from(abi: UnsafeMutablePointer<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return IInterfaceWithObservableVectorImpl(abi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_test_component.IInterfaceWithObservableVectorVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
    }

    fileprivate class IInterfaceWithObservableVectorImpl: IInterfaceWithObservableVector, WinRTAbiImpl {
        fileprivate typealias Bridge = IInterfaceWithObservableVectorBridge
        fileprivate let _default: Bridge.SwiftABI
        fileprivate var thisPtr: test_component.IInspectable { _default }
        fileprivate init(_ fromAbi: UnsafeMutablePointer<Bridge.CABI>) {
            _default = Bridge.SwiftABI(fromAbi)
        }

        fileprivate func takeObservable(_ basics: AnyIObservableVector<AnyIBasic?>!) throws {
            try _default.TakeObservableImpl(basics)
        }

    }

    public class ISimpleDelegateBridge : AbiInterfaceBridge {
        public typealias CABI = __x_ABI_Ctest__component_CISimpleDelegate
        public typealias SwiftABI = __ABI_test_component.ISimpleDelegate
        public typealias SwiftProjection = AnyISimpleDelegate
        public static func from(abi: UnsafeMutablePointer<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return ISimpleDelegateImpl(abi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_test_component.ISimpleDelegateVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
    }

    fileprivate class ISimpleDelegateImpl: ISimpleDelegate, WinRTAbiImpl {
        fileprivate typealias Bridge = ISimpleDelegateBridge
        fileprivate let _default: Bridge.SwiftABI
        fileprivate var thisPtr: test_component.IInspectable { _default }
        fileprivate init(_ fromAbi: UnsafeMutablePointer<Bridge.CABI>) {
            _default = Bridge.SwiftABI(fromAbi)
        }

        fileprivate func doThis() throws {
            try _default.DoThisImpl()
        }

        fileprivate func doThat(_ val: Int32) throws {
            try _default.DoThatImpl(val)
        }

    }

    public class InterfaceWithReturnDelegateBridge : AbiInterfaceBridge {
        public typealias CABI = __x_ABI_Ctest__component_CInterfaceWithReturnDelegate
        public typealias SwiftABI = __ABI_test_component.InterfaceWithReturnDelegate
        public typealias SwiftProjection = AnyInterfaceWithReturnDelegate
        public static func from(abi: UnsafeMutablePointer<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return InterfaceWithReturnDelegateImpl(abi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_test_component.InterfaceWithReturnDelegateVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
    }

    fileprivate class InterfaceWithReturnDelegateImpl: InterfaceWithReturnDelegate, WinRTAbiImpl {
        fileprivate typealias Bridge = InterfaceWithReturnDelegateBridge
        fileprivate let _default: Bridge.SwiftABI
        fileprivate var thisPtr: test_component.IInspectable { _default }
        fileprivate init(_ fromAbi: UnsafeMutablePointer<Bridge.CABI>) {
            _default = Bridge.SwiftABI(fromAbi)
        }

        fileprivate lazy var eventWithReturn : Event<test_component.ReturnInt32Delegate> = {
          .init(
            add: { [weak this = _default] in
              guard let this else { return .init() }
              return try! this.add_EventWithReturnImpl($0)
            },
            remove: { [weak this = _default] in
             try? this?.remove_EventWithReturnImpl($0)
           }
          )
        }()

    }

    public class WithKeywordBridge : AbiInterfaceBridge {
        public typealias CABI = __x_ABI_Ctest__component_CWithKeyword
        public typealias SwiftABI = __ABI_test_component.WithKeyword
        public typealias SwiftProjection = AnyWithKeyword
        public static func from(abi: UnsafeMutablePointer<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return WithKeywordImpl(abi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_test_component.WithKeywordVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
    }

    fileprivate class WithKeywordImpl: WithKeyword, WinRTAbiImpl {
        fileprivate typealias Bridge = WithKeywordBridge
        fileprivate let _default: Bridge.SwiftABI
        fileprivate var thisPtr: test_component.IInspectable { _default }
        fileprivate init(_ fromAbi: UnsafeMutablePointer<Bridge.CABI>) {
            _default = Bridge.SwiftABI(fromAbi)
        }

        fileprivate func `enum`(_ `extension`: String) throws {
            try _default.EnumImpl(`extension`)
        }

        fileprivate var `struct` : String {
            get { try! _default.get_StructImpl() }
            set { try! _default.put_StructImpl(newValue) }
        }

        fileprivate lazy var `repeat` : Event<EventHandler<Any?>> = {
          .init(
            add: { [weak this = _default] in
              guard let this else { return .init() }
              return try! this.add_RepeatImpl($0)
            },
            remove: { [weak this = _default] in
             try? this?.remove_RepeatImpl($0)
           }
          )
        }()

    }

    public class ObjectHandlerBridge : WinRTDelegateBridge {
        public typealias Handler = ObjectHandler
        public typealias CABI = __x_ABI_Ctest__component_CIObjectHandler
        public typealias SwiftABI = __ABI_test_component.ObjectHandler

        public static func from(abi: UnsafeMutablePointer<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            let _default = SwiftABI(abi)
            let handler: Handler = { (item) in
                try! _default.InvokeImpl(item)
            }
            return handler
        }
    }
    public class VoidToVoidDelegateBridge : WinRTDelegateBridge {
        public typealias Handler = VoidToVoidDelegate
        public typealias CABI = __x_ABI_Ctest__component_CIVoidToVoidDelegate
        public typealias SwiftABI = __ABI_test_component.VoidToVoidDelegate

        public static func from(abi: UnsafeMutablePointer<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            let _default = SwiftABI(abi)
            let handler: Handler = { () in
                try! _default.InvokeImpl()
            }
            return handler
        }
    }
}
