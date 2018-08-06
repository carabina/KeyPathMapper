import Foundation

extension KeyPathMapper {
    
    public mutating func map<TypeProperty>(_ aKeyPath: KeyPathA<TypeProperty>,
                                           to bKeyPath: KeyPathB<Optional<TypeProperty>>,
                                           fallbackValue: TypeProperty) {
        map(aKeyPath, to: bKeyPath, with: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue))
    }
    
    public mutating func map<TypeProperty>(_ aKeyPath: KeyPathA<Optional<TypeProperty>>,
                                           to bKeyPath: KeyPathB<TypeProperty>,
                                           fallbackValue: TypeProperty) {
        map(bKeyPath, to: aKeyPath, with: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue))
    }
    
    public mutating func map<TypeProperty>(_ bKeyPath: KeyPathB<Optional<TypeProperty>>,
                                           to aKeyPath: KeyPathA<TypeProperty>,
                                           fallbackValue: TypeProperty) {
        map(bKeyPath, to: aKeyPath, with: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue))
    }
    
    public mutating func map<TypeProperty>(_ bKeyPath: KeyPathB<TypeProperty>,
                                           to aKeyPath: KeyPathA<Optional<TypeProperty>>,
                                           fallbackValue: TypeProperty) {
        map(aKeyPath, to: bKeyPath, with: OptionalEmptyMapperTransformer(fallbackValue: fallbackValue))
    }
    
}
