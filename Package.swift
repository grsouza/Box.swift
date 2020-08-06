// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Box",
  platforms: [
    .iOS(.v8),
    .macOS(.v10_10),
    .tvOS(.v9),
    .watchOS(.v2)
  ],
  products: [
    .library(
      name: "Box",
      targets: ["Box"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Box",
      dependencies: []),
    .testTarget(
      name: "BoxTests",
      dependencies: ["Box"]),
  ],
  swiftLanguageVersions: [.v5]
)
