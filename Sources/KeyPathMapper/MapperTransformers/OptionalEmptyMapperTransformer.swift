import Foundation

struct OptionalEmptyMapperTransformer<MappingType>: MapperTransfomer {
    public typealias TypeA = MappingType
    public typealias TypeB = Optional<MappingType>
    
    private var fallbackValue: MappingType
    
    public init(fallbackValue: MappingType) {
        self.fallbackValue = fallbackValue
    }
    
    public func transform(from previous: TypeB, with value: TypeA) -> TypeB {
        return value
    }
    
    public func transform(from previous: TypeA, with value: TypeB) -> TypeA {
        return value ?? fallbackValue
    }
    
}
