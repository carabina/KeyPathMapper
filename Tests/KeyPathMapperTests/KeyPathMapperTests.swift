import XCTest
@testable import KeyPathMapper

struct TypeA {
    var name: String
    var age: Int
    var submodel: TypeASubmodel
}

struct TypeASubmodel {
    var value: String = ""
}

struct TypeB {
    var name: String
    var age: Int?
    var submodel: TypeBSubmodel
}

struct TypeBSubmodel {
    var value: String = ""
}

extension TypeA: MappableInitializable {
    init() {
        self.name = ""
        self.age = 0
        self.submodel = TypeASubmodel(value: "")
    }
}

class TypeC {
    var value: String = ""
}

class TypeD: NSObject {
    @objc dynamic var value: String = ""
}

final class KeyPathMapperTests: XCTestCase {
    
    var mapper: KeyPathMapper<TypeA, TypeB> {
        var mapper = KeyPathMapper<TypeA, TypeB>()
        mapper.map(\TypeA.name, to: \TypeB.name)
        mapper.map(\TypeA.age, to: \TypeB.age, fallbackValue: 0)
        
        var submodelMapper = KeyPathMapper<TypeASubmodel, TypeBSubmodel>()
        submodelMapper.map(\TypeASubmodel.value, to: \TypeBSubmodel.value)
        mapper.map(\TypeA.submodel, to: \TypeB.submodel, with: NestedMapperTransformer(keyPathMapper: submodelMapper))
        
        return mapper
    }
    
    func testMap_A_to_B() {
        let a = TypeA(name: "TypeA", age: 20, submodel: TypeASubmodel(value: "TypeASubmodel"))
        let b = TypeB(name: "TypeB", age: nil, submodel: TypeBSubmodel(value: "TypeBSubmodel"))
        
        let updated: TypeA = mapper.updated(value: a, from: b)
        
        XCTAssertEqual(updated.name, b.name)
        XCTAssertEqual(updated.age, 0)
        XCTAssertEqual(updated.submodel.value, b.submodel.value)
        
    }
    
    func testMap_B_to_A() {
        let a = TypeA(name: "TypeA", age: 20, submodel: TypeASubmodel(value: "TypeASubmodel"))
        let b = TypeB(name: "TypeB", age: nil, submodel: TypeBSubmodel(value: "TypeBSubmodel"))
        
        let updated: TypeB = mapper.updated(value: b, from: a)
        
        XCTAssertEqual(updated.name, a.name)
        XCTAssertEqual(updated.age, a.age)
        XCTAssertEqual(updated.submodel.value, a.submodel.value)
    }
    
    func testConvert_B_to_A() {
        let b = TypeB(name: "TypeB", age: nil, submodel: TypeBSubmodel(value: "TypeBSubmodel"))
        
        let updated: TypeA = mapper.convert(from: b)
        
        XCTAssertEqual(updated.name, b.name)
        XCTAssertEqual(updated.age, 0)
        XCTAssertEqual(updated.submodel.value, b.submodel.value)
    }
    
    func testObserve_C_mapTo_D() {
        let c = TypeC()
        let d = TypeD()
        
        var mapper = KeyPathMapper<TypeD, TypeC>()
        mapper.map(\TypeD.value, to: \TypeC.value)
        
        var observation: KeyPathObservation? = mapper.observe(object: d, mapInto: c)
        
        d.value = "Foo"
        
        XCTAssertEqual(c.value, d.value)
        
        observation = nil
    }
    
    func testObserve_C_mapTo_D_deallocated() {
        let c = TypeC()
        let d = TypeD()
        
        var mapper = KeyPathMapper<TypeD, TypeC>()
        mapper.map(\TypeD.value, to: \TypeC.value)
        
        var observation: KeyPathObservation? = mapper.observe(object: d, mapInto: c)
        
        d.value = "Foo"
        observation = nil
        d.value = "Boo"
        
        XCTAssertEqual(c.value, "Foo")
        XCTAssertEqual(d.value, "Boo")
    }
    
    func testClosureTransformer() {
        var mapper = KeyPathMapper<TypeD, TypeC>()
        mapper.map(\TypeC.value, to: \TypeD.value, propertyMap: { (typeCValue, typeDValue) in
            return typeDValue + "!"
        }, oppositePropertyMap: { (typeDValue, typeCValue) in
            return typeCValue + "?"
        })
        
        var c = TypeC()
        var d = TypeD()
        d.value = "Foo"
        
        mapper.update(value: &c, from: d)
        mapper.update(value: &d, from: c)
        
        XCTAssertEqual(c.value, "Foo!")
        XCTAssertEqual(d.value, "Foo!?")
    }

    static var allTests = [
        ("testMap_A_to_B", testMap_A_to_B, "testMap_B_to_A", testMap_B_to_A),
    ]
}
