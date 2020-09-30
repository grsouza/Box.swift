# Box
![Swift](https://github.com/grsouza/Box.swift/workflows/Swift/badge.svg?branch=master)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fgrsouza%2FBox.swift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/grsouza/Box.swift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fgrsouza%2FBox.swift%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/grsouza/Box.swift)

Micro library for Swift that makes possible to transform any value type into a reference type.

## Installation

Box is distributed using [Swift Package Manager](https://swift.org/package-manager/). To install it into a project, add it as a dependency within your `Package.swift` manifest:

```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/grsouza/Box.swift.git", from: "1.0.0")
    ],
    ...
)
```

Then import Box wherever you'd like to use it:

```swift
import Box
```

## Usage

There is 2 types in the library, `Box` and `MutableBox`, they are used to hold readonly reference and mutable reference respectively. Both types are property wrappers, so it can be used in the following ways.

```swift
class MyClass {
  
    @Box(wrappedValue: "This is a Box String")
    var value: String
    
    let otherValue: Box<String>
    
}
```

### MutableBox

When using `MutableBox` you can mutate the inner value.

```swift
struct User {
    var email = "guilherme@grds.dev"
}

let user = MutableBox(wrappedValue: User())

func updateEmail(of user: MutableBox<User>) {
    user.email = "newemail@grds.dev")
}

updateEmail(of: user)

assert(user.email == "newemail@grds.dev")
```

Both `Box` and `MutableBox` implements `dynamicMemberLookup` so you can access any field from the wrapped type without "dereferencing" the box.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[Apache License 2.0](https://github.com/grsouza/Box.swift/blob/master/LICENSE)
