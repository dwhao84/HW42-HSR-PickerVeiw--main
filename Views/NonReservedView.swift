//
//  NonReservedView.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/1/31.
//

import UIKit

class NonReservedView: UIView {
    
    let topContainerView: UIView           = UIView()
    let trainStatusButton: UIButton        = UIButton(type: .system)
    let circleImageView : UIImageView      = UIImageView()
    let topInnerStackView: UIStackView     = UIStackView()
    let topContainerStackView: UIStackView = UIStackView()
    
    let bottomContainerView: UIView        = UIView()       // background is white.
    let bottomContentView: UIView          = UIView()       // background is gray.
    var bluetoothImageView:  UIImageView   = UIImageView()  // blue tooth imageView.
    let statusLabel: UILabel               = UILabel()      // 讀取中...
    
    let innerBottomStackView: UIStackView  = UIStackView()  // bluetoothImageView & statusLabel
    
    let firstTextView: UITextView          = UITextView()
    let secondTextView: UITextView          = UITextView()
    let textViewStackView: UIStackView     = UIStackView()
    let bottomInnerStackView: UIStackView  = UIStackView()
    
    let bottomBackgroundView: UIView       = UIView()
    let bottomStackView: UIStackView       = UIStackView()
      
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI () {
        setupTopContainerView   ()
        setupBottomContainerView()
    }
    
    func setupTopContainerView () {
        configureTrainStatusButton      ()
        configureTopContainerView       ()
        constraintTopContainerStackView ()
    }
    
    func setupBottomContainerView () {
        configureBlueToothIcon        ()
        configureStatusLabel          ()
        
        cofigureFirstTextView        ()
        configureSecondTextView      ()
        configureTextViewStackView   ()
        setBottomInnerStackView      ()
        
        setupBottomBackgroundView ()
        constraintContainerView ()
    }

    // MARK: - Top Container View
    func configureTrainStatusButton () {
        let attributedText = NSAttributedString(string: " 全線正常營運", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)])
        trainStatusButton.setAttributedTitle(attributedText, for: .normal)
        trainStatusButton.setImage(Images.circle, for: .normal)
        
        trainStatusButton.tintColor                = Colors.darkGreen
        trainStatusButton.isUserInteractionEnabled = false
    }
    
    func configureTopContainerView () {
        topContainerView.addSubview(trainStatusButton)
        trainStatusButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            trainStatusButton.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor, constant: 5),
            trainStatusButton.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor),

        ])
    }
    
    func constraintTopContainerStackView () {
        self.addSubview(topContainerStackView)
        topContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        topContainerStackView.layer.borderColor = Colors.black.cgColor
        topContainerStackView.layer.borderWidth = 2
        
        topContainerStackView.axis              = .vertical
        topContainerStackView.spacing           = 0
        topContainerStackView.distribution      = .fill
        topContainerStackView.addArrangedSubview(topContainerView)
    }
    
    // MARK: - bottom Container View
    func configureStatusLabel () {
        statusLabel.text          = "讀取中..."
        statusLabel.font          = UIFont.boldSystemFont(ofSize: 17)
        statusLabel.textColor     = Colors.darkGray
        statusLabel.numberOfLines = 1
        statusLabel.textAlignment = .center
    }
    
    func configureBlueToothIcon () {
        bluetoothImageView.image       = Images.bluetoothIcon
        bluetoothImageView.contentMode = .scaleAspectFit
    }

    
    func cofigureFirstTextView () {
        firstTextView.text = "本功能僅限於高鐵車站內使用，請開啟藍牙功能後即可開始購票，如末能啟用購票功能，建議移動至車站售票區域操作，或改由自動售票機購票。"
        firstTextView.textColor                          = Colors.darkGray
        firstTextView.font                               = UIFont.systemFont(ofSize: 14)
        firstTextView.backgroundColor                    = Colors.clear
        firstTextView.textAlignment                      = .natural
        firstTextView.textContainer.maximumNumberOfLines = 0
    }
    
    func configureSecondTextView () {
        secondTextView.text = "本功能服務時間為每日05:00~23:59(特殊狀況除外)，若仍有購票需求請洽車站窗口或自動售票機。"
        secondTextView.textColor                          = Colors.darkGray
        secondTextView.font                               = UIFont.systemFont(ofSize: 14)
        secondTextView.backgroundColor                    = Colors.clear
        secondTextView.textAlignment                      = .natural
        secondTextView.textContainer.maximumNumberOfLines = 0
    }
    
    func configureTextViewStackView () {
        self.addSubview(textViewStackView)
        textViewStackView.translatesAutoresizingMaskIntoConstraints = false
        
        firstTextView.widthAnchor.constraint(equalToConstant: 310).isActive = true
        firstTextView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        secondTextView.widthAnchor.constraint(equalToConstant: 310).isActive = true
        secondTextView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        textViewStackView.addArrangedSubview(firstTextView)
        textViewStackView.addArrangedSubview(secondTextView)
        
        textViewStackView.axis         = .vertical
        textViewStackView.alignment    = .center
        textViewStackView.spacing      = 10
        textViewStackView.distribution = .equalCentering
    }
    
    func setBottomInnerStackView () {
        bluetoothImageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        bluetoothImageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        self.addSubview(bottomInnerStackView)
        bottomInnerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomInnerStackView.axis = .vertical
        bottomInnerStackView.distribution = .equalSpacing
        bottomInnerStackView.alignment    = .center
        bottomInnerStackView.spacing = 9
        bottomInnerStackView.addArrangedSubview(bluetoothImageView)
        bottomInnerStackView.addArrangedSubview(statusLabel)
        bottomInnerStackView.addArrangedSubview(textViewStackView)
        
        bottomInnerStackView.backgroundColor = Colors.brightGray
        
        NSLayoutConstraint.activate([
            bottomInnerStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            bottomInnerStackView.widthAnchor.constraint(equalToConstant:  350),
            bottomInnerStackView.heightAnchor.constraint(equalToConstant: 380)
        ])
    }
    
    func setupBottomBackgroundView () {
        self.addSubview(bottomBackgroundView)
        bottomBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        bottomBackgroundView.addSubview(bottomInnerStackView)
        
        bottomBackgroundView.backgroundColor = Colors.clear
        
        NSLayoutConstraint.activate([
            bottomBackgroundView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            bottomInnerStackView.topAnchor.constraint(equalTo: bottomBackgroundView.topAnchor, constant: 20)
        ])
    }
    
    func constraintContainerView () {
        topContainerStackView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        let bottomLine             = CALayer()
        bottomLine.frame           = CGRect(x: -200, y: 44, width: 400, height: 1)
        bottomLine.backgroundColor = Colors.systemGray4.cgColor
        bottomStackView.layer.addSublayer(bottomLine)
        
        self.addSubview(bottomStackView)
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomStackView.axis         = .vertical
        bottomStackView.alignment    = .center
        bottomStackView.spacing      = 0
        bottomStackView.distribution = .fill
        
        bottomStackView.addArrangedSubview(topContainerStackView)
        bottomStackView.addArrangedSubview(bottomBackgroundView)
        
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: self.topAnchor),
            bottomStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topContainerStackView.topAnchor.constraint(equalTo: self.topAnchor),
            topInnerStackView.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
}

#Preview(traits: .fixedLayout(width: 390, height: 545), body: {
    let nonReservedView = NonReservedView()
    return nonReservedView
   })
