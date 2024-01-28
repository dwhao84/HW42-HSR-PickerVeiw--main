//
//  AlertViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/1/29.
//

import UIKit

class AlertViewController: UIViewController {

    let backgroundView: UIView = UIView()
    let containerView: UIView   = UIView()

    let topContainerView: UIView    = UIView()
    let bottomContainerView: UIView = UIView()
    
    let dataErrorTitleLabel: UILabel   = UILabel()
    let dataErrorContentLabel: UILabel = UILabel()
    
    let confirmButton:     UIButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackgroundView ()
        configureContainerView  ()
        configureDoneButton     ()
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
                ]
            )
            
        }
    
    func configureContainerView () {
        containerView.layer.cornerRadius = 5
        containerView.clipsToBounds      = true
        containerView.backgroundColor    = Colors.white
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                containerView.centerXAnchor.constraint(
                    equalTo: view.centerXAnchor
                ),
                containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                containerView.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 20
                ),
                containerView.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -20
                ),
                containerView.heightAnchor.constraint(
                    equalTo: view.heightAnchor,
                    multiplier: 1/4
                )
            ])
    }
    
    func configureDoneButton () {
        confirmButton.setTitle("確定", for: .normal)
        confirmButton.backgroundColor    = Colors.orange
        confirmButton.isUserInteractionEnabled = true
        confirmButton.titleLabel?.font   = UIFont.boldSystemFont(ofSize: 20)
        confirmButton.layer.cornerRadius = 5
        confirmButton.clipsToBounds      = true
        confirmButton.tintColor          = Colors.white
        containerView.addSubview(confirmButton)
        
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            confirmButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            confirmButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            confirmButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            confirmButton.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/5),
            confirmButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
        
        func configureDataErrorContentLabel () {
            dataErrorContentLabel.text = "請確認您輸入之訂位代號或身分證字號/護照後四碼是否正確。"
            
        }
        
        func configureDataErrorTitleLabel () {
            dataErrorTitleLabel.text = "資料輸入錯誤！"
            dataErrorTitleLabel.textColor = Colors.lightGray
        }
        
    }
}

#Preview {
    UINavigationController(rootViewController: AlertViewController())
}
