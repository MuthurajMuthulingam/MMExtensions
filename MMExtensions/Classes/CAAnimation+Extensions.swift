//
//  CAAnimation+Extensions.swift
//  MMExtensions
//
//  Created by Muthuraj Muthulingam.
//

import Foundation

public extension CABasicAnimation {
    public convenience init(keyPath: String,
                            toValue: Any?,
                            fromValue: Any?,
                            duration: Double,
                            beginTime: Double = CACurrentMediaTime(),
                            timingFunction: CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn),
                            filMode: String = kCAFillModeForwards,
                            removeOnCompletion: Bool = false) {
        self.init(keyPath: keyPath)
        self.toValue = toValue
        self.beginTime = beginTime
        self.duration = duration
        self.timingFunction = timingFunction
        self.fillMode = filMode
        self.isRemovedOnCompletion = removeOnCompletion
    }
}
