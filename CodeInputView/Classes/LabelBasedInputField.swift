//
//  LabelBasedInputField.swift
//  CodeInputView
//
//  Created by Isa Aliev on 24.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation
import UIKit

class LabelBasedInputField: UILabel, InputableField {
    struct Configuration {
        typealias AppearanceBlock = (UILabel) -> ()
        
        var onLayoutAppearanceBlock: AppearanceBlock?
        var initialAppearanceBlock: AppearanceBlock?
        var emptyAppearanceBlock: AppearanceBlock?
        var filledAppearanceBlock: AppearanceBlock?
    }

    
    private var value: String?
    
    static var configuration: LabelBasedInputField.Configuration? = LabelBasedInputField.Configuration()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        LabelBasedInputField.configuration?.initialAppearanceBlock?(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        LabelBasedInputField.configuration?.onLayoutAppearanceBlock?(self)
    }
    
    func deleteValue() {
        LabelBasedInputField.configuration?.initialAppearanceBlock?(self)
        LabelBasedInputField.configuration?.emptyAppearanceBlock?(self)
        value = ""
        text = nil
    }
    
    func setValue(_ newValue: String) {
        LabelBasedInputField.configuration?.initialAppearanceBlock?(self)
        LabelBasedInputField.configuration?.filledAppearanceBlock?(self)
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
