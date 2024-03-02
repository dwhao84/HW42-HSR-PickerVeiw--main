//
//  SquareButton.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/3/2.
//

import UIKit

class SquareButton: UIButton {
    
    // Property to hold the click count
    private var clickCount = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        // Add target for touch up inside action
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        // Initial button image
        updateSquareButtonImage()
    }
    
    @objc private func buttonTapped() {
        // Increment click count
        clickCount += 1
        // Update button image based on click count
        updateSquareButtonImage ()
    }
    
    private func updateSquareButtonImage() {
        // Determine the button image based on click count
        // This is a simplified example; you can customize the logic as needed

        if clickCount.isMultiple(of: 2) {
            self.setImage(Images.square, for: .normal)
        } else {
            self.setImage(Images.checkmarkSquare, for: .normal)
        }
    }
}
