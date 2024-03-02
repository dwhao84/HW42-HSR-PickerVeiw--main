//
//  LoginButton.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/3/2.
//

import UIKit

class LoginButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configurationUpdateHandler = { button in
            button.alpha = button.isHighlighted ?  0.5 : 1
        }
    }
    
    
}
