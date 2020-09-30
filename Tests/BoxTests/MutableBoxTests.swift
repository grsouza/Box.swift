#if !os(watchOS)
import XCTest
@testable import Box

final class MutableBoxTests: XCTestCase {
  
  var box = MutableBox(Value(name: "Box"))
  
  func testMutableBox() {
    let box2 = box
    
    let boxAddress = address(of: &box.value)
    let box2Address = address(of: &box2.value)
    
    XCTAssertEqual(boxAddress, box2Address)
    
    box.value.name = "New Box"
    
    XCTAssertEqual(box2.value.name, "New Box")
  }

  func testMutableBox_customStringConvertible() {
    XCTAssertEqual("\(box)", "Value: Box")
    box.value.name = "New Box"
    XCTAssertEqual("\(box)", "Value: New Box")
  }
}
#endif
