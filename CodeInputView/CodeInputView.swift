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

class CodeInputField: UIView, InputableField {
    private var value: String?
    
    func deleteValue() {
        value = ""
    }
    
    func setValue(_ newValue: String) {
        value = newValue
    }
    
    func getValue() -> String {
        return value ?? ""
    }
    
    func isEmpty() -> Bool {
        return value == nil
    }
}

class CodeInputView<T: InputableField&UIView>: UIView {
    var fields = [T]()
    var numberOfFields = 4
    
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
        
        for _ in 0..<numberOfFields {
            fields.append(T(frame: .zero))
        }
    }
    
    private func layoutFields() {
        
    }
    
    var hasText: Bool {
        return false
    }
    
    func insertText(_ text: String) {
        
    }
    
    func deleteBackward() {
        
    }
}

