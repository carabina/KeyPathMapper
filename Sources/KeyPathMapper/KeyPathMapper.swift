import Foundation

public struct KeyPathMapper<TypeA, TypeB> {
    private var mappingPairs: [MappingPair<TypeA, TypeB>] = []
    
    public mutating func map<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ aKeyPath: WritableKeyPath<TypeA, TypeAProperty>,
                                                                                          to bKeyPath: WritableKeyPath<TypeB, TypeBProperty>,
                                                                                          with transformer: Transformer)
        where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    public mutating func map<TypeProperty>(_ aKeyPath: WritableKeyPath<TypeA, TypeProperty>,
                                           to bKeyPath: WritableKeyPath<TypeB, TypeProperty>) {
        mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: EmptyMapperTransformer<TypeProperty>()))
    }
    
    public mutating func map<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ bKeyPath: WritableKeyPath<TypeB, TypeBProperty>,
                                                                                          to aKeyPath: WritableKeyPath<TypeA, TypeAProperty>,
                                                                                          with transformer: Transformer)
        where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    public mutating func map<TypeProperty>(_ bKeyPath: WritableKeyPath<TypeB, TypeProperty>,
                                           to aKeyPath: WritableKeyPath<TypeA, TypeProperty>) {
        mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: EmptyMapperTransformer<TypeProperty>()))
    }
    
    public func update(value: inout TypeA, from: TypeB) {
        mappingPairs.forEach { mappingPair in
            mappingPair.update(value: &value, from: from)
        }
    }
    
    public func update(value: inout TypeB, from: TypeA) {
        mappingPairs.forEach { mappingPair in
            mappingPair.update(value: &value, from: from)
        }
    }
    
    public func updated(value: TypeA, from: TypeB) -> TypeA {
        var updatingValue = value
        mappingPairs.forEach { mappingPair in
            mappingPair.update(value: &updatingValue, from: from)
        }
        return updatingValue
    }
    
    public func updated(value: TypeB, from: TypeA) -> TypeB {
        var updatingValue = value
        mappingPairs.forEach { mappingPair in
            mappingPair.update(value: &updatingValue, from: from)
        }
        return updatingValue
    }
    
}
