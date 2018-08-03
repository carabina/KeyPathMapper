# KeyPathMapper
**KeyPathMapper** is a thin library based on swift `#KeyPath` feature, it allows mapping between two different models.

## How to use?

```swift
struct TypeA {
    var name: String
    var age: Int
    var submodel: TypeASubmodel
}

struct TypeASubmodel {
    var value: String = ""
}

struct TypeB {
    var name: String
    var age: Int?
    var submodel: TypeBSubmodel
}

struct TypeBSubmodel {
    var value: String = ""
}

var mapper: KeyPathMapper<TypeA, TypeB> {
        var mapper = KeyPathMapper<TypeA, TypeB>()
        mapper.map(\TypeA.name, to: \TypeB.name)
        mapper.map(\TypeA.age, to: \TypeB.age, with: OptionalEmptyMapperTransformer(fallbackValue: 999))
        
        var submodelMapper = KeyPathMapper<TypeASubmodel, TypeBSubmodel>()
        submodelMapper.map(\TypeASubmodel.value, to: \TypeBSubmodel.value)
        mapper.map(\TypeA.submodel, to: \TypeB.submodel, with: NestedMapperTransformer(keyPathMapper: submodelMapper))
        
        return mapper
    }

var a = TypeA(name: "TypeA", age: 20, submodel: TypeASubmodel(value: "TypeASubmodel"))
Var b = TypeB(name: "TypeB", age: nil, submodel: TypeBSubmodel(value: "TypeBSubmodel"))
        
let updated: TypeA = mapper.updated(value: a, from: b)
// OR
mapper.update(value: &a, from: b)

```


### KeyPathMapper
**KeyPathMapper** represent a base class for mapping two models.

**Initialisation:**

`KeyPathMapper<TypeA, TypeB>()`

**Add mapping:**
- If it’s mapping same type then you can avoid `transformer` part

 ```
 mapper.map(\TypeA.name, to: \TypeB.name)
 ```

- If it’s mapping same type, but one of them is optional you can use `OptionalEmptyMapperTransformer` by providing default value

```
mapper.map(\TypeA.age, to: \TypeB.age, with: OptionalEmptyMapperTransformer(fallbackValue: 999))
```

- In case you are sure you that value exist and don’t want to use `OptionalEmptyMapperTransformer` you can force unwrap KeyPath\

```
mapper.map(\TypeA.age, to: \TypeB.age!)
```

- If you have nested subtype, you can use `NestedMapperTransformer` with their own `TypeASubmodel.value`  

```
var submodelMapper = KeyPathMapper<TypeASubmodel, TypeBSubmodel>()
submodelMapper.map(\TypeASubmodel.value, to: \TypeBSubmodel.value)
mapper.map(\TypeA.submodel, to: \TypeB.submodel, with: NestedMapperTransformer(keyPathMapper: submodelMapper))
```

### MapperTransfomer
**MapperTransfomer** are transforming value on mapping. You can create your own transformations by creating a type which conforms to  **MapperTransfomer**.

Example transforming Int to String and vice versa will look like:

```
public struct IntStringMapperTransformer: MapperTransfomer {
    public typealias TypeA = Int
    public typealias TypeB = String
    
    public func transform(from previous: TypeB, with value: TypeA) -> TypeB {
        return TypeB(value)
    }
    
    public func transform(from previous: TypeA, with value: TypeB) -> TypeA {
        return TypeA(value)!
    }
}
```

