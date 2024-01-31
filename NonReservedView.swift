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
        configureInnerBottomStackView ()
        
        cofigureFirstTextView()
        configureSecondTextView()
        configureTextViewStackView ()
    }

    // MARK: - Top Container View
    func configureTrainStatusButton () {
        let attributedText = NSAttributedString(string: " 全線正常營運", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)])
        trainStatusButton.setAttributedTitle(attributedText, for: .normal)
        trainStatusButton.setImage(Images.circle, for: .normal)
        
        trainStatusButton.tintColor                = Colors.darkGreen
        trainStatusButton.isUserInteractionEnabled = false
    }
    
    func configureTopContainerView () {
        topContainerView.addSubview(trainStatusButton)
        trainStatusButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            trainStatusButton.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor),
            trainStatusButton.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor)
        ])
    }
    
    func constraintTopContainerStackView () {
        self.addSubview(topContainerStackView)
        topContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        topContainerStackView.layer.borderColor = Colors.black.cgColor
        topContainerStackView.layer.borderWidth = 2
        
        topContainerStackView.axis         = .vertical
        topContainerStackView.spacing      = 0
        topContainerStackView.distribution = .fill
        topContainerStackView.addArrangedSubview(topContainerView)
        
        NSLayoutConstraint.activate([
            topContainerStackView.topAnchor.constraint(equalTo: self.topAnchor),
            topContainerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topContainerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topContainerStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/10.9)
        ])
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
        bluetoothImageView.image = Images.bluetoothIcon
        bluetoothImageView.contentMode = .scaleAspectFit
    }

    func configureInnerBottomStackView () {
        
        bluetoothImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        bluetoothImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        self.addSubview(innerBottomStackView)
        innerBottomStackView.translatesAutoresizingMaskIntoConstraints = false
    
        innerBottomStackView.addArrangedSubview(bluetoothImageView)
        innerBottomStackView.addArrangedSubview(statusLabel)
        innerBottomStackView.addArrangedSubview(firstTextView)
    
        innerBottomStackView.layer.borderColor = Colors.black.cgColor
        innerBottomStackView.layer.borderWidth = 1

        innerBottomStackView.alignment    = .center
        innerBottomStackView.spacing      = 5
        innerBottomStackView.distribution = .equalSpacing
        innerBottomStackView.axis         = .vertical
    }
    
    func cofigureFirstTextView () {
        firstTextView.text = "本功能僅限於高鐵車站內使用，請開啟藍牙\n功能後即可開始購票，如末能啟用購票功\n能，建議移動至車站售票區域操作，或改由\n自動售票機購票。"
        firstTextView.textColor = Colors.darkGray
        firstTextView.font = UIFont.systemFont(ofSize: 12)
        firstTextView.backgroundColor = Colors.clear
    }
    
    func configureSecondTextView () {
        secondTextView.text = "本功能服務時間為每日05:00~23:59(特殊狀\n況除外)，若仍有購票需求請洽車站窗口或\n自動售票機。"
        secondTextView.textColor = Colors.darkGray
        secondTextView.font = UIFont.systemFont(ofSize: 12)
        secondTextView.backgroundColor = Colors.clear
    }
    
    func configureTextViewStackView () {
        self.addSubview(textViewStackView)
        textViewStackView.translatesAutoresizingMaskIntoConstraints = false
        
        firstTextView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        firstTextView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        secondTextView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        secondTextView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        textViewStackView.addArrangedSubview(firstTextView)
        textViewStackView.addArrangedSubview(secondTextView)
        
        textViewStackView.axis         = .vertical
        textViewStackView.alignment    = .center
        textViewStackView.spacing      = 5
        textViewStackView.distribution = .equalSpacing
    }
    
    
    
}

#Preview(traits: .fixedLayout(width: 390, height: 545), body: {
    let nonReservedView = NonReservedView()
    return nonReservedView
   })
