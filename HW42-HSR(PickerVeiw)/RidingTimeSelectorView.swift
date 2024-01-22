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
    
    let todayButton:  UIButton = UIButton(type: .system)
    let finishButton: UIButton = UIButton(type: .system)
    
    let fromTitleLabel: UILabel        = UILabel()
    let fromTimeTextField: UITextField = UITextField()
    
    // This stackView include todayButton & finishButton.
    let stackViewOne: UIStackView   = UIStackView()
    // This stackView include fromTitleLabel & fromTimeTextField.
    let stackViewTwo: UIStackView   = UIStackView()
    // This stackView include stackViewOne & stackViewTwo.
    let stackViewThree: UIStackView = UIStackView()
    
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
        fromTimeTextField.text        = "Time"
        fromTimeTextField.textColor   = SystemColor.darkGray
        fromTimeTextField.borderStyle = .none
    }
        
    func setupView () {
        configureFinishButton  ()
        configureTodayButton   ()
        configureTodayButton   ()
        configureFromTitleLabel()
        configureFromTextField ()
        
        setButtonAction()
        
        constraintsStackViewOne  ()
        constriantsStackViewTwo  ()
        constriantsStackViewThree()
    }
    
    func constraintsStackViewOne () {
        
        // Setup Auto-layout constraint for fromTitleLabel.
        fromTitleLabel.widthAnchor.constraint(equalToConstant: 345).isActive = true
        fromTitleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        // Setup Auto-layout constraint for menu.
        fromTimeTextField.widthAnchor.constraint(equalToConstant: 345).isActive = true
        fromTimeTextField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
        
        self.addSubview(stackViewOne)
        stackViewOne.translatesAutoresizingMaskIntoConstraints = false
        
        stackViewOne.addArrangedSubview(fromTitleLabel)
        stackViewOne.addArrangedSubview(fromTimeTextField)
                
        stackViewOne.alignment    = .leading
        stackViewOne.axis         = .vertical
        stackViewOne.distribution = .fillEqually
        stackViewOne.spacing      = 10
    }

    func constriantsStackViewTwo () {
        
        // Set auto-layout constraint for todayButton.
        todayButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        todayButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        // Set auto-layout constraint for finishButton.
        finishButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        finishButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
    
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
        
        stackViewOne.heightAnchor.constraint(equalToConstant: 55).isActive = true
        stackViewTwo.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        stackViewThree.alignment    = .center
        stackViewThree.axis         = .vertical
        stackViewThree.distribution = .equalSpacing
        stackViewThree.spacing      = 20
        
        NSLayoutConstraint.activate([
            stackViewThree.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            stackViewThree.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackViewThree.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackViewThree.widthAnchor.constraint(equalToConstant: 345),
            stackViewThree.heightAnchor.constraint(equalToConstant: 230)
        ])
    }
    
    func setButtonAction () {
        todayButton.addTarget(self, action: #selector(todayButtonTapped), for: .touchUpInside)
        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpOutside)
    }
    
    @objc func todayButtonTapped () {
        print("todayButtonTapped")
    }
    
    @objc func finishButtonTapped () {
        print("finishButtonTapped")
    }
    
}

#Preview(traits: .fixedLayout(width: 390, height: 230), body: {
    let ridingTimeSelectorView = RidingTimeSelectorView()
    return ridingTimeSelectorView
   })
