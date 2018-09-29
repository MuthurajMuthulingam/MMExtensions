//
//  Accessibilty+Extensions.swift
//  Lecet
//
//  Created by Y Media Labs on 16/08/18.
//  Copyright © 2018 Y Media Labs. All rights reserved.
//

import UIKit

extension UITextField {
    override open var accessibilityValue: String? {
        get { return super.accessibilityValue ?? self.text }
        set { super.accessibilityValue = newValue }
    }
}

extension UILabel {
    override open var accessibilityValue: String? {
        get { return super.accessibilityValue ?? self.text }
        set { super.accessibilityValue = newValue }
    }
}

extension UIButton {
    override open var accessibilityValue: String? {
        get { return super.accessibilityValue ?? self.title(for: .normal) }
        set { super.accessibilityValue = newValue }
    }
}

extension UIImageView {
    override open var accessibilityValue: String? {
        get { return super.accessibilityValue ?? self.accessibilityIdentifier }
        set { super.accessibilityValue = newValue }
    }
}

extension UITabBarItem {
    override open var accessibilityValue: String? {
        get { return super.accessibilityValue ?? self.title }
        set { super.accessibilityValue = newValue }
    }
    
    override open var accessibilityIdentifier: String? {
        get { return super.accessibilityIdentifier ?? String(describing: self.title ?? "").lowercased() + "Tab" }
        set { super.accessibilityIdentifier = newValue }
    }
}

extension UISegmentedControl {
    override open var accessibilityValue: String? {
        get { return super.accessibilityValue ?? titleForSegment(at: selectedSegmentIndex) }
        set { super.accessibilityValue = newValue }
    }
}
