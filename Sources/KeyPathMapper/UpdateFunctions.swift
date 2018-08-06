import Foundation

typealias ModelMappingFunction<T, T1> = (inout T, T1) -> ()

func updateTypeAFromTypeB<TypeA, TypeB, TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, TypeAProperty>,
                                                                                                     _ typeBKeyPath: WritableKeyPath<TypeB, TypeBProperty>,
                                                                                                     transformer: Transformer) -> ModelMappingFunction<TypeA, TypeB>
    where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
        return { typeA, typeB in
            let previousValue = typeA[keyPath: typeAKeyPath]
            let updateValue = typeB[keyPath: typeBKeyPath]
            typeA[keyPath: typeAKeyPath] = transformer.transform(from: previousValue, with: updateValue)
        }
}

func updateTypeAFromTypeB<TypeA, TypeB, TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, TypeAProperty>,
                                                                                                     _ typeBKeyPath: WritableKeyPath<TypeB, TypeBProperty>,
                                                                                                     transformer: Transformer) -> ModelMappingFunction<TypeA, TypeB>
    where Transformer.TypeB == TypeAProperty, Transformer.TypeA == TypeBProperty {
        return { typeA, typeB in
            let previousValue = typeA[keyPath: typeAKeyPath]
            let updateValue = typeB[keyPath: typeBKeyPath]
            typeA[keyPath: typeAKeyPath] = transformer.transform(from: previousValue, with: updateValue)
        }
}

func updateTypeAFromTypeB<TypeA, TypeB, TypeProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, TypeProperty>,
                                                                                     _ typeBKeyPath: WritableKeyPath<TypeB, TypeProperty>,
                                                                                     transformer: Transformer) -> ModelMappingFunction<TypeA, TypeB>
    where Transformer.TypeB == TypeProperty, Transformer.TypeA == TypeProperty {
        return { typeA, typeB in
            let previousValue = typeA[keyPath: typeAKeyPath]
            let updateValue = typeB[keyPath: typeBKeyPath]
            typeA[keyPath: typeAKeyPath] = transformer.commonTransform(from: previousValue, with: updateValue)
        }
}


func updateTypeBFromTypeA<TypeA, TypeB, TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, TypeAProperty>,
                                                                                                     _ typeBKeyPath: WritableKeyPath<TypeB, TypeBProperty>,
                                                                                                     transformer: Transformer) -> ModelMappingFunction<TypeB, TypeA>
    where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
        return { typeB, typeA in
            let previousValue = typeB[keyPath: typeBKeyPath]
            let updateValue = typeA[keyPath: typeAKeyPath]
            typeB[keyPath: typeBKeyPath] = transformer.transform(from: previousValue, with: updateValue)
        }
}

func updateTypeBFromTypeA<TypeA, TypeB, TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, TypeAProperty>,
                                                                                                     _ typeBKeyPath: WritableKeyPath<TypeB, TypeBProperty>,
                                                                                                     transformer: Transformer) -> ModelMappingFunction<TypeB, TypeA>
    where Transformer.TypeB == TypeAProperty, Transformer.TypeA == TypeBProperty {
        return { typeB, typeA in
            let previousValue = typeB[keyPath: typeBKeyPath]
            let updateValue = typeA[keyPath: typeAKeyPath]
            typeB[keyPath: typeBKeyPath] = transformer.transform(from: previousValue, with: updateValue)
        }
}

func updateTypeBFromTypeA<TypeA, TypeB, TypeProperty, Transformer: MapperTransfomer>(_ typeAKeyPath: WritableKeyPath<TypeA, TypeProperty>,
                                                                                     _ typeBKeyPath: WritableKeyPath<TypeB, TypeProperty>,
                                                                                     transformer: Transformer) -> ModelMappingFunction<TypeB, TypeA>
    where Transformer.TypeB == TypeProperty, Transformer.TypeA == TypeProperty {
        return { typeB, typeA in
            let previousValue = typeB[keyPath: typeBKeyPath]
            let updateValue = typeA[keyPath: typeAKeyPath]
            typeB[keyPath: typeBKeyPath] = transformer.commonTransform(from: previousValue, with: updateValue)
        }
}

