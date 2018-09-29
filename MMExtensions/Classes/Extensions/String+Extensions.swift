//
//  String+Extensions.swift
//  Lecet
//
//  Created by Y Media Labs on 07/08/18.
//  Copyright © 2018 Y Media Labs. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var capitalizedFirst: String {
        guard count >= 1 else { return self }
        return prefix(1).uppercased() + dropFirst().lowercased()
    }
    
    func heightForBounding(_ size: CGSize, font: UIFont) -> CGFloat {
        let rect = (self as NSString).boundingRect(with: size, options: [ NSStringDrawingOptions.usesLineFragmentOrigin ], attributes: [NSAttributedStringKey.font: font], context: nil)
        return rect.size.height
    }
    
    func widthFor(_ size: CGSize, font: UIFont) -> CGFloat {
        let rect = (self as NSString).boundingRect(with: size, options: [ NSStringDrawingOptions.usesLineFragmentOrigin ], attributes: [NSAttributedStringKey.font: font], context: nil)
        return rect.size.width
    }
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func containsWhiteSpaceAndNewLines() -> Bool {
        guard rangeOfCharacter(from: .whitespacesAndNewlines) != nil else {
            return false
        }
        
        return true
    }
    
    func trimWhiteSpaceAndNewLines() -> String {
        var trimmedString = replacingOccurrences(of: " ", with: "")
        trimmedString = trimmedString.replacingOccurrences(of: "\n", with: "")
        
        return trimmedString
    }
    
    subscript (offset: Int) -> Character {
        return self[index(startIndex, offsetBy: offset)]
    }
    
    subscript (index: Int) -> String {
        return String(self[index] as Character)
    }
    
    subscript (range: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        return String(self[Range(start ..< end)])
    }
}
