#if !os(watchOS)
import XCTest
@testable import Box

final class BoxTests: XCTestCase {
  
  var box = Box(Value(name: "Box"))
  
  func testBox() {
    let box2 = box
    
    let boxAddress = address(of: &box.value)
    let box2Address = address(of: &box2.value)
    
    XCTAssertEqual(boxAddress, box2Address)
  }

  func testBox_customStringConvertible() {
    XCTAssertEqual("\(box)", "Value: Box")
  }
}

func address(of value: UnsafeRawPointer) -> Int {
  return Int(bitPattern: value)
}

struct Value: CustomStringConvertible {
  var name: String

  var description: String {
    "Value: \(name)"
  }
}
#endif
