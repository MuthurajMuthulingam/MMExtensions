//
//  UIColor+Extensions.swift
//  Lecet
//
//  Created by Muthuraj Muthulingam on 07/08/18.
//  Copyright © 2018 Muthuraj Muthulingam. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    
    public convenience init(red: Float, green: Float, blue: Float) {
        self.init(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
    }
}
