// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SimpleCodeToGraphPumper",
    products: [
        .library(name: "SimpleCodeToGraphPumper", targets: ["SimpleCodeToGraphPumper"])
    ],
    dependencies: [
        .package(url: "https://github.com/objecthub/swift-commandlinekit.git", .branch("master")),
        .package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.2.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.2.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SimpleCodeToGraphPumper",
            dependencies: ["CommandLineKit", "ShellOut", "Logging"]),
        .testTarget(
            name: "SimpleCodeToGraphPumperTests",
            dependencies: ["SimpleCodeToGraphPumper"]),
    ]
)
