//
//  Accessibilty+Extensions.swift
//  Lecet
//
//  Created by Y Media Labs on 16/08/18.
//  Copyright © 2018 Y Media Labs. All rights reserved.
//

import UIKit

@MainActor extension UITextField {
    override open var accessibilityValue: String? {
        get { return super.accessibilityValue ?? self.text }
        set { super.accessibilityValue = newValue }
    }
}

@MainActor extension UILabel {
    override open var accessibilityValue: String? {
        get { return super.accessibilityValue ?? self.text }
        set { super.accessibilityValue = newValue }
    }
}

@MainActor extension UIButton {
    override open var accessibilityValue: String? {
        get { return super.accessibilityValue ?? self.title(for: .normal) }
        set { super.accessibilityValue = newValue }
    }
}

@MainActor extension UIImageView {
    override open var accessibilityValue: String? {
        get { return super.accessibilityValue ?? self.accessibilityIdentifier }
        set { super.accessibilityValue = newValue }
    }
}

@MainActor extension UITabBarItem {
    override open var accessibilityValue: String? {
        get { return super.accessibilityValue ?? self.title }
        set { super.accessibilityValue = newValue }
    }
    
    override open var accessibilityIdentifier: String? {
        get { return super.accessibilityIdentifier ?? String(describing: self.title ?? "").lowercased() + "Tab" }
        set { super.accessibilityIdentifier = newValue }
    }
}

@MainActor extension UISegmentedControl {
    override open var accessibilityValue: String? {
        get { return super.accessibilityValue ?? titleForSegment(at: selectedSegmentIndex) }
        set { super.accessibilityValue = newValue }
    }
}
