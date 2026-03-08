# MMExtensions SPM Quick Reference

A quick lookup guide for MMExtensions available in Swift Package Manager.

## 📦 Package Setup (30 seconds)

### Add to Package.swift
```swift
dependencies: [
    .package(url: "https://github.com/MuthurajMuthulingam/MMExtensions.git", from: "0.2.0")
],
targets: [
    .target(name: "MyApp", dependencies: ["MMExtensions"])
]
```

### Import in Code
```swift
import MMExtensions
```

## 🔤 String Extensions

| Method | Usage | Example |
|--------|-------|---------|
| `capitalizedFirst` | Capitalize only first character | `"hello".capitalizedFirst` → `"Hello"` |
| `heightForBounding(size, font)` | Calculate text height | `text.heightForBounding(CGSize(...), font)` |
| `widthFor(size, font)` | Calculate text width | `text.widthFor(CGSize(...), font)` |
| `localized()` | Get localized string | `"Welcome".localized()` |
| `containsWhiteSpaceAndNewLines()` | Check for whitespace | `text.containsWhiteSpaceAndNewLines()` |
| `trimWhiteSpaceAndNewLines()` | Remove whitespace | `text.trimWhiteSpaceAndNewLines()` |
| `subscript(Int)` | Access character by index | `text[0]` → first character |

### Example
```swift
let name = "john doe"
print(name.capitalizedFirst)  // "John doe"
```

## 🔢 Number Extensions

- Extensions for `NSNumber`, `Int`, `Double`, `Float`
- Type conversion utilities
- Numeric validation helpers

```swift
let number: NSNumber = 42
// Use available number extension methods
```

## 📅 Date Extensions

- Date manipulation utilities
- Calendar operations
- Date formatting helpers
- Time interval calculations

```swift
let today = Date()
// Use date extension methods for calculations
```

## 🎨 UIColor Extensions

- Create colors with various parameters
- Color utilities and conversions
- Predefined color sets

```swift
import UIKit
import MMExtensions

let color = UIColor(red: 0.2, green: 0.4, blue: 0.6, alpha: 1.0)
view.backgroundColor = color
```

## 🖼️ UIImage Extensions

- Image processing utilities
- Size calculations
- Image transformations
- Caching helpers

```swift
if let image = UIImage(named: "photo") {
    // Use image extension methods
}
```

## 👁️ UIImageView Extensions

- Image loading utilities
- Animation helpers
- Content mode utilities
- Placeholder support

```swift
let imageView = UIImageView()
// Use imageView extension methods
```

## 🎨 UIView Extensions

- Layout helpers
- Corner radius and shadows
- Border utilities
- Animation support
- Size calculations

```swift
let view = UIView()
view.layer.cornerRadius = 10
view.layer.shadowColor = UIColor.black.cgColor
view.layer.shadowOpacity = 0.5
```

## 🎯 UIViewController Extensions

- Navigation helpers
- Alert presentation utilities
- View lifecycle utilities
- Keyboard handling

```swift
class MyViewController: UIViewController {
    // Use ViewController extension methods
}
```

## 📋 UITableViewCell Extensions

- Cell configuration helpers
- Reuse identifier utilities
- Selection handling
- Animation support

```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    // Use cell extension methods
    return cell
}
```

## 📝 UITextField Extensions

- Input validation helpers
- Text formatting utilities
- Accessibility support
- Character limiting

```swift
let textField = UITextField()
// Use TextField accessibility extensions
```

## 🎬 CALayer Extensions

- Animation utilities
- Border and shadow helpers
- Rasterization support
- Transform utilities

```swift
let layer = CALayer()
layer.cornerRadius = 5
layer.borderColor = UIColor.gray.cgColor
layer.borderWidth = 1
```

## ✨ CAAnimation Extensions

- Animation creation helpers
- Duration utilities
- Timing function presets
- Group animation support

```swift
// Create and apply animations using extensions
```

## ♿ Accessibility Extensions

- VoiceOver support
- Accessibility labels
- Hints and values
- Element identification

```swift
view.isAccessibilityElement = true
view.accessibilityLabel = "Main content"
view.accessibilityHint = "Double tap to select"
```

## ℹ️ Version Info

- App version retrieval
- Build number access
- Version comparison
- Update checking

```swift
// Access app version information
```

---

## 🚀 Quick Start Commands

```bash
# Create new SPM package
swift package init --type executable

# Build project
swift build

# Run executable
swift run

# Run tests
swift test

# Generate Xcode project
swift package generate-xcodeproj
open Package.xcodeproj
```

## ⚙️ Platform Requirements

| Platform | Minimum Version |
|----------|-----------------|
| iOS | 16.0+ |
| macOS | 13.0+ |
| Swift | 5.9+ |
| Xcode | 15.0+ |

## 🔗 Integration Options

### Local Development
```swift
.package(path: "../MMExtensions")
```

### GitHub Repository
```swift
.package(url: "https://github.com/MuthurajMuthulingam/MMExtensions.git", from: "0.2.0")
```

### Specific Version
```swift
.package(url: "https://...", exact: "0.2.0")
```

### Version Range
```swift
.package(url: "https://...", "0.2.0"..<"1.0.0")
```

## 🐛 Common Issues

| Issue | Solution |
|-------|----------|
| Module not found | Add to target dependencies |
| Package not found | Check path or URL is correct |
| Build fails | Ensure iOS platform is set |
| Xcode can't find module | Clean and regenerate project |
| Git access denied | Use SSH or check credentials |

## 📚 Documentation Files

- **README.md** - Overview and installation
- **INTEGRATION_GUIDE.md** - Detailed setup instructions
- **iOS_EXAMPLE.md** - iOS app examples
- **QUICK_REFERENCE.md** - This file

## 🔗 Resources

- [Swift Package Manager Docs](https://swift.org/package-manager/)
- [MMExtensions GitHub](https://github.com/MuthurajMuthulingam/MMExtensions)
- [Apple UIKit Docs](https://developer.apple.com/documentation/uikit)

## 💡 Pro Tips

✅ **Do's**
- Pin versions in production
- Test with multiple Swift versions
- Document custom extensions
- Update dependencies regularly
- Use semantic versioning

❌ **Don'ts**
- Use branch references in production
- Ignore security updates
- Mix old Swift versions
- Commit unnecessary lock files
- Forget to import MMExtensions

---

**Last Updated:** March 2026  
**Swift Version:** 5.9+  
**For Latest Info:** Check [MMExtensions Repository](https://github.com/MuthurajMuthulingam/MMExtensions)
