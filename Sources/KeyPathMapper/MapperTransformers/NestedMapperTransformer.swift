import Foundation

/// Transformer applied for nested types, on mapping KeyPath of one type to another.
public struct NestedMapperTransformer<MappingTypeA, MappingTypeB>: MapperTransfomer {
    public typealias TypeA = MappingTypeA
    public typealias TypeB = MappingTypeB
    
    private let keyPathMapper: KeyPathMapper<TypeA, TypeB>
    
    public init(keyPathMapper: KeyPathMapper<TypeA, TypeB>) {
        self.keyPathMapper = keyPathMapper
    }
    
    public func transform(from previous: TypeB, with value: TypeA) -> TypeB {
        var updateValue = previous
        keyPathMapper.update(value: &updateValue, from: value)
        return updateValue
    }
    
    public func transform(from previous: TypeA, with value: TypeB) -> TypeA {
        var updateValue = previous
        keyPathMapper.update(value: &updateValue, from: value)
        return updateValue
    }
    
}
