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
}

func address(of value: UnsafeRawPointer) -> Int {
  return Int(bitPattern: value)
}

struct Value {
  var name: String
}
#endif
