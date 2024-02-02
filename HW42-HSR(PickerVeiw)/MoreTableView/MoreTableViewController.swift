//
//  MoreTableViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/1/26.
//

import UIKit
import SafariServices

class MoreTableViewController: UIViewController, SFSafariViewControllerDelegate {

    let scrollView: UIScrollView = UIScrollView()
    let containerView: UIView    = UIView()
    
    let trainServiceTableView:        UITableView  = UITableView()
    let highSpeedRailInfoTableView:   UITableView  = UITableView()
    let highSpeedRailOptionTableView: UITableView  = UITableView()

    var trainServices:        [TrainService]        = []
    var highSpeedRailInfos:   [HighSpeedRailInfo]   = []
    var highSpeedRailOptions: [HighSpeedRailOption] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar ()
        setTableView       ()
        fetchAllTheData    ()
        
        self.view.backgroundColor = Colors.brightGray
        
        print("DEBUG PRINT: HSR Services data is \(trainServices.count)")
        print("DEBUG PRINT: HSR Infos data is \(highSpeedRailInfos.count)")
        print("DEBUG PRINT: HSR Options data is \(highSpeedRailOptions.count)")
    }
    
    func fetchAllTheData () {
        trainServices        = fetchTrainServiceData()
        highSpeedRailInfos   = fetchHighSpeedRailInfoData()
        highSpeedRailOptions = fetchHighSpeedRailOptionData()
    }
    
    // MARK: - NavigationBar
    func setupNavigationBar () {
        // Set up titleText color in appearance.
        let navigationBarAppearance                 = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor     = Colors.navigationBarColor
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: Colors.navigationBarColor]
        self.navigationItem.scrollEdgeAppearance    = navigationBarAppearance
               
        let standardAppearance                                 = UINavigationBarAppearance()
        standardAppearance.backgroundColor                     = Colors.navigationBarColor
        navigationController?.navigationBar.standardAppearance = standardAppearance
        
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
    
    @objc func speakerBarButtonTapped () {
        print("DEBUG PRINT: speakerBarButtonTapped")
    }
    
    @objc func accountBarButtonTapped () {
        print("DEBUG PRINT: accountBarButtonTapped")
        let accountVC                  = AccountViewController()
        accountVC.modalTransitionStyle = .crossDissolve
        self.navigationController?.navigationBar.tintColor = Colors.white
        self.navigationController?.pushViewController(accountVC, animated: true)
    }
    
    
    // MARK: - TableView
    func setTableView () {
        setTableViewDelegate ()
        setupTableView       ()
        constraintsTableView ()
    }
    
    func setTableViewDelegate () {
        // trainServiceTableView
        trainServiceTableView.delegate          = self
        trainServiceTableView.dataSource        = self
        
        // highSpeedRailInfoTableView
        highSpeedRailInfoTableView.delegate     = self
        highSpeedRailInfoTableView.dataSource   = self
        
        // highSpeedRailOptionTableView
        highSpeedRailOptionTableView.delegate   = self
        highSpeedRailOptionTableView.dataSource = self
    }
    
    func setupTableView () {
        trainServiceTableView.isScrollEnabled        = false
        highSpeedRailInfoTableView.isScrollEnabled   = false
        highSpeedRailOptionTableView.isScrollEnabled = false
        
        // rowHeight
        trainServiceTableView.rowHeight        = 55
        highSpeedRailInfoTableView.rowHeight   = 55
        highSpeedRailOptionTableView.rowHeight = 55
        
        // separatorStyle
//        trainServiceTableView.separatorStyle        = .singleLine
//        highSpeedRailInfoTableView.separatorStyle   = .singleLine
//        highSpeedRailOptionTableView.separatorStyle = .singleLine
        
        // backgroundColor
        trainServiceTableView.backgroundColor        = Colors.white
        highSpeedRailInfoTableView.backgroundColor   = Colors.white
        highSpeedRailOptionTableView.backgroundColor = Colors.white
        
        // register
        trainServiceTableView.register(       MoreTableViewCell.nib(), forCellReuseIdentifier: MoreTableViewCell.identifier)
        highSpeedRailInfoTableView.register(  MoreTableViewCell.nib(), forCellReuseIdentifier: MoreTableViewCell.identifier)
        highSpeedRailOptionTableView.register(MoreTableViewCell.nib(), forCellReuseIdentifier: MoreTableViewCell.identifier)
    }
    
    func constraintsTableView() {
        scrollView.backgroundColor = Colors.brightGray
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        scrollView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        containerView.addSubview(highSpeedRailInfoTableView)
        containerView.addSubview(trainServiceTableView)
        containerView.addSubview(highSpeedRailOptionTableView)
        
        highSpeedRailInfoTableView.translatesAutoresizingMaskIntoConstraints = false
        trainServiceTableView.translatesAutoresizingMaskIntoConstraints = false
        highSpeedRailOptionTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            highSpeedRailOptionTableView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            highSpeedRailOptionTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            highSpeedRailOptionTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),

            trainServiceTableView.topAnchor.constraint(equalTo: highSpeedRailOptionTableView.bottomAnchor, constant: 20),
            trainServiceTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            trainServiceTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            highSpeedRailInfoTableView.topAnchor.constraint(equalTo: trainServiceTableView.bottomAnchor, constant: 20),
            highSpeedRailInfoTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            highSpeedRailInfoTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            highSpeedRailInfoTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
        
        // Set the fixed heights for the table views
        highSpeedRailOptionTableView.heightAnchor.constraint(equalToConstant: 165).isActive = true
        trainServiceTableView.heightAnchor.constraint(equalToConstant:        165).isActive = true
        highSpeedRailInfoTableView.heightAnchor.constraint(equalToConstant:   330).isActive = true
    }

}

extension MoreTableViewController {
    
    func fetchHighSpeedRailOptionData () -> [HighSpeedRailOption] {
        let highSpeedRailOptionOne =   HighSpeedRailOption(image: Images.clock,           title: "高鐵時刻表")
        let highSpeedRailOptionTwo =   HighSpeedRailOption(image: Images.dollarSign,      title: "票價資訊")
        let highSpeedRailOptionThree = HighSpeedRailOption(image: Images.magnifyingglass, title: "查詢訂位代號")
        return [highSpeedRailOptionOne, highSpeedRailOptionTwo, highSpeedRailOptionThree]
    }
    
    func fetchTrainServiceData () -> [TrainService] {
        let trainServiceOne = TrainService(image: Images.docPlain, title: "交易注意事項", url:   "")
        let trainServiceTwo = TrainService(image: Images.doc,      title: "旅客運送契約", url:   "https://www.thsrc.com.tw/event/regulations/ThsrcPassengerTransportationContract.pdf")
        let trainServiceThree = TrainService(image: Images.infomation, title: "使用導覽", url:   "")
        return [trainServiceOne, trainServiceTwo, trainServiceThree]
    }
    
    func fetchHighSpeedRailInfoData () -> [HighSpeedRailInfo] {
        let highSpeedRailInfoOne = HighSpeedRailInfo(
            image:  Images.questionMark,
            title: "關於 T Express",
            url:   "https://www.thsrc.com.tw/ArticleContent/4d262503-84bc-4963-a58e-4ca1a6453ad3")
        let highSpeedRailInfoTwo = HighSpeedRailInfo(
            image:  Images.wheelChair,
            title: "無障礙服務",
            url: "https://www.thsrc.com.tw/ArticleContent/dba4ecd0-5ef0-45d2-aa64-bcecdf7d5fde?breadcrumbs=17b156fd-3e99-4d48-a63f-6dbc77823af3")
        let highSpeedRailInfoThree = HighSpeedRailInfo(
            image:  Images.arrowForward,
            title: "前往高鐵網站",
            url:   "https://www.thsrc.com.tw")
        let highSpeedRailInfoFour = HighSpeedRailInfo(
            image:  Images.hsrLogo,
            title: "前往台灣高鐵App",
            url:   "https://apps.apple.com/tw/app/%E5%8F%B0%E7%81%A3%E9%AB%98%E9%90%B5/id1266626655?l=en-GB")
        let highSpeedRailInfoFive = HighSpeedRailInfo(
            image:  Images.tifeLogo,
            title: "前往高鐵 TLife 網站",
            url:   "https://tlife.thsrc.com.tw/tw")
        let highSpeedRailInfoSix = HighSpeedRailInfo(
            image:  Images.co2Logo,
            title: "高鐵運輸服務碳足跡",
            url:   "https://www.thsrc.com.tw/t/carbonFootprint#stations")
        return [highSpeedRailInfoOne, highSpeedRailInfoTwo, highSpeedRailInfoThree, highSpeedRailInfoFour, highSpeedRailInfoFive, highSpeedRailInfoSix]
    }
}

extension MoreTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        
        if tableView == highSpeedRailOptionTableView {
            
            tableView.deselectRow(at: indexPath, animated: false)
            print("DEBUG PRINT: highSpeedRailOptionTableView didSelectRow is\(indexPath)")
            
        } else if tableView == trainServiceTableView {
            
            tableView.deselectRow(at: indexPath, animated: false)
            
            let selectedURL = trainServices[indexPath.row].url
            if let url = URL(string: selectedURL) {
                let safariVC = SFSafariViewController(url: url)
                safariVC.delegate = self
                present(safariVC, animated: true)
            } else {
                fatalError("DEBUG PRINT: Unable to present the safariVC.")
            }
            print("DEBUG PRINT: trainServiceTableView didSelectRow is\(indexPath)")
            
        } else if tableView == highSpeedRailInfoTableView {
            
            tableView.deselectRow(at: indexPath, animated: true)
            
            let selectedURL = highSpeedRailInfos[indexPath.row].url
            if let url = URL(string: selectedURL) {
                let safariVC = SFSafariViewController(url: url)
                safariVC.delegate = self
                present(safariVC, animated: true)
            } else {
                fatalError("DEBUG PRINT: Unable to present the safariVC.")
            }
            print("DEBUG PRINT: highSpeedRailInfoTableView didSelectRow is\(indexPath)")
        } else {
            print("DEBUG PRINT: tableView is EMPTY")
        }
    }
}

extension MoreTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == trainServiceTableView {
            return trainServices.count
        } else if tableView == highSpeedRailInfoTableView {
            return highSpeedRailInfos.count
        } else if tableView == highSpeedRailOptionTableView {
            return highSpeedRailOptions.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == trainServiceTableView {
            
            guard let trainServiceCell = trainServiceTableView.dequeueReusableCell(withIdentifier: MoreTableViewCell.identifier, for: indexPath) as? MoreTableViewCell else { fatalError() }
            trainServiceCell.serviceImageView.image = trainServices[indexPath.row].image
            trainServiceCell.serviceTitleLabel.text = trainServices[indexPath.row].title
            trainServiceCell.accessoryType          = .disclosureIndicator
            return trainServiceCell
            
        } else if tableView == highSpeedRailInfoTableView {
            
            guard let hightSpeedRailInfoCell = highSpeedRailInfoTableView.dequeueReusableCell(withIdentifier: MoreTableViewCell.identifier, for: indexPath)  as? MoreTableViewCell else { fatalError() }
            hightSpeedRailInfoCell.serviceImageView.image = highSpeedRailInfos[indexPath.row].image
            hightSpeedRailInfoCell.serviceTitleLabel.text = highSpeedRailInfos[indexPath.row].title
            hightSpeedRailInfoCell.accessoryType          = .disclosureIndicator
            return hightSpeedRailInfoCell
            
        } else if tableView == highSpeedRailOptionTableView {
            
            guard let highSpeedRailOptionCell = highSpeedRailOptionTableView.dequeueReusableCell(withIdentifier: MoreTableViewCell.identifier, for: indexPath) as? MoreTableViewCell else { fatalError() }
            highSpeedRailOptionCell.serviceImageView.image = highSpeedRailOptions[indexPath.row].image
            highSpeedRailOptionCell.serviceTitleLabel.text = highSpeedRailOptions[indexPath.row].title
            highSpeedRailOptionCell.accessoryType          = .disclosureIndicator
            return highSpeedRailOptionCell
            
        } else {
            return UITableViewCell()
        }
    }
}

#Preview {
    UINavigationController(rootViewController: MoreTableViewController())
}

