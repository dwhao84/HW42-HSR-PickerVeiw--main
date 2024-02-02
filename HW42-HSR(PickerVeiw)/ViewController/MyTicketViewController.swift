//
//  MyTicketViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/1/27.
//

import UIKit

class MyTicketViewController: UIViewController {
    
    let pageControl: UIPageControl   = UIPageControl()
    let introductionLabel: UILabel   = UILabel()
    let forwardButton: UIButton      = UIButton(type: .system)
    let backwardButton: UIButton     = UIButton(type: .system)
    
    let reservationNumberLabel: UILabel = UILabel()
    let quantityLabel: UILabel          = UILabel()

    let trainStatusButton: UIButton = UIButton(type: .system)
    let statusView: UIView = UIView()
    
    // horizontal stackView for forwardBtn & pageControl & backwardButton
    let bottomStackView: UIStackView      = UIStackView()
    // Vertical stackView for introductionLabel & bottomStackView.
    let bottomOnTopStackView: UIStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar    ()
        configureStatusButton ()
        configureStatusView   ()
        self.view.backgroundColor = Colors.brightGray
    }
    
    func setupNavigationBar () {
        // Set up scrollEdgeAppearance
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = Colors.navigationBarColor
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: Colors.white]
        self.navigationItem.scrollEdgeAppearance = navigationBarAppearance
               
        // Set up standardAppearance
        let standardAppearance                                 = UINavigationBarAppearance()
        standardAppearance.backgroundColor                     = Colors.navigationBarColor
        self.navigationController?.navigationBar.standardAppearance = standardAppearance
        
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
    
    // MARK: - Configure StatusView
    // statusButton
    func configureStatusButton () {
        let attributedText = NSAttributedString(string: " 全線正常營運", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)])
        trainStatusButton.setAttributedTitle(attributedText, for: .normal)
        trainStatusButton.setImage(Images.circle, for: .normal)
        trainStatusButton.tintColor                = Colors.darkGreen
        trainStatusButton.isUserInteractionEnabled = false
        trainStatusButton.tintColor = Colors.darkGreen
        statusView.addSubview(trainStatusButton)
        trainStatusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trainStatusButton.centerXAnchor.constraint(equalTo: statusView.centerXAnchor),
            trainStatusButton.centerYAnchor.constraint(equalTo: statusView.centerYAnchor)
        ])
    }
    
    // statusView
    func configureStatusView () {
        statusView.backgroundColor   = Colors.white
        view.addSubview(statusView)
        statusView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            statusView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusView.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    // MARK: -
    
    
    
    
    
    
    
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

}

#Preview {
    UINavigationController(rootViewController: MyTicketViewController())
}
