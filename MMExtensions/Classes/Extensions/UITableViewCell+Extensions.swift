//
//  UITableViewCell+Extensions.swift
//  MMExtensions
//
//  Created by nicolasCombe on 10/24/19.
//

import UIKit

public extension UITableViewCell {
    func toggleCheck() {
        if self.accessoryType == .checkmark {
            self.accessoryType = .none
        } else {
            self.accessoryType = .checkmark
        }
    }
}
