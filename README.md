# SwinjectExtension

## Installation

### Swift Package Manager
in `Package.swift` add the following:
```swift
let package = Package(
    name: "TestProject",
    dependencies: [
        .package(url: "https://github.com/Woin2ee-Modules/SwinjectExtension.git", .upToNextMajor(from: "2.0.0"))
    ],
    targets: [
        .target(name: "TestProject", dependencies: ["SwinjectExtension-Dynamic", "SwinjectDIContainer-Dynamic"])
    ]
)
```
