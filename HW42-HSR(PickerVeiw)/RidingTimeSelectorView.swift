//
//  RidingTimeSelectorView.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/1/22.
//

import UIKit

class RidingTimeSelectorView: UIView {
    
    let buttonHeight: CGFloat = 45
    let buttonWidth:  CGFloat = 345
    
    let todayButton: UIButton  = UIButton(type: .system)
    let finishButton: UIButton = UIButton(type: .system)
    
    let fromTitleLabel: UILabel = UILabel()
    
    // This stackView include todayButton & finishButton.
    let stackViewOne: UIStackView   = UIStackView()
    // This stackView include fromTitleLabel & menu.
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
        todayButton.layer.cornerRadius = buttonHeight / 2
        todayButton.clipsToBounds      = true
        todayButton.layer.borderColor  = SystemColor.orangeBrandColor.cgColor
        todayButton.layer.borderWidth  = 1
    }

    func configureFinishButton () {
        finishButton.setTitle("完成", for: .normal)
        finishButton.backgroundColor    = SystemColor.orangeBrandColor
        finishButton.tintColor          = SystemColor.white
        finishButton.layer.cornerRadius = buttonHeight / 2
        finishButton.clipsToBounds      = true
    }

    func configureFromTitleLabel () {
        fromTitleLabel.text      = "出發時間"
        fromTitleLabel.textColor = SystemColor.lightGray
        fromTitleLabel.font      = UIFont.systemFont(ofSize: 17)
    }
    
        
    func setupView () {
        configureFinishButton ()
        configureTodayButton  ()
        configureTodayButton  ()
        
        setStackViewOne()
        setStackViewTwo()
    }
    
    func setStackViewOne () {
        
        // Setup Auto-layout constraint for fromTitleLabel.
        fromTitleLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
        fromTitleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        // Setup Auto-layout constraint for menu.
        
        
    }

    func setStackViewTwo () {
        
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
        
        stackViewTwo.layer.borderColor = UIColor.black.cgColor
        stackViewTwo.layer.borderWidth = 0.2
        
        stackViewTwo.alignment    = .center
        stackViewTwo.axis         = .vertical
        stackViewTwo.distribution = .fill
        stackViewTwo.spacing      = 20
        
        NSLayoutConstraint.activate([
            stackViewTwo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            stackViewTwo.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
    }
    

    
    func setStackViewThree () {
//        todayButton.translatesAutoresizingMaskIntoConstraints = false
//        finishButton.translatesAutoresizingMaskIntoConstraints = false
//        fromTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    
}

#Preview(traits: .fixedLayout(width: 390, height: 230), body: {
    let ridingTimeSelectorView = RidingTimeSelectorView()
    return ridingTimeSelectorView
   })
