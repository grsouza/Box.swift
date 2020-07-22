import XCTest
@testable import Box

final class MutableBoxTests: XCTestCase {

    @MutableBox(wrappedValue: Value(name: "Box")) var box

    func testMutableBox() {
        let box2 = $box

        let boxAddress = address(of: &$box.wrappedValue)
        let box2Address = address(of: &box2.wrappedValue)

        XCTAssertEqual(boxAddress, box2Address)

        box.name = "New Box"

        XCTAssertEqual(box2.name, "New Box")
    }
}
