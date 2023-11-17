// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwinjectExtension",
    products: [
        .library(
            name: "SwinjectExtension-Dynamic",
            type: .dynamic,
            targets: ["SwinjectExtension"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0")
    ],
    targets: [
        .target(
            name: "SwinjectExtension",
            dependencies: [
                .product(name: "Swinject")
            ]
        ),
        .testTarget(
            name: "SwinjectExtensionTests",
            dependencies: [
                "SwinjectExtension",
                .product(name: "Swinject")
            ]
        )
    ]
)
