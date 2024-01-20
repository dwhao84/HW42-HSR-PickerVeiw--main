//
//  AccountViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/1/17.
//

import UIKit

class AccountViewController: UIViewController {
    
    let infoTableView: UITableView    = UITableView()
    let infoSecTableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar   ()
        setupTableView       ()
        self.view.backgroundColor = SystemColor.brightGray
    }
    
    
    func setupNavigationBar () {
        // Set up titleText color in appearance.
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = SystemColor.navigationBarColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationItem.scrollEdgeAppearance = appearance
                
        self.navigationController?.isNavigationBarHidden      = false
        self.navigationController?.navigationBar.barTintColor = SystemColor.white
        self.navigationItem.title  = "個人中心"

        self.navigationItem.titleView?.tintColor = .white
    }
    
    func setupTableView () {
        addDelegateAndDataSource()
        configureTableView      ()
        constraintsInfoTableView()
    }
    
    func addDelegateAndDataSource () {
        // infoTableView
        infoTableView.delegate   = self
        infoTableView.dataSource = self
        
        // infoSecTableView
        infoSecTableView.delegate   = self
        infoSecTableView.dataSource = self
    }
    
    func configureTableView () {
        // infoTableView
        infoTableView.rowHeight = 55
        infoTableView.allowsSelection = true
        infoTableView.isScrollEnabled = false
        infoTableView.separatorStyle  = .singleLine
        infoTableView.register(AccountTableViewCell.nib(), forCellReuseIdentifier: AccountTableViewCell.identifier)
        
        // infoSecTableView
        infoSecTableView.rowHeight = 55
        infoSecTableView.isScrollEnabled = false
        infoSecTableView.allowsSelection = true
        infoSecTableView.separatorStyle  = .singleLine
        infoSecTableView.register(AccountTableViewCell.nib(), forCellReuseIdentifier: AccountTableViewCell.identifier)
        
        infoTableView.backgroundColor    = SystemColor.brightGray
        infoSecTableView.backgroundColor = SystemColor.brightGray
    }
    
    // infoSecTableView
    func constraintsInfoTableView () {
        view.addSubview(infoTableView)
        view.addSubview(infoSecTableView)
        
        infoTableView.translatesAutoresizingMaskIntoConstraints    = false
        infoSecTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            infoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoTableView.heightAnchor.constraint(equalToConstant: 300),

            infoSecTableView.topAnchor.constraint(equalTo: infoTableView.bottomAnchor),
            infoSecTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoSecTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoSecTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension AccountViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath)
    }
}


extension AccountViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(accountCenterInfo.count)
        print(accountCenterSecInfo.count)
        if tableView == infoTableView {
            return accountCenterInfo.count
        } else if tableView == infoSecTableView {
            return accountCenterSecInfo.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == infoTableView {
            guard let cell = infoTableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.identifier, for: indexPath) as? AccountTableViewCell else { fatalError() }
            cell.serviceTitleLabel.text = accountCenterInfo[indexPath.row].title
            cell.iconImageView.image    = UIImage(systemName: accountCenterInfo[indexPath.row].image)
            return cell
        } else if tableView == infoSecTableView {
            guard let secondCell = infoSecTableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.identifier, for: indexPath) as? AccountTableViewCell else { fatalError() }
            secondCell.serviceTitleLabel.text = accountCenterSecInfo[indexPath.row].title
            secondCell.iconImageView.image    = UIImage(systemName: accountCenterSecInfo[indexPath.row].image)
            return secondCell
        }
        return UITableViewCell()
    }
}

#Preview {
    UINavigationController(rootViewController: AccountViewController())
}
