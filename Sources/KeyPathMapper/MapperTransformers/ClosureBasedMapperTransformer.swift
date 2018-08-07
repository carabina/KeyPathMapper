import Foundation

struct ClosureBasedMapperTransformer<MappingTypeA, MappingTypeB>: MapperTransfomer {
    typealias TypeA = MappingTypeA
    typealias TypeB = MappingTypeB
    
    typealias MappingAtoB = (MappingTypeB, MappingTypeA) -> MappingTypeB
    typealias MappingBtoA = (MappingTypeA, MappingTypeB) -> MappingTypeA
    
    private let mappingAtoB: MappingAtoB
    private let mappingBtoA: MappingBtoA
    
    init(mappingAtoB: @escaping MappingAtoB, mappingBtoA: @escaping MappingBtoA) {
        self.mappingAtoB = mappingAtoB
        self.mappingBtoA = mappingBtoA
    }
    
    func transform(from previous: MappingTypeB, with value: MappingTypeA) -> MappingTypeB {
        return mappingAtoB(previous, value)
    }
    
    func transform(from previous: MappingTypeA, with value: MappingTypeB) -> MappingTypeA {
        return mappingBtoA(previous, value)
    }
    
}
