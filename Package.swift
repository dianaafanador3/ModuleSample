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
        .package(url: "https://github.com/realm/realm-swift", from: "10.24.1")
    ],
    targets: [
      .target(
            name: "ModuleSample",
            dependencies: [.product(name: "RealmSwift", package: "realm-swift")],
            path: "Sources"
      )
    ]
)
