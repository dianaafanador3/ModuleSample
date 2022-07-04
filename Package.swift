// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ModuleSample",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_12),
    ],
    products: [
        .library(
            name: "ModuleSample",
            targets: ["ModuleSample"]),
        .library(
            name: "InternalFrameworkRealmSupport",
            targets: ["InternalFrameworkRealmSupport"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/arturdev/Unrealm.git", .upToNextMajor(from: "1.9.4")),
        .package(url: "https://github.com/tkreind/SwiftKeychainWrapper.git", .branch("develop")),
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
        .package(url: "https://github.com/Flight-School/AnyCodable", from: "0.6.0"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ModuleSample",
            dependencies: [
                "SwiftKeychainWrapper",
                "Moya",
                "AnyCodable"
            ]
        ),
        .target(
            name: "InternalFrameworkRealmSupport",
            dependencies: ["ModuleSample", "Unrealm"],
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "InternalFrameworkTests",
            dependencies: ["ModuleSample", "InternalFrameworkRealmSupport", "SwiftKeychainWrapper"],
            path: "Tests/"
        )
    ]
)
