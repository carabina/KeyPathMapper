import Foundation

/// Container for NSKeyValueObservation, when deallocated all observation inside it will stop working.
public class KeyPathObservation {
    fileprivate var observations: [NSKeyValueObservation] = []
}

extension NSKeyValueObservation {
    func dispose(with observation: KeyPathObservation) {
        observation.observations.append(self)
    }
}
