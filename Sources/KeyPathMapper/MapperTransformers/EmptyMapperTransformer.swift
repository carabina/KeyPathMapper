import Foundation

struct EmptyMapperTransformer<MappingType>: MapperTransfomer {
    typealias TypeA = MappingType
    typealias TypeB = MappingType
    
    func transform(from previous: TypeB, with value: TypeA) -> TypeB {
        return value
    }
}
