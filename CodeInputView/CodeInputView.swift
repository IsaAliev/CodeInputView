//
//  CodeInputView.swift
//  CodeInputView
//
//  Created by Isa Aliev on 15.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation
import UIKit

protocol InputableField {
    func deleteValue()
    func setValue(_ newValue: String)
    func getValue() -> String
    func isEmpty() -> Bool
}

class CodeInputView<T: InputableField&UIView>: UIView, UIKeyInput {
    private var fields = [T]()
    private var currentIndex = 0
    var numberOfFields = 4 {
        didSet {
            configure()
            layoutSubviews()
        }
    }
    
    var code = ""
    var horizontalMargins: CGFloat = 8.0 {
        didSet {
            layoutSubviews()
        }
    }
    
    var interFieldSpacing: CGFloat = 8.0 {
        didSet {
            layoutSubviews()
        }
    }
    
    var keyboardType: UIKeyboardType = .numberPad
    
    private var sizeOfField: CGFloat {
        let frameWidth = frame.width
        let minBySides = min(frameWidth - horizontalMargins * 2, frame.height * 0.8)
        let fieldsCount = fields.count
        
        return min(minBySides, (frameWidth - interFieldSpacing * CGFloat(fieldsCount - 1) - horizontalMargins * 2.0)/CGFloat(fieldsCount))
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    var hasText: Bool {
        return fields.filter({ !$0.isEmpty() }).count > 0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutFields()
    }
    
    private func configure() {
        guard fields.count != numberOfFields else { return }
        
        if numberOfFields > fields.count {
            (0..<(numberOfFields - fields.count)).forEach({ _ in
                insertNewField()
            })
        } else {
            fields[numberOfFields..<fields.count].forEach({ $0.removeFromSuperview() })
            fields.removeSubrange(numberOfFields..<fields.count)
        }
    }
    
    private func insertNewField() {
        let field = T(frame: fields.last?.frame ?? .zero)
        addSubview(field)
        fields.append(field)
    }
    
    private func layoutFields() {
        let numberOfFields = fields.count
        let widthOfFields = CGFloat(numberOfFields) / 2.0 * sizeOfField
        let widthOfInterFieldSpacing = (CGFloat(numberOfFields) / 2.0 - 0.5) * interFieldSpacing
        var x = bounds.midX - (widthOfFields + widthOfInterFieldSpacing)
        let y = (bounds.height - sizeOfField) * 0.5

        fields.forEach({
            let frame = CGRect(x: x, y: y, width: sizeOfField, height: sizeOfField)
            $0.frame = frame
            x += sizeOfField + interFieldSpacing
        })
    }
    
    func insertText(_ text: String) {
        guard currentIndex < fields.count else {
            return
        }
        
        fields[currentIndex].setValue(text)
        currentIndex += 1
        updateCode()
    }
    
    func deleteBackward() {
        guard currentIndex > 0 else {
            return
        }
        
        currentIndex -= 1
        fields[currentIndex].deleteValue()
        updateCode()
    }
    
    private func updateCode() {
        code = fields.reduce("", { $0 + $1.getValue() })
    }
}

