import Foundation

extension MappingPair where TypeA: NSObject, TypeB: AnyObject {
    
    init<PropertyType, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, PropertyType>,
                                                      _ typeBKeyPath: WritableKeyPath<TypeB, PropertyType>,
                                                      transformer: Transformer)
        where Transformer.TypeA == PropertyType, Transformer.TypeB == PropertyType {
            
            self.update_TypeA_from_TypeB = updateTypeAFromTypeB(typeAKeyPath, typeBKeyPath, transformer: transformer)
            self.update_TypeB_from_TypeA = updateTypeBFromTypeA(typeAKeyPath, typeBKeyPath, transformer: transformer)
            
            self.observe_TypeA_mapTo_TypeB = { typeA, typeB in
                return typeA.observe(typeAKeyPath, options: [.new], changeHandler: { (_, changeEvent) in
                    guard let updateValue = changeEvent.newValue else { return }
                    var _typeB = typeB
                    let previousValue = _typeB[keyPath: typeBKeyPath]
                    _typeB[keyPath: typeBKeyPath] = transformer.commonTransform(from: previousValue, with: updateValue)
                })
            }
            
            self.observe_TypeB_mapTo_TypeA = nil
    }
    
    init<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, TypeAProperty>,
                                                                      _ typeBKeyPath: WritableKeyPath<TypeB, TypeBProperty>,
                                                                      transformer: Transformer)
        where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
            
            self.update_TypeA_from_TypeB = updateTypeAFromTypeB(typeAKeyPath, typeBKeyPath, transformer: transformer)
            self.update_TypeB_from_TypeA = updateTypeBFromTypeA(typeAKeyPath, typeBKeyPath, transformer: transformer)
            
            self.observe_TypeA_mapTo_TypeB = { typeA, typeB in
                return typeA.observe(typeAKeyPath, options: [.new], changeHandler: { (_, changeEvent) in
                    guard let updateValue = changeEvent.newValue else { return }
                    var _typeB = typeB
                    let previousValue = _typeB[keyPath: typeBKeyPath]
                    _typeB[keyPath: typeBKeyPath] = transformer.transform(from: previousValue, with: updateValue)
                })
            }
            
            self.observe_TypeB_mapTo_TypeA = nil
    }
    
    init<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, TypeAProperty>,
                                                                      _ typeBKeyPath: WritableKeyPath<TypeB, TypeBProperty>,
                                                                      transformer: Transformer)
        where Transformer.TypeA == TypeBProperty, Transformer.TypeB == TypeAProperty {
            
            self.update_TypeA_from_TypeB = updateTypeAFromTypeB(typeAKeyPath, typeBKeyPath, transformer: transformer)
            self.update_TypeB_from_TypeA = updateTypeBFromTypeA(typeAKeyPath, typeBKeyPath, transformer: transformer)
            
            self.observe_TypeA_mapTo_TypeB = { typeA, typeB in
                return typeA.observe(typeAKeyPath, options: [.new], changeHandler: { (_, changeEvent) in
                    guard let updateValue = changeEvent.newValue else { return }
                    var _typeB = typeB
                    let previousValue = _typeB[keyPath: typeBKeyPath]
                    _typeB[keyPath: typeBKeyPath] = transformer.transform(from: previousValue, with: updateValue)
                })
            }
            
            self.observe_TypeB_mapTo_TypeA = nil
    }
    
    func observe(object: TypeA, mapInto updatingObject: TypeB) -> NSKeyValueObservation {
        return observe_TypeA_mapTo_TypeB!(object, updatingObject)
    }
    
}

extension MappingPair where TypeB: NSObject, TypeA: AnyObject {
    
    init<PropertyType, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, PropertyType>,
                                                      _ typeBKeyPath: WritableKeyPath<TypeB, PropertyType>,
                                                      transformer: Transformer)
        where Transformer.TypeA == PropertyType, Transformer.TypeB == PropertyType {
            
            self.update_TypeA_from_TypeB = updateTypeAFromTypeB(typeAKeyPath, typeBKeyPath, transformer: transformer)
            self.update_TypeB_from_TypeA = updateTypeBFromTypeA(typeAKeyPath, typeBKeyPath, transformer: transformer)
            
            self.observe_TypeA_mapTo_TypeB = nil
            
            self.observe_TypeB_mapTo_TypeA = { typeB, typeA in
                return typeB.observe(typeBKeyPath, options: [.new], changeHandler: { (_, changeEvent) in
                    guard let updateValue = changeEvent.newValue else { return }
                    var _typeA = typeA
                    let previousValue = _typeA[keyPath: typeAKeyPath]
                    _typeA[keyPath: typeAKeyPath] = transformer.commonTransform(from: previousValue, with: updateValue)
                })
            }
    }
    
    init<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, TypeAProperty>,
                                                                      _ typeBKeyPath: WritableKeyPath<TypeB, TypeBProperty>,
                                                                      transformer: Transformer)
        where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
            
            self.update_TypeA_from_TypeB = updateTypeAFromTypeB(typeAKeyPath, typeBKeyPath, transformer: transformer)
            self.update_TypeB_from_TypeA = updateTypeBFromTypeA(typeAKeyPath, typeBKeyPath, transformer: transformer)
            
            self.observe_TypeA_mapTo_TypeB = nil
            
            self.observe_TypeB_mapTo_TypeA = { typeB, typeA in
                return typeB.observe(typeBKeyPath, options: [.new], changeHandler: { (_, changeEvent) in
                    guard let updateValue = changeEvent.newValue else { return }
                    var _typeA = typeA
                    let previousValue = _typeA[keyPath: typeAKeyPath]
                    _typeA[keyPath: typeAKeyPath] = transformer.transform(from: previousValue, with: updateValue)
                })
            }
    }
    
    init<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, TypeAProperty>,
                                                                      _ typeBKeyPath: WritableKeyPath<TypeB, TypeBProperty>,
                                                                      transformer: Transformer)
        where Transformer.TypeA == TypeBProperty, Transformer.TypeB == TypeAProperty {
            
            self.update_TypeA_from_TypeB = updateTypeAFromTypeB(typeAKeyPath, typeBKeyPath, transformer: transformer)
            self.update_TypeB_from_TypeA = updateTypeBFromTypeA(typeAKeyPath, typeBKeyPath, transformer: transformer)
            
            self.observe_TypeA_mapTo_TypeB = nil
            
            self.observe_TypeB_mapTo_TypeA = { typeB, typeA in
                return typeB.observe(typeBKeyPath, options: [.new], changeHandler: { (_, changeEvent) in
                    guard let updateValue = changeEvent.newValue else { return }
                    var _typeA = typeA
                    let previousValue = _typeA[keyPath: typeAKeyPath]
                    _typeA[keyPath: typeAKeyPath] = transformer.transform(from: previousValue, with: updateValue)
                })
            }
    }
    
    func observe(object: TypeA, mapInto updatingObject: TypeB) -> NSKeyValueObservation {
        return observe_TypeA_mapTo_TypeB!(object, updatingObject)
    }
    
}
