// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProtoRepro",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ProtoRepro",
            targets: ["ProtoRepro"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf", from: "1.21.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ProtoRepro",
            dependencies: [
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
            ],
            exclude: ["swift-protobuf-config.json"],
            plugins: [
                .plugin(name: "SwiftProtobufPlugin", package: "swift-protobuf")
            ]),
        .testTarget(
            name: "ProtoReproTests",
            dependencies: ["ProtoRepro"]),
    ]
)
