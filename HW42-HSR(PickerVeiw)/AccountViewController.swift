//
//  AccountViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/1/17.
//

import UIKit

class AccountViewController: UIViewController {
    
    let infoTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    let infoSecTableView: UITableView = UITableView(frame: .zero, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupNavigationBar()
        setupTableView    ()
    }
    
    
    func setupNavigationBar () {
        // Set up titleText color in appearance.
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = SystemColor.navigationBarColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationItem.scrollEdgeAppearance = appearance
                
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.title  = "個人中心"

        self.navigationItem.titleView?.tintColor = .white
    }
    
    func setupTableView () {
        addDelegateAndDataSource()
        configureTableView      ()
        constraintsInfoTableView()
    }
    
    func addDelegateAndDataSource () {
        infoTableView.delegate   = self
        infoTableView.dataSource = self
    }
    
    func configureTableView () {
                
        infoTableView.rowHeight = 50
        infoTableView.allowsSelection = true
        infoTableView.separatorStyle = .singleLine
        infoTableView.register(AccountTableViewCell.nib(), forCellReuseIdentifier: AccountTableViewCell.identifier)
        

    }
    
    func constraintsInfoTableView () {
        view.addSubview(infoTableView)
        infoTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            infoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension AccountViewController: UITableViewDelegate{
    
}


extension AccountViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(accountCenterInfo.count)
        return accountCenterInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = infoTableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.identifier, for: indexPath) as? AccountTableViewCell else { fatalError() }
        cell.serviceTitleLabel.text = accountCenterInfo[indexPath.row].title
        cell.iconImageView.image    = UIImage(systemName: accountCenterInfo[indexPath.row].image)
        return cell
    }
}

#Preview {
    UINavigationController(rootViewController: AccountViewController())
}
