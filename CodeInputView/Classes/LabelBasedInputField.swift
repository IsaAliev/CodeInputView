//
//  LabelBasedInputField.swift
//  CodeInputView
//
//  Created by Isa Aliev on 24.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation
import UIKit

public class LabelBasedInputField: UILabel, InputableField {
    public struct Configuration {
        public typealias AppearanceBlock = (UILabel) -> ()
        
        public var onLayoutAppearanceBlock: AppearanceBlock?
        public var initialAppearanceBlock: AppearanceBlock?
        public var emptyAppearanceBlock: AppearanceBlock?
        public var filledAppearanceBlock: AppearanceBlock?
    }

    
    private var value: String?
    
    public static var configuration: LabelBasedInputField.Configuration? = LabelBasedInputField.Configuration()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        LabelBasedInputField.configuration?.initialAppearanceBlock?(self)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        LabelBasedInputField.configuration?.onLayoutAppearanceBlock?(self)
    }
    
    public func deleteValue() {
        LabelBasedInputField.configuration?.initialAppearanceBlock?(self)
        LabelBasedInputField.configuration?.emptyAppearanceBlock?(self)
        value = ""
        text = nil
    }
    
    public func setValue(_ newValue: String) {
        LabelBasedInputField.configuration?.initialAppearanceBlock?(self)
        LabelBasedInputField.configuration?.filledAppearanceBlock?(self)
        value = newValue
        text = newValue
    }
    
    public func getValue() -> String {
        return value ?? ""
    }
    
    public func isEmpty() -> Bool {
        return value == nil
    }
}
