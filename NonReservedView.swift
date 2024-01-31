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
    
    let bottomContainerView: UIView        = UIView()
    let bottomContentView: UIView          = UIView()
    var bluetoothImageView:  UIImageView   = UIImageView()
    let statusLabel: UILabel               = UILabel()
    let textView: UITextView               = UITextView()
    let secondTextView: UITextView         = UITextView()
    
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
        configureTrainStatusButton      ()
        configureTopContainerView       ()
        constraintTopContainerStackView ()
        configureBlueToothIcon          ()
    }

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
    
    func configureStatusLabel () {
        statusLabel.text          = "讀取中..."
        statusLabel.textColor     = Colors.lightGray
        statusLabel.numberOfLines = 1
        statusLabel.textAlignment = .center
    }
    
    func configureBlueToothIcon () {
        bluetoothImageView.image = Images.bluetoothIcon
        bluetoothImageView.contentMode = .scaleAspectFit
        self.addSubview(bluetoothImageView)
    }

    
}

#Preview(traits: .fixedLayout(width: 390, height: 545), body: {
    let nonReservedView = NonReservedView()
    return nonReservedView
   })
