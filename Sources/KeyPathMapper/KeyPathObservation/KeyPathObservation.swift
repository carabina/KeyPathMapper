import Foundation

public class KeyPathObservation {
    fileprivate var observations: [NSKeyValueObservation] = []
}

extension NSKeyValueObservation {
    func dispose(with observation: KeyPathObservation) {
        observation.observations.append(self)
    }
}
