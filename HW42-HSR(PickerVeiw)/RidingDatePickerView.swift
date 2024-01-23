//
//  RidingDatePickerView.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/1/23.
//

import UIKit

class RidingDatePickerView: UIView {
    
    let topViewHeight:    CGFloat = 45
    let datePickerWidth:  CGFloat = 390
    let datePickerHeight: CGFloat = 275
    
    let datePicker: UIDatePicker   = UIDatePicker()
    
    let topView:           UIView  = UIView()
    let topViewBottomLime: UIView  = UIView()
    let monthAndYearLabel: UILabel = UILabel()
    
    let stackViewOne:   UIStackView = UIStackView()
    let stackViewTwo:   UIStackView = UIStackView()
    let stackViewThree: UIStackView = UIStackView()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI () {
        setupDatePicker()
    }
    
    // Set up Date picker.
    func setupDatePicker () {
        datePicker.preferredDatePickerStyle = .inline
        self.addSubview(datePicker)
    }

    
    // Constraint Stack View.
    func constraintStackViewOne () {

        // Set topView width & height.
        topView.widthAnchor.constraint(equalToConstant: datePickerWidth).isActive = true
        topView.heightAnchor.constraint(equalToConstant: topViewHeight).isActive = true
        
        
        stackViewOne.layer.borderColor = UIColor.black.cgColor
        stackViewOne.layer.borderWidth = 1
    }
    
    func constraintStackViewTwo () {
        
        // Set datePicker's width & height.
        datePicker.widthAnchor.constraint(equalToConstant: datePickerWidth).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: datePickerHeight).isActive = true
        
        
        stackViewTwo.layer.borderColor = UIColor.black.cgColor
        stackViewTwo.layer.borderWidth = 1
    }
    
    func constraintStackViewThree () {
        
    }

    
    
}

#Preview(traits: .fixedLayout(width: 390, height: 315), body: {
    let ridingDatePickerView = RidingDatePickerView()
    return ridingDatePickerView
   })
