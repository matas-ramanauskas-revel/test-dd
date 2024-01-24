// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "test-dd",
    platforms: [
        .iOS(.v15)
    ],
    dependencies: [
        .package(url: "https://github.com/Datadog/dd-sdk-ios.git", .upToNextMajor(from: "2.0.0")),
    ],
    targets: [
        .executableTarget(
            name: "testDD",
            dependencies: [
                .product(name: "DatadogCore", package: "dd-sdk-ios"),
                .product(name: "DatadogLogs", package: "dd-sdk-ios")
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "test-ddTests",
            dependencies: ["testDD"],
            path: "Tests"
        ),
    ]
)
