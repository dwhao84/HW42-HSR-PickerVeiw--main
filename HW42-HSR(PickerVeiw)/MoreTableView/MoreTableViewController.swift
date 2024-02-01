//
//  MoreTableViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/1/26.
//

import UIKit
import SafariServices

class MoreTableViewController: UIViewController {
    
    let containerView: UIView  = UIView()
    let stackView: UIStackView = UIStackView()
    
    let scrollView: UIScrollView = UIScrollView()
    
    let trainServiceTableView:        UITableView  = UITableView()
    let highSpeedRailInfoTableView:   UITableView  = UITableView()
    let highSpeedRailOptionTableView: UITableView  = UITableView()
    
    var trainServices:        [TrainService]        = []
    var highSpeedRailInfos:   [HighSpeedRailInfo]   = []
    var highSpeedRailOptions: [HighSpeedRailOption] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar ()
        setTableView       ()
        fetchAllTheData    ()
        
        self.view.backgroundColor = Colors.brightGray
        
        print("trainServices is \(trainServices.count)")
        print("highSpeedRailInfos is \(highSpeedRailInfos.count)")
        print("highSpeedRailOptions is \(highSpeedRailOptions.count)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let totalHeight = highSpeedRailOptionTableView.frame.height + trainServiceTableView.frame.height + highSpeedRailInfoTableView.frame.height
        scrollView.contentSize = CGSize(width: view.frame.width, height: totalHeight)
    }
    
    func fetchAllTheData () {
        trainServices        = fetchTrainServiceData()
        highSpeedRailInfos   = fetchHighSpeedRailInfoData()
        highSpeedRailOptions = fetchHighSpeedRailOptionData()
    }
    
    func setupNavigationBar () {
        // Set up titleText color in appearance.
        let navigationBarAppearance                 = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor     = Colors.navigationBarColor
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: Colors.white]
        self.navigationItem.scrollEdgeAppearance    = navigationBarAppearance
               
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
        print("speakerBarButtonTapped")
    }
    
    @objc func accountBarButtonTapped () {
        print("accountBarButtonTapped")
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
        highSpeedRailInfoTableView.isScrollEnabled  = false
        highSpeedRailOptionTableView.isScrollEnabled = false
        
        // rowHeight
        trainServiceTableView.rowHeight        = 55
        highSpeedRailInfoTableView.rowHeight  = 55
        highSpeedRailOptionTableView.rowHeight = 55
        
        // separatorStyle
        trainServiceTableView.separatorStyle        = .singleLine
        highSpeedRailInfoTableView.separatorStyle   = .singleLine
        highSpeedRailOptionTableView.separatorStyle = .singleLine
        
        // backgroundColor
        trainServiceTableView.backgroundColor        = Colors.black
        highSpeedRailInfoTableView.backgroundColor   = Colors.black
        highSpeedRailOptionTableView.backgroundColor = Colors.white
        
        // register
        trainServiceTableView.register(       MoreTableViewCell.nib(), forCellReuseIdentifier: MoreTableViewCell.identifier)
        highSpeedRailInfoTableView.register(  MoreTableViewCell.nib(), forCellReuseIdentifier: MoreTableViewCell.identifier)
        highSpeedRailOptionTableView.register(MoreTableViewCell.nib(), forCellReuseIdentifier: MoreTableViewCell.identifier)
    }
    
    func constraintsTableView () {
        view.addSubview(scrollView)
        scrollView.addSubview(highSpeedRailOptionTableView)
        scrollView.addSubview(trainServiceTableView)
        scrollView.addSubview(highSpeedRailInfoTableView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            highSpeedRailOptionTableView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            highSpeedRailOptionTableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            highSpeedRailOptionTableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            highSpeedRailOptionTableView.heightAnchor.constraint(equalToConstant: 165)
        ])
        
        NSLayoutConstraint.activate([
            trainServiceTableView.topAnchor.constraint(equalTo: highSpeedRailOptionTableView.bottomAnchor, constant: 20),
            trainServiceTableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            trainServiceTableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            trainServiceTableView.heightAnchor.constraint(equalToConstant: 165)
        ])
        
        NSLayoutConstraint.activate([
            highSpeedRailInfoTableView.topAnchor.constraint(equalTo: trainServiceTableView.bottomAnchor, constant: 20),
            highSpeedRailInfoTableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            highSpeedRailInfoTableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            highSpeedRailInfoTableView.heightAnchor.constraint(equalToConstant: 330),
            highSpeedRailInfoTableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
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
            image:  Images.checkmark,
            title: "前往台灣高鐵App",
            url:   "https://apps.apple.com/tw/app/%E5%8F%B0%E7%81%A3%E9%AB%98%E9%90%B5/id1266626655?l=en-GB")
        let highSpeedRailInfoFive = HighSpeedRailInfo(
            image:  Images.checkmark,
            title: "前往高鐵 TLife 網站",
            url:   "https://tlife.thsrc.com.tw/tw")
        let highSpeedRailInfoSix = HighSpeedRailInfo(
            image:  Images.checkmark,
            title: "高鐵運輸服務碳足跡",
            url:   "https://www.thsrc.com.tw/t/carbonFootprint#stations")
        return [highSpeedRailInfoOne, highSpeedRailInfoTwo, highSpeedRailInfoThree, highSpeedRailInfoFour, highSpeedRailInfoFive, highSpeedRailInfoSix]
    }
}

extension MoreTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        tableView.deselectRow(at: indexPath, animated: true)
        print("DeselectRow is\(indexPath)")

            let safariServiceVC = SFSafariViewController(url: URL(fileURLWithPath: ""))
            present(safariServiceVC, animated: true)
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

