//
//  AlertViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/1/29.
//

import UIKit

class AlertViewController: UIViewController {
    
    let backgroundView: UIView   = UIView()



    
    let dataErrorTitleLabel: UILabel   = UILabel()
    
    let dataErrorContentLabel: UILabel = UILabel()
    let confirmButton:     UIButton           = UIButton(type: .system)
    
    let topContainerView: UIView    = UIView()
    let topContainerStackView: UIStackView    = UIStackView()
    let bottomContainerView: UIView = UIView()
    let bottomContainerStackView: UIStackView = UIStackView()
    let containerStackView: UIStackView       = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackgroundView ()
        configureDoneButton     ()
        configureDataErrorTitleLabel ()
        configureDataErrorContentLabel ()
        

        configureTopContainerView         ()
        configureTopContainerStackView    ()
        configureBottomContainerView      ()
        configureBottomContainerStackView ()
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
//        dataErrorContentLabel.backgroundColor = Colors.systemGray2
    }
        
    func configureTopContainerView () {
        topContainerView.backgroundColor = Colors.white
        topContainerView.addSubview(dataErrorTitleLabel)
        
        let bottomLine   = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 25, width: 500, height: 1)
        bottomLine.backgroundColor = Colors.systemGray4.cgColor
        topContainerView.layer.addSublayer(bottomLine)
        
        view.addSubview(topContainerView)
        dataErrorTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dataErrorTitleLabel.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor),
            dataErrorTitleLabel.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor)
        ])
    }
    
    func configureTopContainerStackView () {
        view.addSubview(topContainerStackView)
        topContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        topContainerStackView.axis         = .horizontal
        topContainerStackView.alignment    = .center
        topContainerStackView.distribution = .equalSpacing
        topContainerStackView.spacing      = 5
        topContainerStackView.addArrangedSubview(topContainerView)
    }
    
    func configureBottomContainerView () {
        view.addSubview(bottomContainerView)
        bottomContainerView.backgroundColor = Colors.white
        
        bottomContainerView.addSubview(dataErrorContentLabel)
        bottomContainerView.addSubview(confirmButton)

        dataErrorContentLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints         = false
        
        NSLayoutConstraint.activate([
            dataErrorContentLabel.topAnchor.constraint(equalTo: bottomContainerView.topAnchor, constant: 20),
            dataErrorContentLabel.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 20),
            dataErrorContentLabel.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: -20),
            dataErrorContentLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            confirmButton.topAnchor.constraint(equalTo: dataErrorContentLabel.bottomAnchor, constant: 20),
            confirmButton.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 20),
            confirmButton.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: -20),
            confirmButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureBottomContainerStackView () {
        view.addSubview(bottomContainerStackView)
        bottomContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomContainerStackView.axis = .vertical
        bottomContainerStackView.distribution = .equalSpacing
        bottomContainerStackView.spacing = 0
        bottomContainerStackView.addArrangedSubview(bottomContainerView)
    }
    
    func configureContainerStackView () {
        view.addSubview(containerStackView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        containerStackView.backgroundColor = Colors.green
        
        containerStackView.axis = .vertical
        containerStackView.spacing = 0
        containerStackView.distribution = .fill
        containerStackView.addArrangedSubview(topContainerStackView)
        containerStackView.addArrangedSubview(bottomContainerStackView)
        
        containerStackView.layer.cornerRadius = 5
        containerStackView.clipsToBounds      = true
        
        topContainerStackView.backgroundColor = Colors.white
        
        NSLayoutConstraint.activate([
            topContainerStackView.topAnchor.constraint(equalTo: containerStackView.topAnchor),
            topContainerStackView.centerXAnchor.constraint(equalTo: containerStackView.centerXAnchor),
            topContainerStackView.heightAnchor.constraint(equalTo: containerStackView.heightAnchor, multiplier: 1/4)
        ])
    
        NSLayoutConstraint.activate([
            containerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            containerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            containerStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4)
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
