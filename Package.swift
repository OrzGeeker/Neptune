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
            checksum: "bcd2ea2dadbd4f0fa76f16e7b8f8822bf5e18e6be405550f02781750b04447b8"
        ),
    ]
)
