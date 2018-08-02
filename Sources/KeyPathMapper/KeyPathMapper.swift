import Foundation

public struct KeyPathMapper<TypeA, TypeB> {
    private var mappingPairs: [MappingPair<TypeA, TypeB>] = []
    
    public typealias KeyPathA<TypeAProperty> = WritableKeyPath<TypeA, TypeAProperty>
    public typealias KeyPathB<TypeBProperty> = WritableKeyPath<TypeB, TypeBProperty>
    
    public init() {}
    
    // MARK: - Transformer map
    
    public mutating func map<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ aKeyPath: KeyPathA<TypeAProperty>,
                                                                                          to bKeyPath: KeyPathB<TypeBProperty>,
                                                                                          with transformer: Transformer)
        where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    public mutating func map<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ bKeyPath: KeyPathB<TypeBProperty>,
                                                                                          to aKeyPath: KeyPathA<TypeAProperty>,
                                                                                          with transformer: Transformer)
        where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    // MARK: - Empty map
    
    public mutating func map<TypeProperty>(_ aKeyPath: KeyPathA<TypeProperty>,
                                           to bKeyPath: KeyPathB<TypeProperty>) {
        mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: EmptyMapperTransformer<TypeProperty>()))
    }
    
    public mutating func map<TypeProperty>(_ bKeyPath: KeyPathB<TypeProperty>,
                                           to aKeyPath: KeyPathA<TypeProperty>) {
        mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: EmptyMapperTransformer<TypeProperty>()))
    }
    
    // MARK: - Optional map
    
    public mutating func map<TypeProperty>(_ aKeyPath: KeyPathA<TypeProperty>,
                                           to bKeyPath: KeyPathB<Optional<TypeProperty>>,
                                           fallbackValue: TypeProperty) {
        mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue)))
    }
    
    public mutating func map<TypeProperty>(_ aKeyPath: KeyPathA<Optional<TypeProperty>>,
                                           to bKeyPath: KeyPathB<TypeProperty>,
                                           fallbackValue: TypeProperty) {
        mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue)))
    }
    
    public mutating func map<TypeProperty>(_ bKeyPath: KeyPathB<Optional<TypeProperty>>,
                                           to aKeyPath: KeyPathA<TypeProperty>,
                                           fallbackValue: TypeProperty) {
        mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue)))
    }
    
    public mutating func map<TypeProperty>(_ bKeyPath: KeyPathB<TypeProperty>,
                                           to aKeyPath: KeyPathA<Optional<TypeProperty>>,
                                           fallbackValue: TypeProperty) {
        mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue)))
    }
    
    // MARK: - Update
    
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
