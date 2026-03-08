# MMExtensions SPM Demo

This is a comprehensive demonstration project showing how to use **MMExtensions** with Swift Package Manager (SPM).

## Overview

The SPM Demo project provides:
- **Executable example** of MMExtensions usage
- **Package.swift configuration** for SPM integration
- **Feature demonstrations** for all major extensions
- **Setup instructions** for local and remote packages

## Project Structure

```
SPMDemo/
├── Package.swift              # SPM package manifest
├── README.md                  # This file
└── Sources/
    └── SPMDemo/
        └── main.swift         # Demo executable with examples
```

## Quick Start

### Prerequisites

- Swift 5.9+
- Xcode 15.0+
- macOS 13.0+ or iOS 16.0+

### Running the Demo

#### Via Command Line

```bash
cd SPMDemo
swift run SPMDemo
```

#### Via Xcode

```bash
cd SPMDemo
swift package generate-xcodeproj
open SPMDemo.xcodeproj
```

Then press `Cmd+R` to build and run.

## Configuration Options

### Option 1: Local Development (Default)

For local development where MMExtensions is in the parent directory:

```swift
// Package.swift
dependencies: [
    .package(path: "../")
]
```

### Option 2: Remote Repository

To use MMExtensions from GitHub:

```swift
// Package.swift
dependencies: [
    .package(url: "https://github.com/MuthurajMuthulingam/MMExtensions.git", from: "0.2.0")
]
```

## Features Demonstrated

### 1. String Extensions
```swift
import MMExtensions

let text = "hello world"
print(text.capitalizedFirst)  // "Hello world"
print(text.containsWhiteSpaceAndNewLines())  // true
print(text.trimWhiteSpaceAndNewLines())  // "helloworld"
print(text[0])  // "h"
```

### 2. Number Extensions
```swift
let number: NSNumber = 42
// Number type utilities available
```

### 3. Date Extensions
```swift
let today = Date()
// Date manipulation and formatting utilities
```

### 4. Text Layout
```swift
let font = UIFont.systemFont(ofSize: 16)
let size = CGSize(width: 200, height: CGFloat.greatestFiniteMagnitude)
let height = "Some text".heightForBounding(size, font: font)
let width = "Some text".widthFor(size, font: font)
```

### 5. Localization
```swift
let localizedText = "Hello".localized()  // Uses NSLocalizedString
```

### 6. Additional Extensions
- **UIView**: Layout and appearance helpers
- **UIColor**: Color creation utilities
- **UIImage**: Image processing
- **UIViewController**: ViewController utilities
- **UITableViewCell**: TableView cell helpers
- **CALayer & CAAnimation**: Core Animation support
- **Accessibility**: A11y support utilities
- **Version Info**: App version information

## Building for Different Platforms

### iOS
```bash
swift build -c release --build-tests
```

### macOS
The demo is configured to work on macOS as well:
```bash
swift build --product SPMDemo
```

## Project Configuration

### Minimum Deployment Targets
- iOS: 16.0+
- macOS: 13.0+

### Swift Version
- Minimum: 5.9
- Recommended: 5.9+

## Usage in Your Own Project

### Step 1: Create Your Package
```swift
// Your Package.swift
let package = Package(
    name: "MyApp",
    dependencies: [
        .package(url: "https://github.com/MuthurajMuthulingam/MMExtensions.git", from: "0.2.0")
    ],
    targets: [
        .target(
            name: "MyApp",
            dependencies: ["MMExtensions"]
        )
    ]
)
```

### Step 2: Import and Use
```swift
import Foundation
import MMExtensions

let myString = "hello"
print(myString.capitalizedFirst)  // "Hello"
```

### Step 3: Build Your Project
```bash
swift build
swift run
```

## Common Issues & Solutions

### Issue: Package not found
**Solution**: Ensure the MMExtensions directory is correctly referenced:
```swift
.package(path: "../")  // For local development
```

### Issue: Build fails with undefined reference
**Solution**: Verify the dependency is listed in your target:
```swift
targets: [
    .executableTarget(
        name: "MyApp",
        dependencies: ["MMExtensions"]  // Add this
    )
]
```

### Issue: Xcode can't find module
**Solution**: 
1. Clean build: `Cmd+Shift+K`
2. Regenerate Xcode project: `swift package generate-xcodeproj`
3. Re-open the project

## Integration with CocoaPods Projects

If you're migrating from CocoaPods:

1. MMExtensions supports both SPM and CocoaPods
2. Use `pod 'MMExtensions'` for CocoaPods integration
3. Use SPM package URL for Swift Package Manager integration

## Advanced Configuration

### Custom Build Settings
```swift
let package = Package(
    name: "MyApp",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(name: "MyApp", targets: ["MyApp"])
    ],
    dependencies: [
        .package(url: "https://github.com/MuthurajMuthulingam/MMExtensions.git", from: "0.2.0")
    ],
    targets: [
        .target(
            name: "MyApp",
            dependencies: ["MMExtensions"],
            swiftSettings: [
                .unsafeFlags(["-suppress-warnings"])  // Optional
            ]
        )
    ]
)
```

### Testing
You can add tests to your SPM package:

```swift
targets: [
    // ... main target ...
    .testTarget(
        name: "MyAppTests",
        dependencies: ["MyApp"]
    )
]
```

## Resources

- [Swift Package Manager Documentation](https://swift.org/package-manager/)
- [MMExtensions Repository](https://github.com/MuthurajMuthulingam/MMExtensions)
- [Apple Swift Documentation](https://developer.apple.com/swift/)

## Requirements

- iOS 16.0+
- macOS 13.0+
- Swift 5.9+
- Xcode 15.0+

## License

MMExtensions is available under the MIT license. See the LICENSE file for more information.

## Support

For issues, questions, or contributions:
1. Visit the [GitHub Repository](https://github.com/MuthurajMuthulingam/MMExtensions)
2. Check existing issues and pull requests
3. Create a new issue with detailed information

## Next Steps

1. ✅ Run the demo: `swift run SPMDemo`
2. ✅ Explore the code in `Sources/SPMDemo/main.swift`
3. ✅ Modify `Package.swift` for your use case
4. ✅ Integrate MMExtensions into your own project
5. ✅ Reference extension methods from `MMExtensions/Classes/Extensions/`

---

Happy coding! 🚀
