//
//  UIImageView+Extensions.swift
//  MMExtensions
//
//  Created by nicolasCombe on 10/24/19.
//

import UIKit

public extension UIImageView {
    func setRounded() {
        self.contentMode = .scaleAspectFill
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.height / 2
    }
}
