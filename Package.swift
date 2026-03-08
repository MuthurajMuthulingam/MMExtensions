// swift-tools-version:5.9
import PackageDescription

// Version constant matching the podspec version
let packageVersion = "0.2.0"

let package = Package(
    name: "MMExtensions",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "MMExtensions",
            targets: ["MMExtensions"]
        )
    ],
    targets: [
        .target(
            name: "MMExtensions",
            path: "MMExtensions/Classes"
        )
    ]
)
