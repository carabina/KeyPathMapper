import Foundation

extension KeyPathMapper {
    
    /// Map between KeyPath of type A to KeyPath of type B
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - transformer: Transformer applied on values from KeyPaths when mapping from A to B and vice-versa.
    public mutating func map<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ aKeyPath: KeyPathA<TypeAProperty>,
                                                                                          to bKeyPath: KeyPathB<TypeBProperty>,
                                                                                          with transformer: Transformer)
        where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    /// Map between KeyPath of type B to KeyPath of type A
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type B
    ///   - bKeyPath: KeyPath of type A
    ///   - transformer: Transformer applied on values from KeyPaths when mapping from A to B and vice-versa.
    public mutating func map<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ bKeyPath: KeyPathB<TypeBProperty>,
                                                                                          to aKeyPath: KeyPathA<TypeAProperty>,
                                                                                          with transformer: Transformer)
        where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    /// Map between KeyPath of type A to KeyPath of type B
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - transformer: Transformer applied on values from KeyPaths when mapping from A to B and vice-versa.
    public mutating func map<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ aKeyPath: KeyPathA<TypeAProperty>,
                                                                                          to bKeyPath: KeyPathB<TypeBProperty>,
                                                                                          with transformer: Transformer)
        where Transformer.TypeB == TypeAProperty, Transformer.TypeA == TypeBProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    /// Map between KeyPath of type B to KeyPath of type A
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type B
    ///   - bKeyPath: KeyPath of type A
    ///   - transformer: Transformer applied on values from KeyPaths when mapping from A to B and vice-versa.
    public mutating func map<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ bKeyPath: KeyPathB<TypeBProperty>,
                                                                                          to aKeyPath: KeyPathA<TypeAProperty>,
                                                                                          with transformer: Transformer)
        where Transformer.TypeB == TypeAProperty, Transformer.TypeA == TypeBProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    /// Map between KeyPath of type A to KeyPath of type B
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - transformer: Transformer applied on values from KeyPaths when mapping from A to B and vice-versa.
    public mutating func map<TypeProperty, Transformer: MapperTransfomer>(_ aKeyPath: KeyPathA<TypeProperty>,
                                                                          to bKeyPath: KeyPathB<TypeProperty>,
                                                                          with transformer: Transformer)
        where Transformer.TypeA == TypeProperty, Transformer.TypeB == TypeProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    /// Map between KeyPath of type B to KeyPath of type A
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type B
    ///   - bKeyPath: KeyPath of type A
    ///   - transformer: Transformer applied on values from KeyPaths when mapping from A to B and vice-versa.
    public mutating func map<TypeProperty, Transformer: MapperTransfomer>(_ bKeyPath: KeyPathB<TypeProperty>,
                                                                          to aKeyPath: KeyPathA<TypeProperty>,
                                                                          with transformer: Transformer)
        where Transformer.TypeB == TypeProperty, Transformer.TypeA == TypeProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
}

extension KeyPathMapper where TypeA: NSObject, TypeB: AnyObject {
    
    /// Map between KeyPath of type A to KeyPath of type B
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - transformer: Transformer applied on values from KeyPaths when mapping from A to B and vice-versa.
    public mutating func map<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ aKeyPath: ReferenceKeyPathA<TypeAProperty>,
                                                                                          to bKeyPath: ReferenceKeyPathB<TypeBProperty>,
                                                                                          with transformer: Transformer)
        where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    /// Map between KeyPath of type B to KeyPath of type A
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type B
    ///   - bKeyPath: KeyPath of type A
    ///   - transformer: Transformer applied on values from KeyPaths when mapping from A to B and vice-versa.
    public mutating func map<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ bKeyPath: ReferenceKeyPathB<TypeBProperty>,
                                                                                          to aKeyPath: ReferenceKeyPathA<TypeAProperty>,
                                                                                          with transformer: Transformer)
        where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    /// Map between KeyPath of type A to KeyPath of type B
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - transformer: Transformer applied on values from KeyPaths when mapping from A to B and vice-versa.
    public mutating func map<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ aKeyPath: ReferenceKeyPathA<TypeAProperty>,
                                                                                          to bKeyPath: ReferenceKeyPathB<TypeBProperty>,
                                                                                          with transformer: Transformer)
        where Transformer.TypeB == TypeAProperty, Transformer.TypeA == TypeBProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    /// Map between KeyPath of type B to KeyPath of type A
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type B
    ///   - bKeyPath: KeyPath of type A
    ///   - transformer: Transformer applied on values from KeyPaths when mapping from A to B and vice-versa.
    public mutating func map<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ bKeyPath: ReferenceKeyPathB<TypeBProperty>,
                                                                                          to aKeyPath: ReferenceKeyPathA<TypeAProperty>,
                                                                                          with transformer: Transformer)
        where Transformer.TypeB == TypeAProperty, Transformer.TypeA == TypeBProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    /// Map between KeyPath of type A to KeyPath of type B
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - transformer: Transformer applied on values from KeyPaths when mapping from A to B and vice-versa.
    public mutating func map<TypeProperty, Transformer: MapperTransfomer>(_ aKeyPath: ReferenceKeyPathA<TypeProperty>,
                                                                          to bKeyPath: ReferenceKeyPathB<TypeProperty>,
                                                                          with transformer: Transformer)
        where Transformer.TypeA == TypeProperty, Transformer.TypeB == TypeProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    /// Map between KeyPath of type B to KeyPath of type A
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type B
    ///   - bKeyPath: KeyPath of type A
    ///   - transformer: Transformer applied on values from KeyPaths when mapping from A to B and vice-versa.
    public mutating func map<TypeProperty, Transformer: MapperTransfomer>(_ bKeyPath: ReferenceKeyPathB<TypeProperty>,
                                                                          to aKeyPath: ReferenceKeyPathA<TypeProperty>,
                                                                          with transformer: Transformer)
        where Transformer.TypeB == TypeProperty, Transformer.TypeA == TypeProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
}

extension KeyPathMapper where TypeA: AnyObject, TypeB: NSObject {
    
    /// Map between KeyPath of type A to KeyPath of type B
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - transformer: Transformer applied on values from KeyPaths when mapping from A to B and vice-versa.
    public mutating func map<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ aKeyPath: ReferenceKeyPathA<TypeAProperty>,
                                                                                          to bKeyPath: ReferenceKeyPathB<TypeBProperty>,
                                                                                          with transformer: Transformer)
        where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    /// Map between KeyPath of type B to KeyPath of type A
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type B
    ///   - bKeyPath: KeyPath of type A
    ///   - transformer: Transformer applied on values from KeyPaths when mapping from A to B and vice-versa.
    public mutating func map<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ bKeyPath: ReferenceKeyPathB<TypeBProperty>,
                                                                                          to aKeyPath: ReferenceKeyPathA<TypeAProperty>,
                                                                                          with transformer: Transformer)
        where Transformer.TypeA == TypeAProperty, Transformer.TypeB == TypeBProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    /// Map between KeyPath of type A to KeyPath of type B
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - transformer: Transformer applied on values from KeyPaths when mapping from A to B and vice-versa.
    public mutating func map<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ aKeyPath: ReferenceKeyPathA<TypeAProperty>,
                                                                                          to bKeyPath: ReferenceKeyPathB<TypeBProperty>,
                                                                                          with transformer: Transformer)
        where Transformer.TypeB == TypeAProperty, Transformer.TypeA == TypeBProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    /// Map between KeyPath of type B to KeyPath of type A
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type B
    ///   - bKeyPath: KeyPath of type A
    ///   - transformer: Transformer applied on values from KeyPaths when mapping from A to B and vice-versa.
    public mutating func map<TypeAProperty, TypeBProperty, Transformer: MapperTransfomer>(_ bKeyPath: ReferenceKeyPathB<TypeBProperty>,
                                                                                          to aKeyPath: ReferenceKeyPathA<TypeAProperty>,
                                                                                          with transformer: Transformer)
        where Transformer.TypeB == TypeAProperty, Transformer.TypeA == TypeBProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    /// Map between KeyPath of type A to KeyPath of type B
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type A
    ///   - bKeyPath: KeyPath of type B
    ///   - transformer: Transformer applied on values from KeyPaths when mapping from A to B and vice-versa.
    public mutating func map<TypeProperty, Transformer: MapperTransfomer>(_ aKeyPath: ReferenceKeyPathA<TypeProperty>,
                                                                          to bKeyPath: ReferenceKeyPathB<TypeProperty>,
                                                                          with transformer: Transformer)
        where Transformer.TypeA == TypeProperty, Transformer.TypeB == TypeProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
    /// Map between KeyPath of type B to KeyPath of type A
    ///
    /// - Parameters:
    ///   - aKeyPath: KeyPath of type B
    ///   - bKeyPath: KeyPath of type A
    ///   - transformer: Transformer applied on values from KeyPaths when mapping from A to B and vice-versa.
    public mutating func map<TypeProperty, Transformer: MapperTransfomer>(_ bKeyPath: ReferenceKeyPathB<TypeProperty>,
                                                                          to aKeyPath: ReferenceKeyPathA<TypeProperty>,
                                                                          with transformer: Transformer)
        where Transformer.TypeB == TypeProperty, Transformer.TypeA == TypeProperty {
            mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: transformer))
    }
    
}
