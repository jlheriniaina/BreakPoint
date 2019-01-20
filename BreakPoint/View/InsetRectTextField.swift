//
//  InsetRectTextField.swift
//  BreakPoint
//
//  Created by lucas on 20/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit

class InsetRectTextField: UITextField {
    
    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    override func awakeFromNib() {
        setupView()
        super.awakeFromNib()
    }
    override func prepareForInterfaceBuilder() {
        setupView()
        super.prepareForInterfaceBuilder()
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
       return UIEdgeInsetsInsetRect(bounds, padding)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    func setupView()  {
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [ .foregroundColor : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) ])
        self.attributedPlaceholder = placeholder
    }
}
