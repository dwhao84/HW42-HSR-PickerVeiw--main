//
//  SquareButton.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/3/2.
//

import UIKit

class SquareButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configurationUpdateHandler = { button in
                var config = button.configuration
            config?.background.image = button.isHighlighted ? Images.square : Images.checkmarkSquare
                button.configuration = config
        }
    }
}
