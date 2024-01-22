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
    
    let datePickerStackView: UIStackView = UIStackView()
    let timeSelectStakView: UIStackView  = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // basic UI
        setupBackgroundColor()
        setupNavigationBar  ()
        
        // backgroundView
        setupBackgroundView ()
        constraintBackgroundView()
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
