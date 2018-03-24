//
//  CodeInputField.swift
//  CodeInputView
//
//  Created by Isa Aliev on 24.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation
import UIKit

class CodeInputField: UILabel, InputableField {
    private var value: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func deleteValue() {
        value = ""
        text = nil
    }
    
    func setValue(_ newValue: String) {
        value = newValue
        text = newValue
    }
    
    func getValue() -> String {
        return value ?? ""
    }
    
    func isEmpty() -> Bool {
        return value == nil
    }
}
