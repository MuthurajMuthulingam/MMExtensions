// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SPMDemo",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    dependencies: [
        // Add MMExtensions as a dependency
        // For local development, use:
        .package(path: "../")
        // For remote repository, use:
        // .package(url: "https://github.com/MuthurajMuthulingam/MMExtensions.git", from: "0.2.0")
    ],
    targets: [
        .executableTarget(
            name: "SPMDemo",
            path: "Sources/SPMDemo"
        )
    ]
)
