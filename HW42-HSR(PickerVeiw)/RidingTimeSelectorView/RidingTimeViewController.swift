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
    
    var ridingTimeSelectorView: RidingTimeSelectorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // basic UI
        setupBackgroundColor()
        setupNavigationBar  ()
        
        // backgroundView
        setupBackgroundView ()
        constraintBackgroundView()
        
    }
    
        func dismissOrPopViewController() {
             self.dismiss(animated: true, completion: nil)
         }

    func addCustomView () {
        backgroundView.addSubview(RidingTimeSelectorView())
        backgroundView.addSubview(RidingDatePickerView())
        
        view.addSubview(backgroundView)
        backgroundView.widthAnchor.constraint(equalToConstant: 390).isActive = true
        backgroundView.heightAnchor.constraint(equalToConstant: 600).isActive = true
    }

    func setupBackgroundView () {
        backgroundView.backgroundColor = Colors.white
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.borderColor  = UIColor.lightGray.cgColor
        backgroundView.layer.borderWidth  = 0.2
        backgroundView.dropShadow()
    }
    
    func constraintBackgroundView () {
        
        view.addSubview(backgroundStackView)
        backgroundStackView.translatesAutoresizingMaskIntoConstraints = false
        backgroundStackView.addArrangedSubview(RidingDatePickerView())
        backgroundStackView.addArrangedSubview(RidingTimeSelectorView())
        
        backgroundStackView.axis = .vertical
        backgroundStackView.spacing = 20
        backgroundStackView.distribution = .fillEqually
        backgroundStackView.alignment = .center
        
        backgroundStackView.backgroundColor = Colors.white
        backgroundStackView.layer.cornerRadius = 10
        backgroundStackView.clipsToBounds      = true
        backgroundStackView.dropShadow()
        
        backgroundStackView.layer.borderColor = UIColor.lightGray.cgColor
        backgroundStackView.layer.borderWidth = 0.2
        
        NSLayoutConstraint.activate([
            backgroundStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            backgroundStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            backgroundStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            backgroundStackView.widthAnchor.constraint(equalToConstant: 390),
            backgroundStackView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
    func setupBackgroundColor () {
        self.view.backgroundColor = Colors.brightGray
    }

    func setupNavigationBar () {
        // Set up titleText color in appearance.
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Colors.navigationBarColor
        appearance.titleTextAttributes = [.foregroundColor: Colors.white]
        self.navigationItem.scrollEdgeAppearance = appearance

        self.navigationController?.isNavigationBarHidden      = false
        self.navigationItem.title  = "選擇出發日期與時間"

        self.navigationItem.titleView?.tintColor = .white
    }
}


#Preview {
    UINavigationController(rootViewController: RidingTimeViewController())
}
