import Foundation

/// KeyPathMapper is a generic type which provides property mapping based on instances KeyPaths.
public struct KeyPathMapper<TypeA, TypeB> {
    var mappingPairs: [MappingPair<TypeA, TypeB>] = []
    
    /// :nodoc:
    public typealias KeyPathA<TypeAProperty> = WritableKeyPath<TypeA, TypeAProperty>
    /// :nodoc:
    public typealias KeyPathB<TypeBProperty> = WritableKeyPath<TypeB, TypeBProperty>
    /// :nodoc:
    public typealias ReferenceKeyPathA<TypeAProperty> = ReferenceWritableKeyPath<TypeA, TypeAProperty>
    /// :nodoc:
    public typealias ReferenceKeyPathB<TypeBProperty> = ReferenceWritableKeyPath<TypeB, TypeBProperty>
    
    public init() {}
    
    // MARK: - Update
    
    /// Update instance A from mappable instance B
    ///
    /// - Parameters:
    ///   - value: instance to update
    ///   - from: instance to update from
    public func update(value: inout TypeA, from: TypeB) {
        mappingPairs.forEach { mappingPair in
            mappingPair.update(value: &value, from: from)
        }
    }
    
    /// Update instance B from mappable instance A
    ///
    /// - Parameters:
    ///   - value: instance to update
    ///   - from: instance to update from
    public func update(value: inout TypeB, from: TypeA) {
        mappingPairs.forEach { mappingPair in
            mappingPair.update(value: &value, from: from)
        }
    }
    
    
    /// Update instance A from mappable instance B
    ///
    /// - Parameters:
    ///   - value: instance to update
    ///   - from: instance to update from
    /// - Returns: New instance A with updated values.
    public func updated(value: TypeA, from: TypeB) -> TypeA {
        var updatingValue = value
        mappingPairs.forEach { mappingPair in
            mappingPair.update(value: &updatingValue, from: from)
        }
        return updatingValue
    }
    
    /// Update instance B from mappable instance A
    ///
    /// - Parameters:
    ///   - value: instance to update
    ///   - from: instance to update from
    /// - Returns: New instance B with updated values
    public func updated(value: TypeB, from: TypeA) -> TypeB {
        var updatingValue = value
        mappingPairs.forEach { mappingPair in
            mappingPair.update(value: &updatingValue, from: from)
        }
        return updatingValue
    }
    
}
