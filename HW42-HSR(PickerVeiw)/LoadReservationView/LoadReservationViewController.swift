//
//  LoadReservationViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/1/27.
//

import UIKit

class LoadReservationViewController: UIViewController {

    let finishButton: UIButton                 = UIButton(type: .system)
    let inquireReservationCodeButton: UIButton = UIButton(type: .system)
    
    let loadReservationView: UIView = LoadReservationView()
    
    let stackView: UIStackView           = UIStackView()
    let secondStackView: UIStackView     = UIStackView()
    let thirdStackView: UIStackView      = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar                    ()
        configureFinishButton                 ()
        configureInquireReservationCodeButton ()
        setupStackView                        ()
        constraintSecondStackView             ()
        self.view.backgroundColor = Colors.brightGray
        
        setupTapGesture                       ()
    }
    
    func setupNavigationBar () {
        // Set up titleText color in appearance.
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = Colors.navigationBarColor
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: Colors.white]
        self.navigationItem.scrollEdgeAppearance = navigationBarAppearance
               
        // Set up titleView
        let hsrImageView = UIImageView(image: Images.hsrImage)
        self.navigationController?.isNavigationBarHidden      = false
        self.navigationItem.titleView?.tintColor = Colors.white
        self.navigationItem.titleView = hsrImageView
        
        // Set up UIBarButtonItem
        let speakerBarButton: UIBarButtonItem = UIBarButtonItem(image: Images.speakerWave, style: .plain, target: self, action: #selector(speakerBarButtonTapped))
        let accountBarButton: UIBarButtonItem = UIBarButtonItem(image: Images.personfill, style: .plain, target: self, action: #selector(accountBarButtonTapped))
        let fixedSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        
        // Set up UIBarButtonItem's tintColor
        speakerBarButton.tintColor = Colors.white
        accountBarButton.tintColor = Colors.white
        
        // Set up navigationItem's rightBarButton
        self.navigationItem.rightBarButtonItems = [accountBarButton, fixedSpace, speakerBarButton]
    }
    
    func configureFinishButton () {
        let height: CGFloat = 45
        finishButton.setTitle("完成", for: .normal)
        finishButton.tintColor          = Colors.white
        finishButton.backgroundColor    = Colors.orangeBrandColor
        finishButton.layer.cornerRadius = height / 5
        finishButton.clipsToBounds      = true
        finishButton.setBackgroundColor(Colors.orange, for: .normal)
        finishButton.setBackgroundColor(Colors.orangeBrandColorSelected, for: .highlighted)
        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
        view.addSubview(finishButton)
    }
    
    func configureInquireReservationCodeButton () {
        let height: CGFloat = 45
        inquireReservationCodeButton.setTitle("訂位代號查詢", for: .normal)
        inquireReservationCodeButton.tintColor          = Colors.black
        inquireReservationCodeButton.backgroundColor    = Colors.clear
        inquireReservationCodeButton.layer.cornerRadius = height / 5
        inquireReservationCodeButton.clipsToBounds      = true
        inquireReservationCodeButton.addTarget(self, action: #selector(inquireReservationCodeButtonTapped), for: .touchUpInside)
        view.addSubview(inquireReservationCodeButton)
    }
    
    func setupStackView () {
        loadReservationView.backgroundColor = Colors.white
        loadReservationView.layer.cornerRadius = 9
        loadReservationView.clipsToBounds      = true
        loadReservationView.heightAnchor.constraint(equalToConstant: 295).isActive = true
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis         = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing      = 20
        
        stackView.addArrangedSubview(loadReservationView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    func constraintSecondStackView () {
        finishButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        finishButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        inquireReservationCodeButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(secondStackView)
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        
        secondStackView.axis         = .vertical
        secondStackView.distribution = .equalSpacing
        secondStackView.spacing      = 10
        
        secondStackView.addArrangedSubview(finishButton)
        secondStackView.addArrangedSubview(inquireReservationCodeButton)
        
        NSLayoutConstraint.activate([
            secondStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            secondStackView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
        ])
    }
    
    // MARK: - UIButton Action:
    @objc func speakerBarButtonTapped (_ sender: UIButton) {
        print("speakerBarButtonTapped")
    }
    
    @objc func accountBarButtonTapped (_ sender: UIButton) {
        print("accountBarButtonTapped")
        let accountVC = AccountViewController()
        self.navigationController?.navigationBar.tintColor = Colors.white
        self.navigationController?.pushViewController(accountVC, animated: true)
    }
    
    @objc func inquireReservationCodeButtonTapped (_ sender: UIButton) {
        print("inquireReservationCodeButtonTapped")
    }
    
    @objc func finishButtonTapped (_ sender: UIButton) {
        print("finishButtonTapped")
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTapGesture() {
        self.view.endEditing(true)
        print("handleTapGesture")
    }
}

#Preview {
    UINavigationController(rootViewController: LoadReservationViewController())
}
