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
    var finishButton: UIButton = UIButton(type: .system)
    
    let fromTitleLabel: UILabel        = UILabel()
    let fromTimeTextField: UITextField = UITextField()
    
    let grayLineView: UIView = UIView()
    
    let datePicker: UIDatePicker = UIDatePicker()
    
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
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()

    }
    
    func getCurrentTimeAndUpdateContext () -> String {
        let calendar = Calendar.current                             // Get the information from calendar.
        let currentTime = calendar.component(.minute, from: Date()) // Get the current time by minute and from now date.
        let addFiveMins = (5 - currentTime % 5)                     // Use the 5mins as unit, and calculate time from 5mins to minus currentTime.
        let date = calendar.date(byAdding: .minute, value: addFiveMins, to: Date()) // Append time different to set up as 5mins as uint.
        
        let dateFormatter        = DateFormatter()
        dateFormatter.calendar   = Calendar(identifier: .iso8601)
        dateFormatter.locale     = Locale(identifier: "zh-TW")         // Set up local time as "zh-TW"
        dateFormatter.timeZone   = .current                            // Get the current timeZone.
        dateFormatter.dateFormat = "HH:mm"                             // Set up dateFormat for date.
        let current = dateFormatter.string(from: date!)           // Format the date by using dateFormatter.string to a string.
        let selectedTimeAddText = current + " 後出發"
        return selectedTimeAddText
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
        finishButton.setBackgroundColor(SystemColor.orangeBrandColor, for: .normal)
        finishButton.setBackgroundColor(SystemColor.orangeBrandColorSelected, for: .highlighted)
        finishButton.tintColor          = SystemColor.white
        finishButton.layer.cornerRadius = buttonHeight / 8
        finishButton.clipsToBounds      = true
        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
    }
    
    func configureFromTitleLabel () {
        fromTitleLabel.text          = "出發時間"
        fromTitleLabel.textColor     = SystemColor.lightGray
        fromTitleLabel.font          = UIFont.systemFont(ofSize: 17)
        fromTitleLabel.numberOfLines = 0
    }
    
    func configureFromTextField () {
        fromTimeTextField.delegate = self

        // Set up fromTimeTextField content.
        fromTimeTextField.text        = getCurrentTimeAndUpdateContext ()
        fromTimeTextField.textColor   = SystemColor.darkGray
        fromTimeTextField.borderStyle = .none
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
        
        configureDatePicker ()
        
        fromTimeTextField.inputView = datePicker
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        doneButton.tintColor = SystemColor.orangeBrandColor
        let flexibleSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolBar.setItems([flexibleSpace, doneButton], animated: true)
        
        fromTimeTextField.inputAccessoryView = toolBar
    }
    
    func configureDatePicker () {
        let calendar = Calendar.current
        let currentTime = calendar.component(.minute, from: Date()) // Get the current time by minute and from now date.
        let addFiveMins = (5 - currentTime % 5)                     // Use the 5mins as unit, and calculate time from 5mins to minus currentTime.
        guard let date = calendar.date(byAdding: .minute, value: addFiveMins, to: Date()) else {
            datePicker.date = Date()
            print(datePicker.date)
            return
        }
        
        datePicker.date = date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.minuteInterval = 5
        datePicker.datePickerMode = .time
    }
    
    @objc func doneButtonTapped () {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let selectedTime = dateFormatter.string(from: datePicker.date)
        let selectedTimeAddText = selectedTime + " 後出發"
        fromTimeTextField.text = selectedTimeAddText
        self.endEditing(true)
    }
    
    func setupUI() {
        configureFinishButton  ()
        configureTodayButton   ()
        configureTodayButton   ()
        configureFromTitleLabel()
        configureFromTextField ()
        
        todayButtonAddAction     ()
        
        constraintsStackViewOne  ()
        constriantsStackViewTwo  ()
        constriantsStackViewThree()
}
    
    // MARK: - Add Button Action.
    // Create a function named finishButtonTapped.
    @objc func finishButtonTapped (_ sender: UIButton) {
        print("finishButtonTapped")
    }
    
    // Add Action
    func todayButtonAddAction () {
        let todayAction = UIAction { [weak self] _ in
            self?.toadyButtonTapped() }
        todayButton.addAction(todayAction, for: .touchUpInside)
        
        todayButton.addTarget(self, action: #selector(todayButtonTouchDown), for: .touchDown)
        todayButton.addTarget(self, action: #selector(todayButtonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
    }
    
    // Create a function named toadyButtonTapped.
    func toadyButtonTapped () {
        print("toadyButtonTapped")
        fromTimeTextField.text = getCurrentTimeAndUpdateContext ()
        print("\(fromTimeTextField.text!), 回復成現在的時間")
        self.endEditing(true)
    }

    @objc func todayButtonTouchDown() {
        todayButton.layer.borderColor = SystemColor.orangeBrandColorSelected.cgColor
    }

    @objc func todayButtonTouchUp() {
        todayButton.layer.borderColor = SystemColor.orangeBrandColor.cgColor
    }
    
    // MARK: - Constraint Stack View.
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

extension RidingTimeSelectorView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        fromTimeTextField.inputView = datePicker

        return true
    }
}

#Preview(traits: .fixedLayout(width: 390, height: 230), body: {
    let ridingTimeSelectorView = RidingTimeSelectorView()
    return ridingTimeSelectorView
   })
