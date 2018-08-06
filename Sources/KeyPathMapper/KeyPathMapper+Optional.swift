import Foundation

extension KeyPathMapper {
    
    /// Map KeyPath of type A to KeyPath of type B, if value is nil will use fallback value
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - fallbackValue: fallback value to use if value for KeyPath is nil
    public mutating func map<TypeProperty>(_ aKeyPath: KeyPathA<TypeProperty>,
                                           to bKeyPath: KeyPathB<Optional<TypeProperty>>,
                                           fallbackValue: TypeProperty) {
        map(aKeyPath, to: bKeyPath, with: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue))
    }
    
    /// Map KeyPath of type A to KeyPath of type B, if value is nil will use fallback value
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - fallbackValue: fallback value to use if value for KeyPath is nil
    public mutating func map<TypeProperty>(_ aKeyPath: KeyPathA<Optional<TypeProperty>>,
                                           to bKeyPath: KeyPathB<TypeProperty>,
                                           fallbackValue: TypeProperty) {
        map(bKeyPath, to: aKeyPath, with: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue))
    }
    
    /// Map KeyPath of type A to KeyPath of type B, if value is nil will use fallback value
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - fallbackValue: fallback value to use if value for KeyPath is nil
    public mutating func map<TypeProperty>(_ bKeyPath: KeyPathB<Optional<TypeProperty>>,
                                           to aKeyPath: KeyPathA<TypeProperty>,
                                           fallbackValue: TypeProperty) {
        map(bKeyPath, to: aKeyPath, with: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue))
    }
    
    /// Map KeyPath of type A to KeyPath of type B, if value is nil will use fallback value
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - fallbackValue: fallback value to use if value for KeyPath is nil
    public mutating func map<TypeProperty>(_ bKeyPath: KeyPathB<TypeProperty>,
                                           to aKeyPath: KeyPathA<Optional<TypeProperty>>,
                                           fallbackValue: TypeProperty) {
        map(aKeyPath, to: bKeyPath, with: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue))
    }
    
}

extension KeyPathMapper where TypeA: NSObject, TypeB: AnyObject {
    
    /// Map KeyPath of type A to KeyPath of type B, if value is nil will use fallback value
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - fallbackValue: fallback value to use if value for KeyPath is nil
    public mutating func map<TypeProperty>(_ aKeyPath: ReferenceKeyPathA<TypeProperty>,
                                           to bKeyPath: ReferenceKeyPathB<Optional<TypeProperty>>,
                                           fallbackValue: TypeProperty) {
        map(aKeyPath, to: bKeyPath, with: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue))
    }
    
    /// Map KeyPath of type A to KeyPath of type B, if value is nil will use fallback value
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - fallbackValue: fallback value to use if value for KeyPath is nil
    public mutating func map<TypeProperty>(_ aKeyPath: ReferenceKeyPathA<Optional<TypeProperty>>,
                                           to bKeyPath: ReferenceKeyPathB<TypeProperty>,
                                           fallbackValue: TypeProperty) {
        map(bKeyPath, to: aKeyPath, with: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue))
    }
    
    /// Map KeyPath of type A to KeyPath of type B, if value is nil will use fallback value
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - fallbackValue: fallback value to use if value for KeyPath is nil
    public mutating func map<TypeProperty>(_ bKeyPath: ReferenceKeyPathB<Optional<TypeProperty>>,
                                           to aKeyPath: ReferenceKeyPathA<TypeProperty>,
                                           fallbackValue: TypeProperty) {
        map(bKeyPath, to: aKeyPath, with: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue))
    }
    
    /// Map KeyPath of type A to KeyPath of type B, if value is nil will use fallback value
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - fallbackValue: fallback value to use if value for KeyPath is nil
    public mutating func map<TypeProperty>(_ bKeyPath: ReferenceKeyPathB<TypeProperty>,
                                           to aKeyPath: ReferenceKeyPathA<Optional<TypeProperty>>,
                                           fallbackValue: TypeProperty) {
        map(aKeyPath, to: bKeyPath, with: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue))
    }
    
}

extension KeyPathMapper where TypeB: NSObject, TypeA: AnyObject {
    
    /// Map KeyPath of type A to KeyPath of type B, if value is nil will use fallback value
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - fallbackValue: fallback value to use if value for KeyPath is nil
    public mutating func map<TypeProperty>(_ aKeyPath: ReferenceKeyPathA<TypeProperty>,
                                           to bKeyPath: ReferenceKeyPathB<Optional<TypeProperty>>,
                                           fallbackValue: TypeProperty) {
        map(aKeyPath, to: bKeyPath, with: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue))
    }
    
    /// Map KeyPath of type A to KeyPath of type B, if value is nil will use fallback value
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - fallbackValue: fallback value to use if value for KeyPath is nil
    public mutating func map<TypeProperty>(_ aKeyPath: ReferenceKeyPathA<Optional<TypeProperty>>,
                                           to bKeyPath: ReferenceKeyPathB<TypeProperty>,
                                           fallbackValue: TypeProperty) {
        map(bKeyPath, to: aKeyPath, with: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue))
    }
    
    /// Map KeyPath of type A to KeyPath of type B, if value is nil will use fallback value
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - fallbackValue: fallback value to use if value for KeyPath is nil
    public mutating func map<TypeProperty>(_ bKeyPath: ReferenceKeyPathB<Optional<TypeProperty>>,
                                           to aKeyPath: ReferenceKeyPathA<TypeProperty>,
                                           fallbackValue: TypeProperty) {
        map(bKeyPath, to: aKeyPath, with: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue))
    }
    
    /// Map KeyPath of type A to KeyPath of type B, if value is nil will use fallback value
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - fallbackValue: fallback value to use if value for KeyPath is nil
    public mutating func map<TypeProperty>(_ bKeyPath: ReferenceKeyPathB<TypeProperty>,
                                           to aKeyPath: ReferenceKeyPathA<Optional<TypeProperty>>,
                                           fallbackValue: TypeProperty) {
        map(aKeyPath, to: bKeyPath, with: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue))
    }
    
}
