import Foundation

extension MappingPair where TypeA: NSObject, TypeB: AnyObject {
    
    static func observableMappingPair<PropertyType, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, PropertyType>,
                                                                                   _ typeBKeyPath: WritableKeyPath<TypeB, PropertyType>,
                                                                                   transformer: Transformer) -> MappingPair
        where Transformer.TypeA == PropertyType, Transformer.TypeB == PropertyType {
            
            var mappingPair = MappingPair<TypeA, TypeB>.init(typeAKeyPath, typeBKeyPath, transformer: transformer)
            mappingPair.observe_TypeA_mapTo_TypeB = { typeA, typeB in
                return typeA.observe(typeAKeyPath, options: [.new], changeHandler: { (_, changeEvent) in
                    guard let updateValue = changeEvent.newValue else { return }
                    var _typeB = typeB
                    let previousValue = _typeB[keyPath: typeBKeyPath]
                    _typeB[keyPath: typeBKeyPath] = transformer.commonTransform(from: previousValue, with: updateValue)
                })
            }

            return mappingPair
    }
    
    static func observableMappingPair<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, TypeAProperty>,
                                                                                                   _ typeBKeyPath: WritableKeyPath<TypeB, TypeBProperty>,
                                                                                                   transformer: Transformer) -> MappingPair
        where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
            
            var mappingPair = MappingPair<TypeA, TypeB>.init(typeAKeyPath, typeBKeyPath, transformer: transformer)
            mappingPair.observe_TypeA_mapTo_TypeB = { typeA, typeB in
                return typeA.observe(typeAKeyPath, options: [.new], changeHandler: { (_, changeEvent) in
                    guard let updateValue = changeEvent.newValue else { return }
                    var _typeB = typeB
                    let previousValue = _typeB[keyPath: typeBKeyPath]
                    _typeB[keyPath: typeBKeyPath] = transformer.transform(from: previousValue, with: updateValue)
                })
            }
            
            return mappingPair
    }
    
    static func observableMappingPair<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, TypeAProperty>,
                                                                                                   _ typeBKeyPath: WritableKeyPath<TypeB, TypeBProperty>,
                                                                                                   transformer: Transformer) -> MappingPair
        where Transformer.TypeA == TypeBProperty, Transformer.TypeB == TypeAProperty {
            
            var mappingPair = MappingPair<TypeA, TypeB>.init(typeAKeyPath, typeBKeyPath, transformer: transformer)
            mappingPair.observe_TypeA_mapTo_TypeB = { typeA, typeB in
                return typeA.observe(typeAKeyPath, options: [.new], changeHandler: { (_, changeEvent) in
                    guard let updateValue = changeEvent.newValue else { return }
                    var _typeB = typeB
                    let previousValue = _typeB[keyPath: typeBKeyPath]
                    _typeB[keyPath: typeBKeyPath] = transformer.transform(from: previousValue, with: updateValue)
                })
            }
            
            return mappingPair
    }
    
    func observe(object: TypeA, mapInto updatingObject: TypeB) -> NSKeyValueObservation {
        return observe_TypeA_mapTo_TypeB!(object, updatingObject)
    }
    
}

extension MappingPair where TypeB: NSObject, TypeA: AnyObject {
    
    static func observableMappingPair<PropertyType, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, PropertyType>,
                                                                                   _ typeBKeyPath: WritableKeyPath<TypeB, PropertyType>,
                                                                                   transformer: Transformer) -> MappingPair
        where Transformer.TypeA == PropertyType, Transformer.TypeB == PropertyType {
            
            var mappingPair = MappingPair<TypeA, TypeB>.init(typeAKeyPath, typeBKeyPath, transformer: transformer)
            mappingPair.observe_TypeB_mapTo_TypeA = { typeB, typeA in
                return typeB.observe(typeBKeyPath, options: [.new], changeHandler: { (_, changeEvent) in
                    guard let updateValue = changeEvent.newValue else { return }
                    var _typeA = typeA
                    let previousValue = _typeA[keyPath: typeAKeyPath]
                    _typeA[keyPath: typeAKeyPath] = transformer.commonTransform(from: previousValue, with: updateValue)
                })
            }
            
            return mappingPair
    }
    
    static func observableMappingPair<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, TypeAProperty>,
                                                                                                   _ typeBKeyPath: WritableKeyPath<TypeB, TypeBProperty>,
                                                                                                   transformer: Transformer) -> MappingPair
        where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
            
            var mappingPair = MappingPair<TypeA, TypeB>.init(typeAKeyPath, typeBKeyPath, transformer: transformer)
            mappingPair.observe_TypeB_mapTo_TypeA = { typeB, typeA in
                return typeB.observe(typeBKeyPath, options: [.new], changeHandler: { (_, changeEvent) in
                    guard let updateValue = changeEvent.newValue else { return }
                    var _typeA = typeA
                    let previousValue = _typeA[keyPath: typeAKeyPath]
                    _typeA[keyPath: typeAKeyPath] = transformer.transform(from: previousValue, with: updateValue)
                })
            }
            
            return mappingPair
    }
    
    static func observableMappingPair<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, TypeAProperty>,
                                                                                                   _ typeBKeyPath: WritableKeyPath<TypeB, TypeBProperty>,
                                                                                                   transformer: Transformer) -> MappingPair
        where Transformer.TypeA == TypeBProperty, Transformer.TypeB == TypeAProperty {
            
            var mappingPair = MappingPair<TypeA, TypeB>.init(typeAKeyPath, typeBKeyPath, transformer: transformer)
            mappingPair.observe_TypeB_mapTo_TypeA = { typeB, typeA in
                return typeB.observe(typeBKeyPath, options: [.new], changeHandler: { (_, changeEvent) in
                    guard let updateValue = changeEvent.newValue else { return }
                    var _typeA = typeA
                    let previousValue = _typeA[keyPath: typeAKeyPath]
                    _typeA[keyPath: typeAKeyPath] = transformer.transform(from: previousValue, with: updateValue)
                })
            }
            
            return mappingPair
    }
    
    func observe(object: TypeA, mapInto updatingObject: TypeB) -> NSKeyValueObservation {
        return observe_TypeA_mapTo_TypeB!(object, updatingObject)
    }
    
}
