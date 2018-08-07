import Foundation

typealias ModelObservationFunction<T, T1> = ((T, T1) -> NSKeyValueObservation)

func observeObject<TypeA: NSObject, TypeB: AnyObject, PropertyType, Transformer: MapperTransfomer>(_ typeAKeyPath: ReferenceWritableKeyPath<TypeA, PropertyType>,
                                                                                             _ typeBKeyPath: ReferenceWritableKeyPath<TypeB, PropertyType>,
                                                                                             transformer: Transformer) -> ModelObservationFunction<TypeA, TypeB>
    where Transformer.TypeA == PropertyType, Transformer.TypeB == PropertyType {
        
        return { typeA, typeB in
            return typeA.observe(typeAKeyPath, options: [.new], changeHandler: { (_, changeEvent) in
                guard let updateValue = changeEvent.newValue else { return }
                let previousValue = typeB[keyPath: typeBKeyPath]
                typeB[keyPath: typeBKeyPath] = transformer.commonTransform(from: previousValue, with: updateValue)
            })
        }
}

func observeObject<TypeA: NSObject, TypeB: AnyObject, TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: ReferenceWritableKeyPath<TypeA, TypeAProperty>,
                                                                                                             _ typeBKeyPath: ReferenceWritableKeyPath<TypeB, TypeBProperty>,
                                                                                                             transformer: Transformer) -> ModelObservationFunction<TypeA, TypeB>
    where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
        
        return { typeA, typeB in
            return typeA.observe(typeAKeyPath, options: [.new], changeHandler: { (_, changeEvent) in
                guard let updateValue = changeEvent.newValue else { return }
                let previousValue = typeB[keyPath: typeBKeyPath]
                typeB[keyPath: typeBKeyPath] = transformer.transform(from: previousValue, with: updateValue)
            })
        }
}

func observeObject<TypeA: NSObject, TypeB: AnyObject, TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: ReferenceWritableKeyPath<TypeA, TypeAProperty>,
                                                                                                             _ typeBKeyPath: ReferenceWritableKeyPath<TypeB, TypeBProperty>,
                                                                                                             transformer: Transformer) -> ModelObservationFunction<TypeA, TypeB>
    where Transformer.TypeB == TypeAProperty, Transformer.TypeA == TypeBProperty {
        
        return { typeA, typeB in
            return typeA.observe(typeAKeyPath, options: [.new], changeHandler: { (_, changeEvent) in
                guard let updateValue = changeEvent.newValue else { return }
                let previousValue = typeB[keyPath: typeBKeyPath]
                typeB[keyPath: typeBKeyPath] = transformer.transform(from: previousValue, with: updateValue)
            })
        }
}
