//
//  LoadReservationView.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/1/27.
//

import UIKit

class LoadReservationView: UIView {
    
    let descriptionTextView: UITextView          = UITextView()
    
    let reservationNumberTitleLabel: UILabel     = UILabel()
    let reservationNumberTextField: UITextField  = UITextField()

    let identificationCodeTitleLabel: UILabel    = UILabel()
    let identificationCodeTextField: UITextField = UITextField()
    
    let stackView: UIStackView                   = UIStackView()
    let reservationNumberStackView: UIStackView  = UIStackView()
    let identificationCodeStackView: UIStackView = UIStackView()
    let secondStackView: UIStackView             = UIStackView()
    let thirdStackView:  UIStackView             = UIStackView()
    
    let reservationNumberMaxCount: Int = 8
    let identifcationCodeMaxCount: Int = 4
    
    private let bottomLine = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI ()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI ()
    }
    
    
    func setupUI () {
        self.backgroundColor = Colors.white
        configureDescriptionTextView         ()
        configureTitleLabel                  ()
        configureTextField                   ()
        constraintStactView                  ()
        constriantReservationNumberStackView ()
        constriantIdentificationCodeStackView()
        constraintsSecondStackView           ()
        constraintsThirdStackView            ()
    }

    func configureDescriptionTextView () {
        descriptionTextView.text = "提供網路訂票、TGo會員及其他適用專案之訂位紀錄載入 T Express 進行付款/取票；如欲取得他人TExpress 分票之手機票證，請輸入分票人提供之取票驗證碼進行取票。"
        descriptionTextView.font = UIFont.systemFont(ofSize: 17)
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        descriptionTextView.backgroundColor = Colors.brightGray
        descriptionTextView.isEditable      = false
        descriptionTextView.textColor       = Colors.darkGray
        descriptionTextView.textAlignment   = .left
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.layer.cornerRadius = 3
        descriptionTextView.clipsToBounds   = true
        self.addSubview(descriptionTextView)
    }
    
    func configureTitleLabel () {
        reservationNumberTitleLabel.text           = "訂位代號"
        reservationNumberTitleLabel.font           = UIFont.systemFont(ofSize: 14)
        reservationNumberTitleLabel.textColor      = Colors.systemGray2
        reservationNumberTitleLabel.numberOfLines  = 0
        reservationNumberTitleLabel.textAlignment  = .left
        self.addSubview(reservationNumberTitleLabel)
        
        identificationCodeTitleLabel.text          = "取票驗證碼/取票識別碼"
        identificationCodeTitleLabel.font          = UIFont.systemFont(ofSize: 14)
        identificationCodeTitleLabel.textColor     = Colors.systemGray2
        identificationCodeTitleLabel.numberOfLines = 0
        identificationCodeTitleLabel.textAlignment = .left
        self.addSubview(identificationCodeTitleLabel)
    }
    
    func configureTextField () {
        reservationNumberTextField.placeholder   = "訂位代號共8碼"
        reservationNumberTextField.keyboardType  = .numberPad
        reservationNumberTextField.textColor     = Colors.black
        reservationNumberTextField.font          = UIFont.systemFont(ofSize: 19)
        reservationNumberTextField.borderStyle   = .none
        reservationNumberTextField.delegate      = self
        self.addSubview(reservationNumberTextField)
        
        identificationCodeTextField.placeholder  = "驗證碼或身分證/護照/居留證號末4碼"
        identificationCodeTextField.keyboardType = .numberPad
        identificationCodeTextField.textColor    = Colors.black
        identificationCodeTextField.font         = UIFont.systemFont(ofSize: 19)
        identificationCodeTextField.borderStyle  = .none
        identificationCodeTextField.delegate     = self
        self.addSubview(identificationCodeTextField)
    }

    func constraintStactView () {
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(descriptionTextView)
        
        stackView.axis         = .vertical
        stackView.distribution = .fill
        stackView.spacing      = 0
        stackView.alignment    = .center
        
//        stackView.layer.borderColor = Colors.black.cgColor
//        stackView.layer.borderWidth = 1
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.43)
        ])
    }
    
    func constriantReservationNumberStackView () {
        addSubview(reservationNumberStackView)
        reservationNumberStackView.translatesAutoresizingMaskIntoConstraints = false
        
        reservationNumberStackView.addArrangedSubview(reservationNumberTitleLabel)
        reservationNumberStackView.addArrangedSubview(reservationNumberTextField)
        
        reservationNumberStackView.axis         = .vertical
        reservationNumberStackView.distribution = .fill
        reservationNumberStackView.spacing      = 0
        reservationNumberStackView.alignment    = .leading
        
        let bottomLine             = CALayer()
        bottomLine.frame           = CGRect(x: 0, y: 45, width: 320, height: 1)
        bottomLine.backgroundColor = Colors.systemGray4.cgColor
        reservationNumberStackView.layer.addSublayer(bottomLine)
    }
    
    func constriantIdentificationCodeStackView () {
        addSubview(identificationCodeStackView)
        identificationCodeStackView.translatesAutoresizingMaskIntoConstraints = false
        
        identificationCodeStackView.addArrangedSubview(identificationCodeTitleLabel)
        identificationCodeStackView.addArrangedSubview(identificationCodeTextField)
        
        identificationCodeStackView.axis         = .vertical
        identificationCodeStackView.distribution = .fill
        identificationCodeStackView.spacing      = 5
        identificationCodeStackView.alignment    = .leading
        self.addSubview(identificationCodeStackView)
        
        let bottomLine             = CALayer()
        bottomLine.frame           = CGRect(x: 0, y: 45, width: 320, height: 1)
        bottomLine.backgroundColor = Colors.systemGray4.cgColor
        identificationCodeStackView.layer.addSublayer(bottomLine)
    }
    
    func constraintsSecondStackView () {
        addSubview(secondStackView)
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        
        secondStackView.addArrangedSubview(reservationNumberStackView)
        secondStackView.addArrangedSubview(identificationCodeStackView)
        
        secondStackView.axis         = .vertical
        secondStackView.distribution = .fill
        secondStackView.spacing      = 20
        secondStackView.alignment    = .leading
    }
    
    func constraintsThirdStackView () {
        addSubview(thirdStackView)
        thirdStackView.translatesAutoresizingMaskIntoConstraints = false
        
        thirdStackView.addArrangedSubview(stackView)
        thirdStackView.addArrangedSubview(secondStackView)
        
        thirdStackView.axis         = .vertical
        thirdStackView.distribution = .fill
        thirdStackView.spacing      = 20
        thirdStackView.alignment    = .leading
        
        NSLayoutConstraint.activate([
            thirdStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            thirdStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            thirdStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            thirdStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
}

extension LoadReservationView: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case reservationNumberTextField:
            print("reservationNumberTextField will begin editing")
        case identificationCodeTextField:
            print("identificationCodeTextField will begin editing")
        default:
            break
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        switch textField {
        case reservationNumberTextField:
            reservationNumberTextField.resignFirstResponder()
        case identificationCodeTextField:
            identificationCodeTextField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Get the current text of the text field that is being edited
        let currentText = textField.text ?? ""
        // Convert NSRange to a Swift range
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        // Get the updated text after the change
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        // Check which text field is being edited and apply the respective character limit
        if textField == reservationNumberTextField {
            print("reservationNumberTextField is \(updatedText.count)")
            return updatedText.count <= reservationNumberMaxCount
        } else if textField == identificationCodeTextField {
            print("identificationCodeTextField is \(updatedText.count)")
            return updatedText.count <= identifcationCodeMaxCount
        }
        
        return true
    }

}

#Preview(traits: .fixedLayout(width: 360, height: 295), body: {
    let ridingTimeSelectorView = LoadReservationView()
    return ridingTimeSelectorView
   })
