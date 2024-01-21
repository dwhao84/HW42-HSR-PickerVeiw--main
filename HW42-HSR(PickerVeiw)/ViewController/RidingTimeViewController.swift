//
//  RidingTimeViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/1/21.
//

import UIKit

class RidingTimeViewController: UIViewController {
    
    let backgroundView: UIView           = UIView()
    let backgroundStackView: UIStackView = UIStackView()
    
    let datePickerView: UIView           = UIView()
    
    let datePickerStackView: UIStackView = UIStackView()
    
    
    let timeSelectView: UIView           = UIView()
    let todayButton   : UIButton         = UIButton(type: .system)
    let finishButton:   UIButton         = UIButton(type: .system)
    let fromtitleLabel: UILabel          = UILabel()
    let timeSelectStakView: UIStackView  = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // basic UI
        setupBackgroundColor()
        setupNavigationBar  ()
        
        configureTodayButton()
        configureFinishButton()
        configureTimeSelectView()
        
        
        // backgroundView
        setupBackgroundView ()
        constraintBackgroundView()
    }
    
    
    func configureDatePickerView () {
        
    }
    
    
    func configureFromTitleLabel () {
        fromtitleLabel.text = "出發時間"
        fromtitleLabel.textColor = SystemColor.lightGray
    }
    
    func configureTodayButton () {
        var config   = UIButton.Configuration.filled()
        config.title = "今天"
        config.baseBackgroundColor = SystemColor.orangeBrandColor
        config.baseForegroundColor = SystemColor.orangeBrandColor
        config.cornerStyle = .large
        todayButton.configuration = config
        todayButton.widthAnchor.constraint(equalToConstant: 345).isActive = true
        todayButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        timeSelectView.addSubview(todayButton)
    }
    
    func configureFinishButton () {
        var config   = UIButton.Configuration.filled()
        config.title = "完成"
//        config.baseBackgroundColor = SystemColor.orangeBrandColor
        config.baseForegroundColor = SystemColor.orangeBrandColor
        config.cornerStyle = .large
        todayButton.configuration = config
        todayButton.widthAnchor.constraint(equalToConstant: 345).isActive = true
        todayButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        timeSelectView.addSubview(finishButton)
    }
    
    func configureTimeSelectView () {
        timeSelectView.backgroundColor = SystemColor.white
        timeSelectView.layer.borderColor = SystemColor.lightGray.cgColor
        timeSelectView.layer.borderWidth = 0.2
        timeSelectView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        backgroundView.addSubview(timeSelectView)
    }
    
    func setupBackgroundView () {
        backgroundView.backgroundColor = SystemColor.white
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.borderColor  = UIColor.lightGray.cgColor
        backgroundView.layer.borderWidth  = 0.2
        backgroundView.dropShadow()
    }
    
    func constraintBackgroundView () {
        view.addSubview(backgroundStackView)
        backgroundStackView.addArrangedSubview(backgroundView)
        backgroundStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            backgroundStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            backgroundStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            backgroundStackView.widthAnchor.constraint(equalToConstant: 333),
            backgroundStackView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    func setupBackgroundColor () {
        self.view.backgroundColor = SystemColor.brightGray
    }

    func setupNavigationBar () {
        // Set up titleText color in appearance.
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = SystemColor.navigationBarColor
        appearance.titleTextAttributes = [.foregroundColor: SystemColor.white]
        self.navigationItem.scrollEdgeAppearance = appearance

        self.navigationController?.isNavigationBarHidden      = false
        self.navigationItem.title  = "選擇出發日期與時間"

        self.navigationItem.titleView?.tintColor = .white
    }
}


#Preview {
    UINavigationController(rootViewController: RidingTimeViewController())
}
