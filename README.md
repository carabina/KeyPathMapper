# KeyPathMapper

[![Build Status](https://travis-ci.org/marshallxxx/KeyPathMapper.svg?branch=master)](https://travis-ci.org/marshallxxx/KeyPathMapper)
![platforms](https://img.shields.io/badge/platforms-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS-333333.svg)
![pod](https://img.shields.io/cocoapods/v/KeyPathMapper.svg)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

**KeyPathMapper** is a thin library based on swift `#KeyPath` feature which facilitates mapping between two different models.

## Installation

### CocoaPods

`pod "KeyPathMapper"`

### Swift Package Manager

Create a file `Package.swift`

```swift
// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "YourProject",
    dependencies: [
        .package(url: "https://github.com/marshallxxx/KeyPathMapper.git", "1.0.0" ..< "2.0.0")
    ],
    targets: [
        .target(name: "YourProject", dependencies: ["KeyPathMapper"])
    ]
)
```


## How to use?

```swift
// MARK: - Models

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

// MARK: - Mapper generation

var mapper: KeyPathMapper<TypeA, TypeB> {
        var mapper = KeyPathMapper<TypeA, TypeB>()
        mapper.map(\TypeA.name, to: \TypeB.name)
        mapper.map(\TypeA.age, to: \TypeB.age, fallbackValue: 0)
        
        var submodelMapper = KeyPathMapper<TypeASubmodel, TypeBSubmodel>()
        submodelMapper.map(\TypeASubmodel.value, to: \TypeBSubmodel.value)
        mapper.map(\TypeA.submodel, to: \TypeB.submodel, with: NestedMapperTransformer(keyPathMapper: submodelMapper))
        
        return mapper
    }

// MARK: - Use of mapper

var a = TypeA(name: "TypeA", age: 20, submodel: TypeASubmodel(value: "TypeASubmodel"))
Var b = TypeB(name: "TypeB", age: nil, submodel: TypeBSubmodel(value: "TypeBSubmodel"))
        
let updated: TypeA = mapper.updated(value: a, from: b)
// OR
mapper.update(value: &a, from: b)

```


## KeyPathMapper
**KeyPathMapper** represent a base class for mapping two models.

**Initialisation:**
```swift 
KeyPathMapper<TypeA, TypeB>()
```

#### Add mapping:

- If it’s mapping same type then you can avoid `transformer` part

```swift 
mapper.map(\TypeA.name, to: \TypeB.name)
```

- If it’s mapping same type, but one of them is optional library is providing a simplified mapping function. Fallback value is used when you try to map `nil` to non optional value.
```swift
mapper.map(\TypeA.age, to: \TypeB.age, fallbackValue: 0)
```

- In case you are sure that value will exist at time of mapping you can force unwrap KeyPath
```swift
mapper.map(\TypeA.age, to: \TypeB.age!)
```

- If you have nested subtype, you can use `NestedMapperTransformer` with their own `KeyPathMapper`
```swift
var submodelMapper = KeyPathMapper<TypeASubmodel, TypeBSubmodel>()
submodelMapper.map(\TypeASubmodel.value, to: \TypeBSubmodel.value)
mapper.map(\TypeA.submodel, to: \TypeB.submodel, with: NestedMapperTransformer(keyPathMapper: submodelMapper))
```

#### Conversion:

Sometimes you may want to initialise a model from another one, through `KeyPathMapper`. You can do that by making your model conform to `MappableInitializable`, then you can use:
```swift
let updated: TypeA = mapper.convert(from: b)
```

#### Observing:

You can observe `KeyPath` change and map it into another model whenever new value is set. This functionality is provided only if observed object is instance of `NSObject` and observing model is a reference type.
```swift
mapper.observe(object: d, mapInto: c)
```

## MapperTransfomer

**MapperTransfomer** are transforming value on mapping. You can create your own transformations by creating a type which conforms to  **MapperTransfomer**.

Example transforming Int to String and vice versa will look like:

```swift
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
