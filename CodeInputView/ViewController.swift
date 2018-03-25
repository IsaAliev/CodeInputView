//
//  ViewController.swift
//  CodeInputView
//
//  Created by Isa Aliev on 15.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LabelBasedInputField.configuration?.initialAppearanceBlock = { field in
            field.textAlignment = .center
            field.backgroundColor = .white
            field.textColor = .black
            field.font = UIFont.systemFont(ofSize: 17.0, weight: .bold)
        }
        
        LabelBasedInputField.configuration?.onLayoutAppearanceBlock = { field in
            field.layer.cornerRadius = field.bounds.height / 2
            field.layer.masksToBounds = true
            field.layer.borderWidth = 1.0
            field.layer.borderColor = UIColor.black.cgColor
        }
        
        let c = CodeInputView<LabelBasedInputField>()
        c.numberOfFields = 10
        c.frame = CGRect(x: 0.0, y: 200.0, width: 375.0, height: 100.0)
        view.addSubview(c)
        c.becomeFirstResponder()
        
        c.onCodeDidEnter = { code in
            print(code)
            c.clear()
        }
    }
}

