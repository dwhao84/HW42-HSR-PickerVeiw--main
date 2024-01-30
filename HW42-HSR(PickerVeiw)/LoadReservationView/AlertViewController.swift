//
//  AlertViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/1/29.
//

import UIKit

class AlertViewController: UIViewController {
    
    let backgroundView: UIView   = UIView()
    let containerView: UIView    = UIView()
    let topContainerView: UIView = UIView()
    
    let dataErrorTitleLabel: UILabel   = UILabel()
    let dataErrorContentLabel: UILabel = UILabel()
    
    let confirmButton:     UIButton           = UIButton(type: .system)
    let topContainerStackView: UIStackView    = UIStackView()
    let bottomContainerStackView: UIStackView = UIStackView()
    let containerStackView: UIStackView       = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackgroundView ()
        configureDoneButton     ()
        configureDataErrorTitleLabel ()
        configureDataErrorContentLabel ()
        
        configureTopContainerView    ()
        configureBottomContainerStackView  ()
        configureContainerStackView       ()
    }

    func configureBackgroundView () {
        backgroundView.backgroundColor = Colors.black
        backgroundView.alpha           = 0.55
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [backgroundView.topAnchor.constraint(
                equalTo: view.topAnchor),
             backgroundView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
             backgroundView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor),
             backgroundView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor)
            ])
    }
    
    func configureTopContainerView () {
        topContainerView.backgroundColor = Colors.white
        topContainerView.addSubview(dataErrorTitleLabel)
        dataErrorTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dataErrorTitleLabel.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor),
            dataErrorTitleLabel.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor)
        ])
    }

    func configureDataErrorTitleLabel () {
        dataErrorTitleLabel.text = "資料輸入錯誤！"
        dataErrorTitleLabel.textColor = Colors.lightGray
        dataErrorTitleLabel.textAlignment = .center
        dataErrorTitleLabel.numberOfLines = 0
        dataErrorTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func configureDoneButton () {
        confirmButton.setTitle("確定", for: .normal)
        confirmButton.backgroundColor    = Colors.orange
        confirmButton.isUserInteractionEnabled = true
        confirmButton.titleLabel?.font   = UIFont.boldSystemFont(ofSize: 20)
        confirmButton.layer.cornerRadius = 5
        confirmButton.clipsToBounds      = true
        confirmButton.tintColor          = Colors.white
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
    }
        
    func configureDataErrorContentLabel () {
        dataErrorContentLabel.text = "請確認您輸入之訂位代號或身分證字號/護照後四碼是否正確。"
        dataErrorContentLabel.textColor     = Colors.darkGray
        dataErrorContentLabel.textAlignment = .justified
        dataErrorContentLabel.numberOfLines = 0
    }
        

    func configureBottomContainerStackView () {
        confirmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dataErrorContentLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true

        view.addSubview(bottomContainerStackView)
        bottomContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomContainerStackView.backgroundColor = Colors.white
        
        bottomContainerStackView.axis = .vertical
        bottomContainerStackView.distribution = .fill
        bottomContainerStackView.spacing = 15
        bottomContainerStackView.addArrangedSubview(dataErrorContentLabel)
        bottomContainerStackView.addArrangedSubview(confirmButton)
    }
    
    func configureTopContainerStackView () {
        dataErrorTitleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        dataErrorTitleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(topContainerStackView)
        topContainerStackView.translatesAutoresizingMaskIntoConstraints = false

        topContainerStackView.axis = .horizontal
        topContainerStackView.alignment = .center
        topContainerStackView.distribution = .fill
        topContainerStackView.spacing      = 5
        topContainerStackView.addArrangedSubview(dataErrorTitleLabel)
    }
    
    func configureContainerStackView () {
        view.addSubview(containerStackView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomLine   = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 69, width: 1000, height: 1)
        bottomLine.backgroundColor = Colors.systemGray4.cgColor
        topContainerView.layer.addSublayer(bottomLine)
        
        containerStackView.backgroundColor = Colors.green
        
        containerStackView.axis = .vertical
        containerStackView.spacing = 5
        containerStackView.distribution = .fill
        containerStackView.addArrangedSubview(topContainerStackView)
        containerStackView.addArrangedSubview(bottomContainerStackView)
        
        containerStackView.layer.cornerRadius = 5
        containerStackView.clipsToBounds      = true
        
        NSLayoutConstraint.activate([
            containerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            containerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            containerStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4)
        ])
        
        NSLayoutConstraint.activate([
            topContainerStackView.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor, constant: 20),
            topContainerStackView.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor, constant: 20),
            topContainerStackView.centerXAnchor.constraint(equalTo: containerStackView.centerXAnchor)
        ])
    }
    
    @objc func confirmButtonTapped (_ sender: UIButton) {
        print("confirmButtonTapped")
        self.dismiss(animated: true)
    }
}


#Preview {
    UINavigationController(rootViewController: AlertViewController())
}
