import Foundation

/// Protocol used for KeyPathMapper to allow convertion from one type to another.
public protocol MappableInitializable {
    init()
}

extension KeyPathMapper where TypeA: MappableInitializable {
    /// Generate instance A with updated properties from instance B
    ///
    /// - Parameter from: instance to update from
    /// - Returns: generated intance with updated values
    public func convert(from: TypeB) -> TypeA {
        var value = TypeA()
        update(value: &value, from: from)
        return value
    }
}

extension KeyPathMapper where TypeB: MappableInitializable {
    /// Generate instance B with updated properties from instance A
    ///
    /// - Parameter from: instance to update from
    /// - Returns: generated intance with updated values
    public func convert(from: TypeA) -> TypeB {
        var value = TypeB()
        update(value: &value, from: from)
        return value
    }
}
