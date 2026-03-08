# MMExtensions

[![CI Status](https://img.shields.io/travis/Muthuraj Muthulingam/MMExtensions.svg?style=flat)](https://travis-ci.org/Muthuraj Muthulingam/MMExtensions)
[![Version](https://img.shields.io/cocoapods/v/MMExtensions.svg?style=flat)](https://cocoapods.org/pods/MMExtensions)
[![License](https://img.shields.io/cocoapods/l/MMExtensions.svg?style=flat)](https://cocoapods.org/pods/MMExtensions)
[![Platform](https://img.shields.io/cocoapods/p/MMExtensions.svg?style=flat)](https://cocoapods.org/pods/MMExtensions)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 16.0+
- Swift 5.9+
- Xcode 15.0+

## Installation

### CocoaPods

MMExtensions is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MMExtensions'
```

### Swift Package Manager

MMExtensions is also available through [Swift Package Manager](https://swift.org/package-manager/). To add it to your project:

1. In Xcode, go to **File** > **Add Packages**
2. Enter the repository URL: `https://github.com/MuthurajMuthulingam/MMExtensions.git`
3. Select the version you want to use
4. Choose the target where you want to add the package
5. Click **Add Package**

Or add it to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/MuthurajMuthulingam/MMExtensions.git", from: "0.2.0")
]
```

Then add it to your target dependencies:

```swift
targets: [
    .target(
        name: "YourTarget",
        dependencies: ["MMExtensions"]
    )
]
```

## Version

The current version of MMExtensions is **0.2.0**.

### Accessing Version Information in Code

You can access the library version programmatically:

```swift
import MMExtensions

// Get the version string
let version = MMExtensionsVersion  // "0.2.0"

// Or use the info struct
let versionString = MMExtensionsInfo.versionString  // "MMExtensions/0.2.0"
let version = MMExtensionsInfo.version  // "0.2.0"
```

## Author

Muthuraj Muthulingam, muthurajmuthulingam@gmail.com

## License

MMExtensions is available under the MIT license. See the LICENSE file for more info.
