// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "IDity-iOS",
    platforms: [
        // Using a string avoids the "v15_6" resolution error
        .iOS("15.6")
    ],
    products: [
        .library(
            name: "IDity-iOS",
            targets: ["IDity-iOS"])
    ],
    targets: [
        // 1. The Main Target (The "Buildable" part)
        .target(
            name: "IDity-iOS",
            dependencies: ["IDity"], // It depends on the binary below
            path: "Sources/IDity-iOS"    // Points to your YourCode.swift folder
        ),
        
        // 2. The Binary Target (The .xcframework)
        .binaryTarget(
            name: "IDity",
            path: "Frameworks/IDity.xcframework"
        )
    ]
)
