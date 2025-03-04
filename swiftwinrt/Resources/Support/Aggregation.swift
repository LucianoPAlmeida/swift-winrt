import C_BINDINGS_MODULE
import Foundation

public protocol MakeComposedAbi : AbiInterface where SwiftABI: SUPPORT_MODULE.IInspectable {
    associatedtype SwiftProjection : WinRTClass
}

public protocol ComposableImpl : AbiInterface where SwiftABI: IInspectable  {
    associatedtype Default : MakeComposedAbi
    static func makeAbi() -> CABI
}


// At a high level, aggregation simply requires the WinRT object to have a pointer back to the Swift world, so that it can call
// overridable methods on the class. This Swift pointer is given to the WinRT object during construction. The construction of the
// WinRT object returns us two different pointers:

// 1. A non-delegating "inner" pointer. A non-delegating pointer means that any QueryInterface calls won't "delegate" back into the Swift world
// 2. A pointer to the default interface.

// Below is a table which shows what the input parameters to CreateInstance is, and what we should do with the
// output parameters in order to properly aggregate a type. For reference, a constructor for a winrt object (without any parameters)
// looks like this:

// CreateInstance(IInspectable* baseInsp, IInspectable** innerInsp, IInspectable** result)

// |  Aggregating? |  baseInsp (Swift pointer) | innerInsp (C++ pointer) | result (C++)             |
// |---------------|---------------------------|-------------------------|--------------------------|
// |  Yes          |  self                     |  stored on swift object |  ignored or stored       |
// |  No           |  nil                      |  ignored                |  stored on swift object  |
public func MakeComposed<Composable: ComposableImpl>(
    composing: Composable.Type,
    _ this: Composable.Default.SwiftProjection,
    _ createCallback: (UnsealedWinRTClassWrapper<Composable>?, inout SUPPORT_MODULE.IInspectable?) -> Composable.Default.SwiftABI) -> SUPPORT_MODULE.IInspectable {
    let aggregated = type(of: this) != Composable.Default.SwiftProjection.self
    let wrapper:UnsealedWinRTClassWrapper<Composable>? = .init(aggregated ? this : nil)

    var innerInsp: SUPPORT_MODULE.IInspectable? = nil
    let base = createCallback(wrapper, &innerInsp)
    guard let innerInsp else {
        fatalError("Unexpected nil returned after successful creation")
    }

    return aggregated ? innerInsp : base
}

public class UnsealedWinRTClassWrapper<Composable: ComposableImpl> : WinRTWrapperBase<Composable.CABI, Composable.Default.SwiftProjection> {
    override public class var IID: SUPPORT_MODULE.IID { Composable.SwiftABI.IID }

    public init?(_ impl: Composable.Default.SwiftProjection?) {
        guard let impl = impl else { return nil }
        let abi = Composable.makeAbi()
        super.init(abi, impl)
    }

    public static func unwrapFrom(base: UnsafeMutablePointer<Composable.Default.CABI>) -> Composable.Default.SwiftProjection {
        let baseInsp = SUPPORT_MODULE.IInspectable(consuming: base)
        let overrides: Composable.SwiftABI = try! baseInsp.QueryInterface()

        // Try to unwrap an app implemented object. If one doesn't exist then we'll create the proper WinRT type below
        if let instance = tryUnwrapFrom(abi: RawPointer(overrides)) {
            return instance
        }

        guard let instance = makeFrom(abi: baseInsp) else {
            // the derived class doesn't exist, which is fine, just return the type the API specifies.
            return make(type: Composable.Default.SwiftProjection.self, from: baseInsp)!
        }
        return instance as! Composable.Default.SwiftProjection
    }

    public func toIInspectableABI<ResultType>(_ body: (UnsafeMutablePointer<C_IInspectable>) throws -> ResultType)
        rethrows -> ResultType {
        let abi = try! toABI { $0 }
        return try abi.withMemoryRebound(to: C_IInspectable.self, capacity: 1) { try body($0) }
    }
}
