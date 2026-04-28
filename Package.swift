import PackageDescription

let package = Package(
    name: "IDity",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15_6)
    ],
    products: [
        // The product points to the wrapper target
        .library(name: "IDity", targets: ["IDity"])
    ],
    targets: [
        // 1. The Wrapper Target
        // This handles your resources (PrivacyInfo, Localizable) and logic
        .target(
            name: "IDity",
            dependencies: ["IDityFramework"], // Depends on the binary renamed below
            path: "Source",
            resources: [
                .process("PrivacyInfo.xcprivacy"),
                .process("Localizable.xcstrings")
            ],
            swiftSettings: [.enableUpcomingFeature("ExistentialAny")]
        ),
        
        // 2. The Binary Target
        // Renamed to avoid conflict with the wrapper target name
        .binaryTarget(
            name: "IDityFramework", 
            path: "IDity.xcframework"
        )
    ],
    swiftLanguageModes: [.v5]
)
