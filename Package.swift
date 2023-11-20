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
        ),
        .library(
            name: "SwinjectDIContainer-Dynamic",
            type: .dynamic,
            targets: ["SwinjectDIContainer"]
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
        .target(
            name: "SwinjectDIContainer",
            dependencies: [
                .product(name: "Swinject")
            ]
        ),
        .testTarget(
            name: "SwinjectExtensionTests",
            dependencies: [
                "SwinjectExtension",
                "SwinjectDIContainer",
                .product(name: "Swinject")
            ]
        )
    ]
)
