// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "IDity-iOS",
    platforms: [
        .iOS(.v15_6) // Set this to your framework's minimum supported version
    ],
    products: [
        .library(
            name: "IDity",
            targets: ["IDity"])
    ],
    targets: [
        .binaryTarget(
            name: "IDity",
            path: "Frameworks/IDity.xcframework"
        )
    ]
)
