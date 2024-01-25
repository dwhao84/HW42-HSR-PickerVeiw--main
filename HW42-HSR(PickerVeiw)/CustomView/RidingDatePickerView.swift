//
//  RidingDatePickerView.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/1/23.
//

import UIKit

class RidingDatePickerView: UIView {
    
    let yearLabel: UILabel    = UILabel()
    let arrowButton: UIButton = UIButton(type: .system)
    
    let datePicker: UIDatePicker   = UIDatePicker(frame: .zero)
    
    let secondView: UIView = UIView()

    let stackViewOne:   UIStackView = UIStackView()
    let stackViewTwo:   UIStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI () {
//        configureDatePicker ()
        configureArrowButton()
        configureYearLabel  ()
        configureSecondView ()
        
        constriantStackView ()
    }

    func configureYearLabel () {
        yearLabel.text                      = "2024年"
        yearLabel.textColor                 = SystemColor.lightGray
        yearLabel.textAlignment             = .center
        yearLabel.numberOfLines             = 0
        yearLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(yearLabel)
    }
    
    func configureArrowButton () {
        let arrowImage = UIImage(systemName: "arrowtriangle.forward.fill")
        arrowButton.setImage(arrowImage, for: .normal)
        arrowButton.tintColor                = SystemColor.navigationBarColor
        arrowButton.isUserInteractionEnabled = true
        self.addSubview(arrowButton)
    }
    
    // Set up Date picker.
    func configureDatePicker () {
        datePicker.preferredDatePickerStyle = .inline
        datePicker.minimumDate = Date()
        datePicker.minuteInterval = 5
        datePicker.date = Date()
        
        datePicker.locale = Locale(identifier: "zh-TW")
        self.addSubview(datePicker)
    }
    
    func configureSecondView () {
        secondView.backgroundColor = SystemColor.darkGray
        self.addSubview(secondView)
    }
    
    // Constraint Stack View.
    func constriantStackView () {
        
        // Set yearLabel's width & height.
        yearLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        yearLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        // Set datePicker's width & height.
        arrowButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        arrowButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        // Set secondView for test.
        secondView.widthAnchor.constraint(equalToConstant: 390).isActive = true
        secondView.heightAnchor.constraint(equalToConstant: 275).isActive = true
        

        // Set stackViewOne
         self.addSubview(stackViewOne)
         stackViewOne.translatesAutoresizingMaskIntoConstraints = false
         stackViewOne.addArrangedSubview(yearLabel)
         stackViewOne.addArrangedSubview(arrowButton)

         stackViewOne.axis = .horizontal
         stackViewOne.alignment = .fill
         stackViewOne.distribution = .equalSpacing
         stackViewOne.spacing = 15
//         stackViewOne.layer.borderColor = UIColor.black.cgColor
//         stackViewOne.layer.borderWidth = 1

        NSLayoutConstraint.activate([
            stackViewOne.topAnchor.constraint(equalTo: self.topAnchor),
            stackViewOne.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackViewOne.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackViewOne.widthAnchor.constraint(equalToConstant: 390),
            stackViewOne.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        self.addSubview(stackViewTwo)
        stackViewTwo.translatesAutoresizingMaskIntoConstraints = false
        
        stackViewTwo.addArrangedSubview(secondView)
        stackViewTwo.axis = .horizontal
        stackViewTwo.alignment = .fill
        stackViewTwo.distribution = .equalSpacing
        stackViewTwo.spacing = 15
        
        NSLayoutConstraint.activate([
            stackViewTwo.topAnchor.constraint(equalTo: stackViewOne.bottomAnchor),
            stackViewTwo.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackViewTwo.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackViewTwo.widthAnchor.constraint(equalToConstant: 390),
            stackViewTwo.heightAnchor.constraint(equalToConstant: 270)
        ])
    }
}

#Preview(traits: .fixedLayout(width: 390, height: 315), body: {
    let ridingDatePickerView = RidingDatePickerView()
    return ridingDatePickerView
   })

//        let bottomLine = CALayer()
//        bottomLine.frame = CGRect(x: 0, y: Int(firstViewHeight), width: Int(datePickerWidth), height: 1)
//        bottomLine.backgroundColor = SystemColor.systemGray5.cgColor
//        firstView.layer.addSublayer(bottomLine)
