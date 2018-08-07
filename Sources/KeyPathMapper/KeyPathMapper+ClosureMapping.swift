import Foundation

extension KeyPathMapper {
    
    /// Map KeyPath of type A to KeyPath of type B, by transforming it's value using closures provided
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - propertyMap: Mapping closure from property of type A to property of type B
    ///   - oppositePropertyMap: Mapping closure from property of type B to property of type A
    public mutating func map<TypeAProperty, TypeBProperty>(_ aKeyPath: KeyPathA<TypeAProperty>,
                                                           to bKeyPath: KeyPathB<TypeBProperty>,
                                                           propertyMap: @escaping (TypeBProperty, TypeAProperty) -> TypeBProperty,
                                                           oppositePropertyMap: @escaping (TypeAProperty, TypeBProperty) -> TypeAProperty) {
        let transformer = ClosureBasedMapperTransformer<TypeAProperty, TypeBProperty>(mappingAtoB: propertyMap, mappingBtoA: oppositePropertyMap)
        map(aKeyPath, to: bKeyPath, with: transformer)
    }
    
    /// Map KeyPath of type A to KeyPath of type B, by transforming it's value using closures provided
    ///
    /// - Parameters:
    ///   - bKeyPath: KeyPath of type B
    ///   - aKeyPath: KeyPath of type A
    ///   - propertyMap: Mapping closure from property of type B to property of type A
    ///   - oppositePropertyMap: Mapping closure from property of type A to property of type B
    public mutating func map<TypeAProperty, TypeBProperty>(_ bKeyPath: KeyPathB<TypeAProperty>,
                                                           to aKeyPath: KeyPathA<TypeBProperty>,
                                                           propertyMap: @escaping (TypeAProperty, TypeBProperty) -> TypeAProperty,
                                                           oppositePropertyMap: @escaping (TypeBProperty, TypeAProperty) -> TypeBProperty) {
        let transformer = ClosureBasedMapperTransformer<TypeAProperty, TypeBProperty>(mappingAtoB: oppositePropertyMap, mappingBtoA: propertyMap)
        map(aKeyPath, to: bKeyPath, with: transformer)
    }
    
}

/// :nodoc:
extension KeyPathMapper where TypeA: NSObject, TypeB: AnyObject {
    
    public mutating func map<TypeAProperty, TypeBProperty>(_ aKeyPath: ReferenceKeyPathA<TypeAProperty>,
                                                           to bKeyPath: ReferenceKeyPathB<TypeBProperty>,
                                                           propertyMap: @escaping (TypeBProperty, TypeAProperty) -> TypeBProperty,
                                                           oppositePropertyMap: @escaping (TypeAProperty, TypeBProperty) -> TypeAProperty) {
        let transformer = ClosureBasedMapperTransformer<TypeAProperty, TypeBProperty>(mappingAtoB: propertyMap, mappingBtoA: oppositePropertyMap)
        map(aKeyPath, to: bKeyPath, with: transformer)
    }
    
    public mutating func map<TypeAProperty, TypeBProperty>(_ bKeyPath: ReferenceKeyPathB<TypeAProperty>,
                                                           to aKeyPath: ReferenceKeyPathA<TypeBProperty>,
                                                           propertyMap: @escaping (TypeAProperty, TypeBProperty) -> TypeAProperty,
                                                           oppositePropertyMap: @escaping (TypeBProperty, TypeAProperty) -> TypeBProperty) {
        let transformer = ClosureBasedMapperTransformer<TypeAProperty, TypeBProperty>(mappingAtoB: oppositePropertyMap, mappingBtoA: propertyMap)
        map(aKeyPath, to: bKeyPath, with: transformer)
    }
    
}

/// :nodoc:
extension KeyPathMapper where TypeB: NSObject, TypeA: AnyObject {
    
    public mutating func map<TypeAProperty, TypeBProperty>(_ aKeyPath: ReferenceKeyPathA<TypeAProperty>,
                                                           to bKeyPath: ReferenceKeyPathB<TypeBProperty>,
                                                           propertyMap: @escaping (TypeBProperty, TypeAProperty) -> TypeBProperty,
                                                           oppositePropertyMap: @escaping (TypeAProperty, TypeBProperty) -> TypeAProperty) {
        let transformer = ClosureBasedMapperTransformer<TypeAProperty, TypeBProperty>(mappingAtoB: propertyMap, mappingBtoA: oppositePropertyMap)
        map(aKeyPath, to: bKeyPath, with: transformer)
    }
    
    public mutating func map<TypeAProperty, TypeBProperty>(_ bKeyPath: ReferenceKeyPathB<TypeAProperty>,
                                                           to aKeyPath: ReferenceKeyPathA<TypeBProperty>,
                                                           propertyMap: @escaping (TypeAProperty, TypeBProperty) -> TypeAProperty,
                                                           oppositePropertyMap: @escaping (TypeBProperty, TypeAProperty) -> TypeBProperty) {
        let transformer = ClosureBasedMapperTransformer<TypeAProperty, TypeBProperty>(mappingAtoB: oppositePropertyMap, mappingBtoA: propertyMap)
        map(aKeyPath, to: bKeyPath, with: transformer)
    }
    
}
