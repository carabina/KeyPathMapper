import Foundation

extension KeyPathMapper where TypeA: NSObject, TypeB: AnyObject {
    func observe(object: TypeA, mapInto updatingObject: TypeB) -> KeyPathObservation {
        let observation = KeyPathObservation()
        mappingPairs.forEach { mappingKey in
            mappingKey.observe(object: object, mapInto: updatingObject).dispose(with: observation)
        }
        return observation
    }
    
    public mutating func map<TypeProperty>(_ aKeyPath: ReferenceWritableKeyPath<TypeA, TypeProperty>,
                                           to bKeyPath: ReferenceWritableKeyPath<TypeB, TypeProperty>) {
        mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: EmptyMapperTransformer<TypeProperty>()))
    }
    
    public mutating func map<TypeProperty>(_ bKeyPath: ReferenceWritableKeyPath<TypeB, TypeProperty>,
                                           to aKeyPath: ReferenceWritableKeyPath<TypeA, TypeProperty>) {
        mappingPairs.append(MappingPair.init(aKeyPath, bKeyPath, transformer: EmptyMapperTransformer<TypeProperty>()))
    }
    
}
