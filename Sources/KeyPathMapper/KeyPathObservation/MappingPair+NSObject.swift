import Foundation

extension MappingPair where TypeA: NSObject, TypeB: AnyObject {
    
    static func observableMappingPair<PropertyType, Transformer: MapperTransfomer>(_ typeAKeyPath: ReferenceWritableKeyPath<TypeA, PropertyType>,
                                                                                   _ typeBKeyPath: ReferenceWritableKeyPath<TypeB, PropertyType>,
                                                                                   transformer: Transformer) -> MappingPair
        where Transformer.TypeA == PropertyType, Transformer.TypeB == PropertyType {
            
            var mappingPair = MappingPair<TypeA, TypeB>.init(typeAKeyPath, typeBKeyPath, transformer: transformer)
            mappingPair.observe_TypeA_mapTo_TypeB = observeObject(typeAKeyPath, typeBKeyPath, transformer: transformer)

            return mappingPair
    }
    
    static func observableMappingPair<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: ReferenceWritableKeyPath<TypeA, TypeAProperty>,
                                                                                                   _ typeBKeyPath: ReferenceWritableKeyPath<TypeB, TypeBProperty>,
                                                                                                   transformer: Transformer) -> MappingPair
        where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
            
            var mappingPair = MappingPair<TypeA, TypeB>.init(typeAKeyPath, typeBKeyPath, transformer: transformer)
            mappingPair.observe_TypeA_mapTo_TypeB = observeObject(typeAKeyPath, typeBKeyPath, transformer: transformer)
            return mappingPair
    }
    
    static func observableMappingPair<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: ReferenceWritableKeyPath<TypeA, TypeAProperty>,
                                                                                                   _ typeBKeyPath: ReferenceWritableKeyPath<TypeB, TypeBProperty>,
                                                                                                   transformer: Transformer) -> MappingPair
        where Transformer.TypeA == TypeBProperty, Transformer.TypeB == TypeAProperty {
            
            var mappingPair = MappingPair<TypeA, TypeB>.init(typeAKeyPath, typeBKeyPath, transformer: transformer)
            mappingPair.observe_TypeA_mapTo_TypeB = observeObject(typeAKeyPath, typeBKeyPath, transformer: transformer)
            return mappingPair
    }
    
    func observe(object: TypeA, mapInto updatingObject: TypeB) -> NSKeyValueObservation {
        return observe_TypeA_mapTo_TypeB!(object, updatingObject)
    }
    
}

extension MappingPair where TypeB: NSObject, TypeA: AnyObject {
    
    static func observableMappingPair<PropertyType, Transformer: MapperTransfomer>(_ typeAKeyPath: ReferenceWritableKeyPath<TypeA, PropertyType>,
                                                                                   _ typeBKeyPath: ReferenceWritableKeyPath<TypeB, PropertyType>,
                                                                                   transformer: Transformer) -> MappingPair
        where Transformer.TypeA == PropertyType, Transformer.TypeB == PropertyType {
            
            var mappingPair = MappingPair<TypeA, TypeB>.init(typeAKeyPath, typeBKeyPath, transformer: transformer)
            mappingPair.observe_TypeB_mapTo_TypeA = observeObject(typeBKeyPath, typeAKeyPath, transformer: transformer)
            
            return mappingPair
    }
    
    static func observableMappingPair<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: ReferenceWritableKeyPath<TypeA, TypeAProperty>,
                                                                                                   _ typeBKeyPath: ReferenceWritableKeyPath<TypeB, TypeBProperty>,
                                                                                                   transformer: Transformer) -> MappingPair
        where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
            
            var mappingPair = MappingPair<TypeA, TypeB>.init(typeAKeyPath, typeBKeyPath, transformer: transformer)
            mappingPair.observe_TypeB_mapTo_TypeA = observeObject(typeBKeyPath, typeAKeyPath, transformer: transformer)
            
            return mappingPair
    }
    
    static func observableMappingPair<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: ReferenceWritableKeyPath<TypeA, TypeAProperty>,
                                                                                                   _ typeBKeyPath: ReferenceWritableKeyPath<TypeB, TypeBProperty>,
                                                                                                   transformer: Transformer) -> MappingPair
        where Transformer.TypeA == TypeBProperty, Transformer.TypeB == TypeAProperty {
            
            var mappingPair = MappingPair<TypeA, TypeB>.init(typeAKeyPath, typeBKeyPath, transformer: transformer)
            mappingPair.observe_TypeB_mapTo_TypeA = observeObject(typeBKeyPath, typeAKeyPath, transformer: transformer)
            
            return mappingPair
    }
    
    func observe(object: TypeB, mapInto updatingObject: TypeA) -> NSKeyValueObservation {
        return observe_TypeB_mapTo_TypeA!(object, updatingObject)
    }
    
}
