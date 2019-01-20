//
//  CardView.swift
//  BreakPoint
//
//  Created by lucas on 20/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    func setupView() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius  = 5
        self.layer.shadowColor = UIColor.black.cgColor
    }

}
