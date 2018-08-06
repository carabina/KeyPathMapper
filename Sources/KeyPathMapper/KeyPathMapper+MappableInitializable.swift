import Foundation

public protocol MappableInitializable {
    init()
}

extension KeyPathMapper where TypeA: MappableInitializable {
    public func convert(from: TypeB) -> TypeA {
        var value = TypeA()
        update(value: &value, from: from)
        return value
    }
}

extension KeyPathMapper where TypeB: MappableInitializable {
    public func convert(from: TypeA) -> TypeB {
        var value = TypeB()
        update(value: &value, from: from)
        return value
    }
}
