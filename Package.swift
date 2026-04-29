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
            name: "IDity",
            targets: ["IDity"])
    ],
    targets: [
        .binaryTarget(
            name: "IDity",
            path: "Frameworks/IDity.xcframework",
        )
    ]
)
