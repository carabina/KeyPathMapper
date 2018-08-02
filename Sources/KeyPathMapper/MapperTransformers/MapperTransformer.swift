import Foundation

public protocol MapperTransfomer {
    associatedtype TypeA
    associatedtype TypeB
    
    func transform(from previous: TypeB, with value: TypeA) -> TypeB
    func transform(from previous: TypeA, with value: TypeB) -> TypeA
}
