# CodeInputView

This view allows you to easily add code input to your application.

You can:
<ul>
<li>Customise appearance of basic fields that are given out-of-the-box
<li>Add your own field and just pass it to IACodeInputView
<li>Specify any number of fields and moreover add them in run-time
<\ul>
        
# How to install

Drag files in Classes folder to your project

# How to use

The main class is IACodeInputView. It's generic class and you can specify what field you want to use by passing its class as generic parameter.
There are two out-of-the-box field types: label based and dot field.

# Label based field example
In viewDidLoad:
```swift
LabelBasedInputField.configuration?.initialAppearanceBlock = { field in // Customising initial appearance of field
        field.textAlignment = .center
        field.backgroundColor = .white
        field.textColor = .black
        field.font = UIFont.systemFont(ofSize: 17.0, weight: .bold)
        }
        
LabelBasedInputField.configuration?.onLayoutAppearanceBlock = { field in // Appearance when will layout
        field.layer.cornerRadius = field.bounds.height / 2
        field.layer.masksToBounds = true
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.black.cgColor
        }
        
let codeView = IACodeInputView<LabelBasedInputField>()
codeView.numberOfFields = 10
codeView.frame = CGRect(x: 0.0, y: 200.0, width: 375.0, height: 100.0)
view.addSubview(codeView)
codeView.becomeFirstResponder()
        
codeView.onCodeDidEnter = { code in
        print(code)
        codeView.clear()
}
```
<p align="left">
  <img width=282 height=500 src="https://i.imgur.com/RliQVeL.png">
</p>

# Dot field example

```swift
DotInputField.configuration.dotSize = 20.0
DotInputField.configuration.fillColor = .black
DotInputField.configuration.emptyColor = .clear
DotInputField.configuration.strokeColor = .black
        
let codeView = IACodeInputView<DotInputField>()
codeView.numberOfFields = 10
codeView.frame = CGRect(x: 0.0, y: 200.0, width: 375.0, height: 100.0)
view.addSubview(codeView)
codeView.becomeFirstResponder()
        
codeView.onCodeDidEnter = { code in
        print(code)
        codeView.clear()
}
```

<p align="left">
  <img width=282 height=500 src="https://i.imgur.com/POgRPwp.png">
</p>

# Custom field

In order to make your custom field you have to implement InputableField protocol and pass your new class as generic parameter to IACodeInputView as shown above
