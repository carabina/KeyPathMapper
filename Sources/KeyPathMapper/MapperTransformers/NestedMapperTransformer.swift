import Foundation

public struct NestedMapperTransformer<MappingTypeA, MappingTypeATypeB>: MapperTransfomer {
    public typealias TypeA = MappingTypeA
    public typealias TypeB = MappingTypeATypeB
    
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
