//
//  InputableField.swift
//  CodeInputView
//
//  Created by Isa Aliev on 24.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol InputableField where Self: UIView {
    func deleteValue()
    func setValue(_ newValue: String)
    func getValue() -> String
    func isEmpty() -> Bool
}
