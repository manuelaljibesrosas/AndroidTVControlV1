// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AndroidTVRemoteCLI",
    platforms: [
        .macOS(.v10_15), // Specify macOS deployment target
        // Add other platforms like .iOS(.vXX) if necessary
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-certificates.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AndroidTVRemoteCLI",
            dependencies: []),
        .testTarget(
            name: "AndroidTVRemoteCLITests",
            dependencies: ["AndroidTVRemoteCLI"]),
    ]
)
