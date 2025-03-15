//
//  CALayer+Extensions.swift
//  MMGraphSample
//
//  Created by Muthuraj Muthulingam.
//  Copyright © 2018 Muthuraj Muthulingam. All rights reserved.
//

import UIKit

// MARK: - Custom Initializer to CAShape Layer
public extension CAShapeLayer {
    convenience init(with path: CGPath, color: UIColor, fillColor: UIColor, lineWidth: CGFloat) {
        self.init()
        self.path = path
        self.strokeColor = color.cgColor
        self.lineWidth = lineWidth
        self.lineJoin = CAShapeLayerLineJoin.round
        self.lineCap = CAShapeLayerLineCap.round
        self.fillColor = fillColor.cgColor
    }
    
    func applyShadow(color: UIColor, offSet: CGSize, opacity: Float, radius: CGFloat) {
        self.shadowColor = color.cgColor
        self.shadowOffset = offSet
        self.shadowOpacity = opacity
        self.shadowRadius = radius
    }
}

public extension CATextLayer {
    convenience init(with bounds: CGRect, text: String?) {
        self.init()
        self.bounds = bounds
        self.string = text
    }
}

extension CGPoint: @retroactive Comparable {
    public static func <(lhs: CGPoint, rhs: CGPoint) -> Bool {
        return lhs.x < rhs.x && lhs.y < rhs.y
    }
}

public extension Array where Element == CGPoint {
    private enum Axis {
        case x
        case y
    }
    
    private func minValue(axis: Axis) -> (minValue: CGFloat, point: CGPoint) {
        var minValue: CGFloat = .greatestFiniteMagnitude
        var minPoint: CGPoint = .zero
        for point in self {
            let value:CGFloat = (axis == .x) ? point.x : point.y
            if value < minValue {
                minValue = value
                minPoint = point
            }
        }
        return (minValue,minPoint)
    }
    
    private func maxValue(axis: Axis) -> (minValue: CGFloat, point: CGPoint) {
        var minValue: CGFloat = .leastNormalMagnitude
        var minPoint: CGPoint = .zero
        for point in self {
            let value:CGFloat = (axis == .x) ? point.x : point.y
            if value > minValue {
                minValue = value
                minPoint = point
            }
        }
        return (minValue,minPoint)
    }
    
    func minYValue() -> (minValue: CGFloat, point: CGPoint) {
        return minValue(axis: .y)
    }
    
    func maxYValue() -> (minValue: CGFloat, point: CGPoint) {
        return maxValue(axis: .y)
    }
    
    func minXValue() -> (minValue: CGFloat, point: CGPoint) {
        return minValue(axis: .x)
    }
    
    func maxXValue() -> (minValue: CGFloat, point: CGPoint) {
        return maxValue(axis: .x)
    }
}

