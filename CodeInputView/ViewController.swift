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
        
        CodeInputField.configuration.emptyStateBlock = { label in
            label.backgroundColor = .gray
            label.layer.cornerRadius = label.bounds.height / 2.0
            label.layer.masksToBounds = true
            label.textAlignment = .center
        }
        
        CodeInputField.configuration.filledStateBlock = { label in
            label.backgroundColor = .white
        }
        
        
        DotInputField.configuration.fillColor = .cyan
        let c = CodeInputView<CodeInputField>()
        c.frame = CGRect(x: 16.0, y: 200.0, width: 250.0, height: 100.0)
        c.backgroundColor = .green
        view.addSubview(c)
        c.becomeFirstResponder()
                
        // Do any additional setup after loading the view, typically from a nib.
    }
}

