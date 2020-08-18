import XCTest
import Box

class CodableTests: XCTestCase {

    func testBoxShouldEncodeValue() {
        let id = UUID()
        let model = CodableModel(id: id, box: Box(1))

        let data = try! JSONEncoder().encode(model)

        #if os(Linux)
        let expected = "{\"box\":1,\"id\":\"\(id.uuidString)\"}"
        #else
        let expected = "{\"id\":\"\(id.uuidString)\",\"box\":1}"
        #endif

        XCTAssertEqual(expected, String(data: data, encoding: .utf8)!)
    }

    func testBoxShouldDecodeValue() {
        let id = UUID()
        let json = "{\"id\":\"\(id.uuidString)\",\"box\":1}"
        let data = json.data(using: .utf8)!

        let model = try! JSONDecoder().decode(CodableModel.self, from: data)
        let expected = CodableModel(id: id, box: Box(1))

        XCTAssertEqual(expected, model)
    }

    func testMutableBoxShouldEncodeValue() {
        let id = UUID()
        let model = MutableCodableModel(id: id, box: MutableBox(1))

        let data = try! JSONEncoder().encode(model)

        #if os(Linux)
        let expected = "{\"box\":1,\"id\":\"\(id.uuidString)\"}"
        #else
        let expected = "{\"id\":\"\(id.uuidString)\",\"box\":1}"
        #endif

        XCTAssertEqual(expected, String(data: data, encoding: .utf8)!)
    }

    func testMutableBoxShouldDecodeValue() {
        let id = UUID()
        let json = "{\"id\":\"\(id.uuidString)\",\"box\":1}"
        let data = json.data(using: .utf8)!

        let model = try! JSONDecoder().decode(MutableCodableModel.self, from: data)
        let expected = MutableCodableModel(id: id, box: MutableBox(1))

        XCTAssertEqual(expected, model)
    }
}

private struct CodableModel: Codable, Equatable {
    let id: UUID
    let box: Box<Int>
}

private struct MutableCodableModel: Codable, Equatable {
    let id: UUID
    let box: MutableBox<Int>
}
