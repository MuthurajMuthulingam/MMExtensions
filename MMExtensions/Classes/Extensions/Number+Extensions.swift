//
//  Number+Extensions.swift
//  Lecet
//
//  Created by Y Media Labs on 26/09/18.
//  Copyright © 2018 Y Media Labs. All rights reserved.
//

import Foundation

extension NumberFormatter {
    convenience init(with seperator: String) {
        self.init()
        self.groupingSeparator = seperator
        self.numberStyle = .decimal
    }
}

extension Int {
    func format(using seperator: String) -> String {
        return NumberFormatter(with: seperator).string(from: NSNumber(integerLiteral: self)) ?? ""
    }
}
