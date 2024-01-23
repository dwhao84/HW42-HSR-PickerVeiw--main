//
//  RidingTimeSelectorView.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/1/22.
//

import UIKit

class RidingTimeSelectorView: UIView {
    
    let buttonHeight: CGFloat    = 45
    let buttonWidth:  CGFloat    = 345
    let textFieldHeight: CGFloat = 40
    
    let grayLineWidth : CGFloat = 345
    let grayLineHeight: CGFloat = 1
    
    let todayButton:  UIButton = UIButton(type: .system)
    let finishButton: UIButton = UIButton(type: .system)
    
    let fromTitleLabel: UILabel        = UILabel()
    let fromTimeTextField: UITextField = UITextField()
    
    let grayLineView: UIView = UIView()
    
    // This stackView include todayButton & finishButton.
    let stackViewOne: UIStackView   = UIStackView()
    // This stackView include fromTitleLabel & fromTimeTextField.
    let stackViewTwo: UIStackView   = UIStackView()
    // This stackView include stackViewOne & stackViewTwo.
    let stackViewThree: UIStackView = UIStackView()
    
    // This stackView is for bottom line.
    let stackViewFour: UIStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView ()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView ()
    }
    
    func configureTodayButton () {
        todayButton.setTitle("今天", for: .normal)
        todayButton.backgroundColor    = SystemColor.white
        todayButton.tintColor          = SystemColor.orangeBrandColor
        todayButton.layer.cornerRadius = buttonHeight / 8
        todayButton.clipsToBounds      = true
        todayButton.layer.borderColor  = SystemColor.orangeBrandColor.cgColor
        todayButton.layer.borderWidth  = 1
    }
    
    func configureFinishButton () {
        finishButton.setTitle("完成", for: .normal)
        finishButton.backgroundColor    = SystemColor.orangeBrandColor
        finishButton.tintColor          = SystemColor.white
        finishButton.layer.cornerRadius = buttonHeight / 8
        finishButton.clipsToBounds      = true
    }
    
    func configureFromTitleLabel () {
        fromTitleLabel.text          = "出發時間"
        fromTitleLabel.textColor     = SystemColor.lightGray
        fromTitleLabel.font          = UIFont.systemFont(ofSize: 17)
        fromTitleLabel.numberOfLines = 0
    }
    
    func configureFromTextField () {
        // Set up fromTimeTextField content.
        fromTimeTextField.text        = "Time"
        fromTimeTextField.textColor   = SystemColor.darkGray
        fromTimeTextField.borderStyle = .none
        fromTimeTextField.isEnabled   = false
        fromTimeTextField.isUserInteractionEnabled = true
        
        // Set up rightView for textField.
        fromTimeTextField.rightViewMode = UITextField.ViewMode.always
        fromTimeTextField.rightViewMode = .always
        
        // Set up arrowTriangleView as imageView.
        let arrowTriangleImageView = UIImageView(image: UIImage(systemName: "arrowtriangle.down.fill"))
        arrowTriangleImageView.tintColor = SystemColor.navigationBarColor
        fromTimeTextField.rightView = arrowTriangleImageView
        
        // Add bottom line for UITextField.
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: Int(textFieldHeight) - 1, width: 345, height: 1)
        bottomLine.backgroundColor = SystemColor.systemGray5.cgColor
        fromTimeTextField.layer.addSublayer(bottomLine)
    }
    
    func setupView () {
        configureFinishButton  ()
        configureTodayButton   ()
        configureTodayButton   ()
        configureFromTitleLabel()
        configureFromTextField ()
        
        constraintsStackViewOne  ()
        constriantsStackViewTwo  ()
        constriantsStackViewThree()
    }
    
    func constraintsStackViewOne () {
        
        // Setup Auto-layout constraint for fromTitleLabel.
        fromTitleLabel.widthAnchor.constraint(equalToConstant: 390).isActive = true
        fromTitleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        // Setup Auto-layout constraint for menu.
        fromTimeTextField.widthAnchor.constraint(equalToConstant: 390).isActive = true
        fromTimeTextField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
        
        
        self.addSubview(stackViewOne)
        stackViewOne.translatesAutoresizingMaskIntoConstraints = false
        
        stackViewOne.addArrangedSubview(fromTitleLabel)
        stackViewOne.addArrangedSubview(fromTimeTextField)
        stackViewOne.addArrangedSubview(grayLineView)
        
        stackViewOne.alignment    = .leading
        stackViewOne.axis         = .vertical
        stackViewOne.distribution = .fillEqually
        stackViewOne.spacing      = 5
    }
    
    func constriantsStackViewTwo () {
        
        // Set auto-layout constraint for todayButton.
        todayButton.widthAnchor.constraint(equalToConstant: 390).isActive = true
        todayButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        // Set auto-layout constraint for finishButton.
        finishButton.widthAnchor.constraint(equalToConstant: 390).isActive = true
        finishButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        self.addSubview(stackViewTwo)
        stackViewTwo.translatesAutoresizingMaskIntoConstraints = false
        
        stackViewTwo.addArrangedSubview(todayButton)
        stackViewTwo.addArrangedSubview(finishButton)
        
        stackViewTwo.alignment    = .center
        stackViewTwo.axis         = .vertical
        stackViewTwo.distribution = .fillEqually
        stackViewTwo.spacing      = 20
    }
    
    func constriantsStackViewThree () {
        self.addSubview(stackViewThree)
        stackViewThree.translatesAutoresizingMaskIntoConstraints = false
        stackViewThree.addArrangedSubview(stackViewOne)
        stackViewThree.addArrangedSubview(stackViewTwo)
        
        stackViewOne.heightAnchor.constraint(equalToConstant: 56).isActive = true
        stackViewTwo.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        stackViewThree.alignment    = .center
        stackViewThree.axis         = .vertical
        stackViewThree.distribution = .fillEqually
        stackViewThree.spacing      = 5
        
//        stackViewThree.layer.borderColor = UIColor.black.cgColor
//        stackViewThree.layer.borderWidth = 2
        
        NSLayoutConstraint.activate([
            stackViewThree.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            stackViewThree.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            stackViewThree.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            stackViewThree.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            stackViewThree.widthAnchor.constraint(equalToConstant: 390),
            stackViewThree.heightAnchor.constraint(equalToConstant: 230)
        ])
    }
}

#Preview(traits: .fixedLayout(width: 390, height: 230), body: {
    let ridingTimeSelectorView = RidingTimeSelectorView()
    return ridingTimeSelectorView
   })
