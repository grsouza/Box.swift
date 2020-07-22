import XCTest
@testable import Box

final class BoxTests: XCTestCase {

    @Box(wrappedValue: Value(name: "Box")) var box

    func testBox() {

        func mutate(_ b: Box<Value>) {
            b.name = "New Box"
        }

        mutate($box)

        XCTAssertEqual(box.name, "New Box")
    }
}

struct Value {
    var name: String
}
