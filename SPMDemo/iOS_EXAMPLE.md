# iOS Example Application

This guide shows how to use MMExtensions in a real iOS application using Swift Package Manager.

## Quick iOS App Setup

### Step 1: Create Your iOS App Package

```swift
// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "MyIOSApp",
    platforms: [
        .iOS(.v16)
    ],
    dependencies: [
        .package(
            url: "https://github.com/MuthurajMuthulingam/MMExtensions.git",
            from: "0.2.0"
        )
    ],
    targets: [
        .target(
            name: "MyIOSApp",
            dependencies: [
                .product(name: "MMExtensions", package: "MMExtensions")
            ]
        )
    ]
)
```

### Step 2: Using Extensions in Your App

#### ViewController with Extensions

```swift
import UIKit
import MMExtensions

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        demonstrateStringExtensions()
        demonstrateUIExtensions()
    }
    
    // MARK: - String Extensions Example
    func demonstrateStringExtensions() {
        let greeting = "hello world"
        
        // Use capitalizedFirst extension
        textLabel.text = greeting.capitalizedFirst  // "Hello world"
        
        // Check for whitespace
        let hasWhitespace = greeting.containsWhiteSpaceAndNewLines()  // true
        
        // Trim whitespace
        let trimmed = greeting.trimWhiteSpaceAndNewLines()  // "helloworld"
        
        // Access character by index
        let firstChar = greeting[0]  // "h"
        
        // Calculate text dimensions
        let font = UIFont.systemFont(ofSize: 16)
        let size = CGSize(width: 200, height: .greatestFiniteMagnitude)
        let textHeight = greeting.heightForBounding(size, font: font)
        let textWidth = greeting.widthFor(size, font: font)
        
        // Get localized text
        let localizedText = "Welcome".localized()
    }
    
    // MARK: - UIView Extensions Example
    func demonstrateUIExtensions() {
        // UIView corner radius
        let roundedView = UIView()
        roundedView.layer.cornerRadius = 10
        
        // UIColor extensions
        let customColor = UIColor(red: 0.2, green: 0.4, blue: 0.6, alpha: 1.0)
        view.backgroundColor = customColor
        
        // UIImage extensions can be used for image processing
        if let image = UIImage(named: "myImage") {
            // Apply extensions to process the image
            let processedImage = image
            // Use other UIImage extensions as needed
        }
    }
    
    func setupUI() {
        // Setup your UI here
    }
}
```

#### TableViewController with Cell Extensions

```swift
import UIKit
import MMExtensions

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Use UITableViewCell extensions
        cell.textLabel?.text = "Item \(indexPath.row)"
        
        // Apply string extensions to cell content
        let itemText = "item \(indexPath.row)"
        cell.detailTextLabel?.text = itemText.capitalizedFirst
        
        return cell
    }
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}
```

## String Extension Usage Examples

### Text Capitalization

```swift
import MMExtensions

let text = "hello world"
print(text.capitalizedFirst)  // Output: "Hello world"
// Note: Built-in capitalizedFirst capitalizes all words
// MMExtensions version capitalizes only the first character
```

### Whitespace Handling

```swift
let textWithSpaces = "hello  world  \n"

// Check for whitespace
if textWithSpaces.containsWhiteSpaceAndNewLines() {
    print("Text contains whitespace or newlines")
}

// Remove whitespace
let cleaned = textWithSpaces.trimWhiteSpaceAndNewLines()  // "helloworld"
```

### Text Dimension Calculation

```swift
import UIKit
import MMExtensions

let text = "Hello World"
let font = UIFont.systemFont(ofSize: 16)

// Calculate height for width constraint
let maxWidth: CGFloat = 200
let size = CGSize(width: maxWidth, height: .greatestFiniteMagnitude)
let height = text.heightForBounding(size, font: font)

// Calculate width for height constraint
let maxHeight: CGFloat = 100
let sizeForWidth = CGSize(width: .greatestFiniteMagnitude, height: maxHeight)
let width = text.widthFor(sizeForWidth, font: font)

print("Text would be \(width) wide and \(height) tall")
```

### Localization

```swift
import MMExtensions

// Get localized string
let welcomeText = "Welcome".localized()
let goodbyeText = "Goodbye".localized()

// Ensure your Localizable.strings files contain these keys
// "Welcome" = "Welcome";  // English
// "Welcome" = "Bienvenido";  // Spanish
```

### Character Access

```swift
import MMExtensions

let text = "Swift"
print(text[0])  // "S"
print(text[1])  // "w"
print(text[4])  // "t"
```

## UIColor Extensions

```swift
import UIKit
import MMExtensions

// Create colors using extensions
let primaryColor = UIColor(red: 0.2, green: 0.4, blue: 0.6, alpha: 1.0)
let accentColor = UIColor(red: 0.8, green: 0.2, blue: 0.2, alpha: 1.0)

// Use in your views
view.backgroundColor = primaryColor
button.tintColor = accentColor
```

## UIImage Extensions

```swift
import UIKit
import MMExtensions

if let image = UIImage(named: "photo") {
    // Apply image processing extensions
    // Various extensions available for image manipulation
    imageView.image = image
}
```

## UIViewController Extensions

```swift
import UIKit
import MMExtensions

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Use ViewController extensions for common operations
    }
    
    func presentAlert() {
        // ViewController extensions provide utility methods
        // Check the MMExtensions source for available methods
    }
}
```

## Number Extensions

```swift
import MMExtensions

let intValue = 42
let doubleValue = 3.14159
let numberValue: NSNumber = 100

// Number type extensions available
// Check MMExtensions documentation for specific methods
```

## Date Extensions

```swift
import Foundation
import MMExtensions

let today = Date()

// Date manipulation extensions available
// Examples:
// - Date formatting
// - Calendar operations
// - Time calculations

// Use Calendar with Date extensions
let calendar = Calendar.current
let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)
```

## CALayer and CAAnimation Extensions

```swift
import UIKit
import MMExtensions

let view = UIView()

// CALayer extensions
view.layer.cornerRadius = 10
view.layer.shadowColor = UIColor.black.cgColor
view.layer.shadowOpacity = 0.5

// CAAnimation extensions available
// Create and apply animations using provided utilities
```

## Accessibility Extensions

```swift
import UIKit
import MMExtensions

class AccessibleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAccessibility()
    }
    
    func setupAccessibility() {
        // Use accessibility extensions for VoiceOver support
        view.isAccessibilityElement = true
        view.accessibilityLabel = "Main content area"
        view.accessibilityHint = "Contains important information"
    }
}
```

## Complete Example App Structure

```
MyIOSApp/
├── Package.swift
├── Sources/
│   └── MyIOSApp/
│       ├── AppDelegate.swift
│       ├── SceneDelegate.swift
│       ├── ViewController.swift
│       ├── TableViewController.swift
│       └── Models/
│           └── DataModel.swift
└── Resources/
    ├── Localizable.strings
    └── Assets/
```

## Testing with MMExtensions

```swift
import XCTest
import MMExtensions

class StringExtensionTests: XCTestCase {
    
    func testCapitalizedFirst() {
        let text = "hello world"
        XCTAssertEqual(text.capitalizedFirst, "Hello world")
    }
    
    func testTrimWhitespace() {
        let text = "hello  world  \n"
        XCTAssertEqual(text.trimWhiteSpaceAndNewLines(), "helloworld")
    }
    
    func testContainsWhitespace() {
        let text = "hello world"
        XCTAssertTrue(text.containsWhiteSpaceAndNewLines())
        
        let noSpace = "helloworld"
        XCTAssertFalse(noSpace.containsWhiteSpaceAndNewLines())
    }
    
    func testCharacterSubscript() {
        let text = "Swift"
        XCTAssertEqual(text[0], "S")
        XCTAssertEqual(text[4], "t")
    }
}
```

## Performance Considerations

- String height/width calculations can be expensive for large texts
- Cache calculated dimensions when possible
- Use appropriate constraints instead of calculating layouts manually
- Batch whitespace trimming operations for large datasets

## Compatibility

- **iOS**: 16.0+
- **macOS**: 13.0+ (for macOS app)
- **Swift**: 5.9+
- **Xcode**: 15.0+

## Next Steps

1. ✅ Create your iOS app with Package.swift
2. ✅ Add MMExtensions dependency
3. ✅ Import MMExtensions in your files
4. ✅ Use extensions in your view controllers
5. ✅ Test with your iOS simulator

## Resources

- [Apple UIKit Documentation](https://developer.apple.com/documentation/uikit)
- [Swift String Documentation](https://developer.apple.com/documentation/swift/string)
- [Core Graphics Guide](https://developer.apple.com/library/archive/documentation/GraphicsImaging/Conceptual/CoreGraphics_Overview/)

---

For more examples, check out the Example project in the MMExtensions repository!
