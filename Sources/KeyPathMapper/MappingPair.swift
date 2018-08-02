import Foundation

private extension MapperTransfomer {
    func commonTransform(from previous: TypeA, with value: TypeB) -> TypeA {
        return self.transform(from: previous, with: value)
    }
}

struct MappingPair<TypeA, TypeB> {
    private var update_TypeA_from_TypeB: (inout TypeA, TypeB) -> ()
    private var update_TypeB_from_TypeA: (inout TypeB, TypeA) -> ()
    
    init<PropertyType, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, PropertyType>,
                                                      _ typeBKeyPath: WritableKeyPath<TypeB, PropertyType>,
                                                      transformer: Transformer)
        where Transformer.TypeA == PropertyType, Transformer.TypeB == PropertyType {
            
            self.update_TypeA_from_TypeB = { typeA, typeB in
                let previousValue = typeA[keyPath: typeAKeyPath]
                let updateValue = typeB[keyPath: typeBKeyPath]
                typeA[keyPath: typeAKeyPath] = transformer.commonTransform(from: previousValue, with: updateValue)
            }
            
            self.update_TypeB_from_TypeA = { typeB, typeA in
                let previousValue = typeB[keyPath: typeBKeyPath]
                let updateValue = typeA[keyPath: typeAKeyPath]
                typeB[keyPath: typeBKeyPath] = transformer.commonTransform(from: previousValue, with: updateValue)
            }
    }
    
    init<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, TypeAProperty>,
                                                                      _ typeBKeyPath: WritableKeyPath<TypeB, TypeBProperty>,
                                                                      transformer: Transformer)
        where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
            
            self.update_TypeA_from_TypeB = { typeA, typeB in
                let previousValue = typeA[keyPath: typeAKeyPath]
                let updateValue = typeB[keyPath: typeBKeyPath]
                typeA[keyPath: typeAKeyPath] = transformer.transform(from: previousValue, with: updateValue)
            }
            
            self.update_TypeB_from_TypeA = { typeB, typeA in
                let previousValue = typeB[keyPath: typeBKeyPath]
                let updateValue = typeA[keyPath: typeAKeyPath]
                typeB[keyPath: typeBKeyPath] = transformer.transform(from: previousValue, with: updateValue)
            }
    }
    
    init<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, TypeAProperty>,
                                                                      _ typeBKeyPath: WritableKeyPath<TypeB, TypeBProperty>,
                                                                      transformer: Transformer)
        where Transformer.TypeA == TypeBProperty, Transformer.TypeB == TypeAProperty {
            
            self.update_TypeA_from_TypeB = { typeA, typeB in
                let previousValue = typeA[keyPath: typeAKeyPath]
                let updateValue = typeB[keyPath: typeBKeyPath]
                typeA[keyPath: typeAKeyPath] = transformer.transform(from: previousValue, with: updateValue)
            }
            
            self.update_TypeB_from_TypeA = { typeB, typeA in
                let previousValue = typeB[keyPath: typeBKeyPath]
                let updateValue = typeA[keyPath: typeAKeyPath]
                typeB[keyPath: typeBKeyPath] = transformer.transform(from: previousValue, with: updateValue)
            }
    }
    
    func update(value: inout TypeA, from: TypeB) {
        update_TypeA_from_TypeB(&value, from)
    }
    
    func update(value: inout TypeB, from: TypeA) {
        update_TypeB_from_TypeA(&value, from)
    }
}
