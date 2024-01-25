//
//  MoreTableViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/1/26.
//

import UIKit
import SafariServices

class MoreTableViewController: UIViewController {
    
    let firstTableView: UITableView  = UITableView()
    let secondTableView: UITableView = UITableView()
    let thirdTableView: UITableView  = UITableView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar ()
        self.view.backgroundColor = SystemColor.brightGray
    }
    
    func setupNavigationBar () {
        // Set up titleText color in appearance.
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = SystemColor.navigationBarColor
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationItem.scrollEdgeAppearance = navigationBarAppearance
               
        // Set up titleView
        let hsrImageView = UIImageView(image: UIImage(named: "hsrLogo"))
        self.navigationController?.isNavigationBarHidden      = false
        self.navigationItem.titleView?.tintColor = .white
        self.navigationItem.titleView = hsrImageView
        
        // Set up UIBarButtonItem
        let speakerBarButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"speaker.wave.3.fill"), style: .plain, target: self, action: #selector(speakerBarButtonTapped))
        let accountBarButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"person.fill"), style: .plain, target: self, action: #selector(accountBarButtonTapped))
        let fixedSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        
        // Set up UIBarButtonItem's tintColor
        speakerBarButton.tintColor = SystemColor.white
        accountBarButton.tintColor = SystemColor.white
        
        // Set up navigationItem's rightBarButton
        self.navigationItem.rightBarButtonItems = [accountBarButton, fixedSpace, speakerBarButton]
    }
    
    @objc func speakerBarButtonTapped () {
        
    }
    
    @objc func accountBarButtonTapped () {
        
    }
    
    func setupFirstTableView () {
        
    }
    
    func setupSecondTableView () {
        
    }
    
    func setupThirdTableView () {
        
    }
}

#Preview {
    UINavigationController(rootViewController: MoreTableViewController())
}
