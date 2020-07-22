import XCTest
@testable import Box

final class BoxTests: XCTestCase {

    @Box(wrappedValue: Value(name: "Box")) var box

    func testBox() {
        let box2 = $box

        let boxAddress = address(of: &$box.wrappedValue)
        let box2Address = address(of: &box2.wrappedValue)

        XCTAssertEqual(boxAddress, box2Address)
    }
}

func address(of value: UnsafeRawPointer) -> Int {
    return Int(bitPattern: value)
}

struct Value {
    var name: String
}
