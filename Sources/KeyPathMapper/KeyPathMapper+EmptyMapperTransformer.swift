import Foundation

extension KeyPathMapper {
    
    /// Direct mapping between KeyPath of type A to KeyPath of type B
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    public mutating func map<TypeProperty>(_ aKeyPath: KeyPathA<TypeProperty>,
                                           to bKeyPath: KeyPathB<TypeProperty>) {
        map(aKeyPath, to: bKeyPath, with: EmptyMapperTransformer<TypeProperty>())
    }
    
    /// Direct mapping between KeyPath of type B to KeyPath of type B
    ///
    /// - Parameters:
    ///   - bKeyPath: KeyPath of type B
    ///   - aKeyPath: KeyPath of type A
    public mutating func map<TypeProperty>(_ bKeyPath: KeyPathB<TypeProperty>,
                                           to aKeyPath: KeyPathA<TypeProperty>) {
        map(aKeyPath, to: bKeyPath, with: EmptyMapperTransformer<TypeProperty>())
    }
    
}

/// :nodoc:
extension KeyPathMapper where TypeA: NSObject, TypeB: AnyObject {
    
    public mutating func map<TypeProperty>(_ aKeyPath: ReferenceKeyPathA<TypeProperty>,
                                           to bKeyPath: ReferenceKeyPathB<TypeProperty>) {
        map(aKeyPath, to: bKeyPath, with: EmptyMapperTransformer<TypeProperty>())
    }
    
    public mutating func map<TypeProperty>(_ bKeyPath: ReferenceKeyPathB<TypeProperty>,
                                           to aKeyPath: ReferenceKeyPathA<TypeProperty>) {
        map(aKeyPath, to: bKeyPath, with: EmptyMapperTransformer<TypeProperty>())
    }
    
}

/// :nodoc:
extension KeyPathMapper where TypeB: NSObject, TypeA: AnyObject {
    
    public mutating func map<TypeProperty>(_ aKeyPath: ReferenceKeyPathA<TypeProperty>,
                                           to bKeyPath: ReferenceKeyPathB<TypeProperty>) {
        map(aKeyPath, to: bKeyPath, with: EmptyMapperTransformer<TypeProperty>())
    }
    
    public mutating func map<TypeProperty>(_ bKeyPath: ReferenceKeyPathB<TypeProperty>,
                                           to aKeyPath: ReferenceKeyPathA<TypeProperty>) {
        map(aKeyPath, to: bKeyPath, with: EmptyMapperTransformer<TypeProperty>())
    }
    
}
