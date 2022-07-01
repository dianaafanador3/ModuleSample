// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ModuleSample",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v11),
        .tvOS(.v9),
        .watchOS(.v2)
    ],
    products: [
        .library(
            name: "ModuleSample",
            targets: ["ModuleSample"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift", from: "10.28.2"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
      .target(
            name: "ModuleSample",
            dependencies: [.product(name: "RealmSwift", package: "realm-swift")],
            path: "Sources"
      )
    ]
)
