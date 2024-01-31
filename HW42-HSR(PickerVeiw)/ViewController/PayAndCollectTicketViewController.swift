//
//  PayAndCollectTicketViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/1/27.
//

import UIKit

class PayAndCollectTicketViewController: UIViewController {

    let backgroundView: UIView = UIView()
    let nonReservedView: NonReservedView = NonReservedView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar ()
        self.view.backgroundColor = Colors.brightGray
        configureBackgroundView ()
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
    
    func configureBackgroundView () {
        
        backgroundView.backgroundColor = Colors.brightGray
        backgroundView.addSubview(nonReservedView)
        
        
        backgroundView.layer.borderWidth = 1
        backgroundView.layer.borderColor = Colors.black.cgColor
        
        backgroundView.heightAnchor.constraint(equalToConstant: 555).isActive = true
        
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        nonReservedView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nonReservedView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            nonReservedView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
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
}

#Preview {
    UINavigationController(rootViewController: PayAndCollectTicketViewController())
}
