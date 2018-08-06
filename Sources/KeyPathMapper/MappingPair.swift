import Foundation

extension MapperTransfomer {
    func commonTransform(from previous: TypeA, with value: TypeB) -> TypeA {
        return self.transform(from: previous, with: value)
    }
}

struct MappingPair<TypeA, TypeB> {
    let update_TypeA_from_TypeB: ModelMappingFunction<TypeA, TypeB>
    let update_TypeB_from_TypeA: ModelMappingFunction<TypeB, TypeA>
    var observe_TypeA_mapTo_TypeB: ((TypeA, TypeB) -> NSKeyValueObservation)?
    var observe_TypeB_mapTo_TypeA: ((TypeB, TypeA) -> NSKeyValueObservation)?
    
    init<PropertyType, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, PropertyType>,
                                                      _ typeBKeyPath: WritableKeyPath<TypeB, PropertyType>,
                                                      transformer: Transformer)
        where Transformer.TypeA == PropertyType, Transformer.TypeB == PropertyType {
            
            self.update_TypeA_from_TypeB = updateTypeAFromTypeB(typeAKeyPath, typeBKeyPath, transformer: transformer)
            self.update_TypeB_from_TypeA = updateTypeBFromTypeA(typeAKeyPath, typeBKeyPath, transformer: transformer)
    }
    
    init<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, TypeAProperty>,
                                                                      _ typeBKeyPath: WritableKeyPath<TypeB, TypeBProperty>,
                                                                      transformer: Transformer)
        where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
            
            self.update_TypeA_from_TypeB = updateTypeAFromTypeB(typeAKeyPath, typeBKeyPath, transformer: transformer)
            self.update_TypeB_from_TypeA = updateTypeBFromTypeA(typeAKeyPath, typeBKeyPath, transformer: transformer)
    }
    
    init<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, TypeAProperty>,
                                                                      _ typeBKeyPath: WritableKeyPath<TypeB, TypeBProperty>,
                                                                      transformer: Transformer)
        where Transformer.TypeA == TypeBProperty, Transformer.TypeB == TypeAProperty {
            
            self.update_TypeA_from_TypeB = updateTypeAFromTypeB(typeAKeyPath, typeBKeyPath, transformer: transformer)
            self.update_TypeB_from_TypeA = updateTypeBFromTypeA(typeAKeyPath, typeBKeyPath, transformer: transformer)
    }
    
    func update(value: inout TypeA, from: TypeB) {
        update_TypeA_from_TypeB(&value, from)
    }
    
    func update(value: inout TypeB, from: TypeA) {
        update_TypeB_from_TypeA(&value, from)
    }
}
