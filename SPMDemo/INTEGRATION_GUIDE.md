# SPM Integration Guide

A comprehensive guide for integrating MMExtensions into your Swift Package Manager projects.

## Table of Contents
1. [Getting Started](#getting-started)
2. [Local Development Setup](#local-development-setup)
3. [Remote Package Integration](#remote-package-integration)
4. [Xcode Integration](#xcode-integration)
5. [CLI Usage](#cli-usage)
6. [Troubleshooting](#troubleshooting)

---

## Getting Started

### What is Swift Package Manager?

Swift Package Manager (SPM) is Apple's official dependency manager for Swift. It simplifies managing libraries and frameworks in your Swift projects.

### Benefits of Using SPM

✅ **No third-party tools required** - Built into Swift and Xcode  
✅ **Native Xcode integration** - Seamless package management  
✅ **Reproducible builds** - Lock files ensure consistent builds  
✅ **Community-driven** - Growing ecosystem of Swift packages  

---

## Local Development Setup

Use this approach when developing MMExtensions locally alongside your project.

### Step 1: Project Structure

```
YourWorkspace/
├── MMExtensions/        # MMExtensions package
│   ├── Package.swift
│   ├── MMExtensions/
│   └── ...
└── YourApp/             # Your Swift Package
    ├── Package.swift
    ├── Sources/
    └── Tests/
```

### Step 2: Configure Package.swift

```swift
import PackageDescription

let package = Package(
    name: "YourApp",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    dependencies: [
        // Reference MMExtensions from local path
        .package(path: "../MMExtensions")
    ],
    targets: [
        .target(
            name: "YourApp",
            dependencies: ["MMExtensions"],
            path: "Sources"
        )
    ]
)
```

### Step 3: Build and Test

```bash
cd YourApp
swift build
swift test
```

### Step 4: Use in Your Code

```swift
import Foundation
import MMExtensions

// Use extensions
let text = "hello".capitalizedFirst  // "Hello"
```

---

## Remote Package Integration

Use this approach when using MMExtensions from GitHub.

### Step 1: Update Package.swift

```swift
import PackageDescription

let package = Package(
    name: "YourApp",
    platforms: [
        .iOS(.v16)
    ],
    dependencies: [
        // Use specific version (recommended for production)
        .package(
            url: "https://github.com/MuthurajMuthulingam/MMExtensions.git",
            from: "0.2.0"
        )
        // Or use branch for development
        // .package(
        //     url: "https://github.com/MuthurajMuthulingam/MMExtensions.git",
        //     branch: "main"
        // )
    ],
    targets: [
        .target(
            name: "YourApp",
            dependencies: ["MMExtensions"]
        )
    ]
)
```

### Step 2: Dependency Specification Options

```swift
// Exact version
.package(url: "...", exact: "0.2.0")

// Version range (from 0.2.0 up to 1.0.0)
.package(url: "...", from: "0.2.0")

// Version range (0.2.0 to <0.3.0)
.package(url: "...", "0.2.0"..<"0.3.0")

// Closed range (0.2.0 to 0.5.0)
.package(url: "...", "0.2.0"..."0.5.0")

// Branch tracking
.package(url: "...", branch: "main")

// Commit-based
.package(url: "...", revision: "abc123def456...")
```

### Step 3: Add to Target

```swift
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "MMExtensions", package: "MMExtensions")
        ]
    )
]
```

### Step 4: Build

```bash
swift build
```

---

## Xcode Integration

### Using Xcode 15+

**Method 1: Via File Menu**

1. Open your Xcode project
2. Navigate to `File → Add Packages`
3. Enter: `https://github.com/MuthurajMuthulingam/MMExtensions.git`
4. Select version and confirm
5. Select target and click "Add Package"

**Method 2: Via Package Dependencies**

1. Select your project in Project Navigator
2. Select your target
3. Go to `Build Phases → Link Binary With Libraries`
4. Click `+` and select MMExtensions

### Generating Xcode Project

From SPM package directory:

```bash
swift package generate-xcodeproj
open YourApp.xcodeproj
```

### Modern Xcode Support (Recommended)

For Xcode 15+, skip the project generation:

```bash
open -a Xcode .
```

---

## CLI Usage

### Building

```bash
# Build for all targets
swift build

# Build for release
swift build -c release

# Build with verbose output
swift build -v

# Build specific target
swift build --product YourApp
```

### Running

```bash
# Run the default executable
swift run

# Run specific executable
swift run YourApp

# Run with arguments
swift run YourApp --option value
```

### Testing

```bash
# Run all tests
swift test

# Run with verbose output
swift test -v

# Run specific test
swift test --filter TestName
```

### Package Information

```bash
# Show package description
swift package describe

# Show dependency graph
swift package dump-package

# Show available products
swift package describe --type json | jq '.products'
```

### Updating Dependencies

```bash
# Update to latest compatible versions
swift package update

# Update specific package
swift package update MMExtensions

# Reset to locked versions
swift package reset
```

---

## Troubleshooting

### Issue 1: "Package not found"

**Error:**
```
error: package at '/path/to/package' is not a valid package manifest
```

**Solution:**
- Verify the path is correct
- Ensure Package.swift exists in the directory
- Check permissions on the directory

```swift
.package(path: "../MMExtensions")  // Verify this path exists
```

### Issue 2: "Module not found" in Xcode

**Error:**
```
Cannot find 'MMExtensions' in scope
```

**Solutions:**

1. **Clean build:**
   ```bash
   swift package clean
   swift build
   ```

2. **Regenerate Xcode project:**
   ```bash
   rm -rf YourApp.xcodeproj
   swift package generate-xcodeproj
   ```

3. **Check Package.swift:**
   ```swift
   targets: [
       .target(
           name: "YourApp",
           dependencies: ["MMExtensions"]  // Ensure this exists
       )
   ]
   ```

### Issue 3: "Version mismatch"

**Error:**
```
The products for 'MMExtensions' are not available
```

**Solution:**
```swift
// Check your platforms match MMExtensions requirements
platforms: [
    .iOS(.v16),  // MMExtensions requires iOS 16+
    .macOS(.v13)
]
```

### Issue 4: "Git cannot access repository"

**Error:**
```
fatal: unable to access 'https://github.com/...'
```

**Solutions:**

1. **Check internet connection:**
   ```bash
   ping github.com
   ```

2. **Use SSH instead of HTTPS:**
   ```swift
   .package(url: "git@github.com:MuthurajMuthulingam/MMExtensions.git", from: "0.2.0")
   ```

3. **Try cache clearing:**
   ```bash
   rm -rf ~/.cache/org.swift.swiftpm
   swift build
   ```

### Issue 5: "Building on unsupported platform"

**Error:**
```
error: package 'MMExtensions' product 'MMExtensions' requires minimum platform 'ios' version '16'
```

**Solution:**
Update your package to support the required platform:

```swift
Package(
    name: "YourApp",
    platforms: [
        .iOS(.v16),  // Minimum iOS 16
        .macOS(.v13)
    ]
)
```

### Issue 6: "Incompatible Swift version"

**Error:**
```
error: package 'MMExtensions' requires minimum Swift version '5.9'
```

**Solution:**
Update your Swift version or Package.swift header:

```swift
// swift-tools-version:5.9  // Must match or exceed requirement
import PackageDescription
```

---

## Performance Tips

### 1. Use Release Builds for Testing
```bash
swift build -c release
swift test -c release
```

### 2. Parallel Builds
```bash
swift build -j 4  # Use 4 cores
```

### 3. Cache Management
```bash
# Clear package cache
swift package clean

# Clear all caches
rm -rf ~/Library/Caches/org.swift.swiftpm
```

### 4. Dependency Optimization
- Pin to specific versions in production
- Use `from:` for flexibility during development
- Regularly update to benefit from patches

---

## Best Practices

### ✅ Do's

✓ Pin versions for released projects  
✓ Test with multiple Swift versions  
✓ Use semantic versioning  
✓ Document dependencies clearly  
✓ Update dependencies regularly  

### ❌ Don'ts

✗ Use branch references in production  
✗ Mix local and remote paths unnecessarily  
✗ Commit lock files from local paths  
✗ Ignore security updates  
✗ Use old Swift versions without reason  

---

## Example Configurations

### Minimal Configuration
```swift
// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "MyApp",
    dependencies: [
        .package(url: "https://github.com/MuthurajMuthulingam/MMExtensions.git", from: "0.2.0")
    ],
    targets: [
        .target(name: "MyApp", dependencies: ["MMExtensions"])
    ]
)
```

### Production Configuration
```swift
// swift-tools-version:5.9
import PackageDescription

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
        .package(
            url: "https://github.com/MuthurajMuthulingam/MMExtensions.git",
            exact: "0.2.0"
        )
    ],
    targets: [
        .target(
            name: "MyApp",
            dependencies: ["MMExtensions"],
            path: "Sources"
        ),
        .testTarget(
            name: "MyAppTests",
            dependencies: ["MyApp"],
            path: "Tests"
        )
    ]
)
```

---

## Additional Resources

- [Swift Package Manager Documentation](https://swift.org/package-manager/)
- [MMExtensions GitHub](https://github.com/MuthurajMuthulingam/MMExtensions)
- [Swift Evolution Proposals](https://github.com/apple/swift-evolution)
- [Xcode Documentation](https://developer.apple.com/xcode/)

---

**Last Updated:** March 2026  
**Swift Version:** 5.9+  
**Platforms:** iOS 16.0+, macOS 13.0+
