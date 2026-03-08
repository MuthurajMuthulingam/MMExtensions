import Foundation

// MARK: - MMExtensions Version Information

/// Current version of the MMExtensions library
public let MMExtensionsVersion = "0.2.0"

/// Build information for the library
public struct MMExtensionsInfo {
    /// The semantic version of MMExtensions
    public static let version = "0.2.0"
    
    /// Returns a formatted version string
    public static var versionString: String {
        return "MMExtensions/\(version)"
    }
}
