//
//  DotInputField.swift
//  CodeInputView
//
//  Created by Isa Aliev on 24.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation
import UIKit

class DotInputField: UIView, InputableField {
    struct Configuration {
        var dotSize: CGFloat = 15.0
        var fillColor = UIColor.black
        var strokeColor = UIColor.black
        var emptyColor = UIColor.clear
    }
    
    private var value: String?
    static var configuration: Configuration = Configuration()

    var dotRect: CGRect {
        let size = DotInputField.configuration.dotSize
        return CGRect(x: (bounds.width - size) * 0.5,
                      y: (bounds.height - size) * 0.5,
                      width: size, height: size)
    }
    
    var circlePath: UIBezierPath {
        return UIBezierPath(roundedRect: dotRect,
                            byRoundingCorners: UIRectCorner.allCorners,
                            cornerRadii: CGSize(width: dotRect.height / 2.0, height: dotRect.height / 2.0))
    }
    
    lazy var strokeLayer: CAShapeLayer = {
        let layer = CAShapeLayer()

        layer.fillColor = DotInputField.configuration.emptyColor.cgColor
        layer.strokeColor = DotInputField.configuration.strokeColor.cgColor
   
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        layer.addSublayer(strokeLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        strokeLayer.path = circlePath.cgPath
        strokeLayer.frame = layer.bounds
    }
    
    func deleteValue() {
        strokeLayer.fillColor = DotInputField.configuration.emptyColor.cgColor
        value = ""
    }
    
    func setValue(_ newValue: String) {
        strokeLayer.fillColor = DotInputField.configuration.fillColor.cgColor
        value = newValue
    }
    
    func getValue() -> String {
        return value ?? ""
    }
    
    func isEmpty() -> Bool {
        return value == nil
    }
}
