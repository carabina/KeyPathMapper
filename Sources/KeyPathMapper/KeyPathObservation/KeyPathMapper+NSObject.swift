import Foundation

extension KeyPathMapper where TypeA: NSObject, TypeB: AnyObject {
    
    /// Observe changes in A for all registered KeyPaths and map them to B
    ///
    /// - Parameters:
    ///   - object: object to observe for changes
    ///   - updatingObject: object to update
    /// - Returns: KeyPathObservation, container for NSKeyValueObservation
    public func observe(object: TypeA, mapInto updatingObject: TypeB) -> KeyPathObservation {
        let observation = KeyPathObservation()
        mappingPairs.forEach { mappingKey in
            mappingKey.observe(object: object, mapInto: updatingObject).dispose(with: observation)
        }
        return observation
    }
    
}

extension KeyPathMapper where TypeA: AnyObject, TypeB: NSObject {
    
    /// Observe changes in B for all registered KeyPaths and map them to A
    ///
    /// - Parameters:
    ///   - object: object to observe for changes
    ///   - updatingObject: object to update
    /// - Returns: KeyPathObservation, container for NSKeyValueObservation
    public func observe(object: TypeB, mapInto updatingObject: TypeA) -> KeyPathObservation {
        let observation = KeyPathObservation()
        mappingPairs.forEach { mappingKey in
            mappingKey.observe(object: object, mapInto: updatingObject).dispose(with: observation)
        }
        return observation
    }
    
}
