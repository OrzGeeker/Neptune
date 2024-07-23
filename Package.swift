// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Neptune",
    platforms: [
        .macOS(.v11),
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Neptune",
            targets: ["Neptune"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "Neptune", 
            url: "https://github.com/OrzGeeker/Neptune/releases/download/0.0.1/Neptune.xcframework.zip", 
            checksum: "a4e7590ddd76726ae13b6fc6a1f51ca4426bf68336065ae1a4b68e7b7ae8677f"
        ),
    ]
)
