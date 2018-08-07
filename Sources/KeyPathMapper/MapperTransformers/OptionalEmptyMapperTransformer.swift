import Foundation

struct OptionalEmptyMapperTransformer<MappingType>: MapperTransfomer {
    typealias TypeA = MappingType
    typealias TypeB = Optional<MappingType>
    
    private var fallbackValue: MappingType
    
    init(fallbackValue: MappingType) {
        self.fallbackValue = fallbackValue
    }
    
    func transform(from previous: TypeB, with value: TypeA) -> TypeB {
        return value
    }
    
    func transform(from previous: TypeA, with value: TypeB) -> TypeA {
        return value ?? fallbackValue
    }
    
}
