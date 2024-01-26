//
//  MoreTableViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/1/26.
//

import UIKit
import SafariServices

class MoreTableViewController: UIViewController {
    
    let trainServiceTableView:        UITableView  = UITableView()
    let hightSpeedRailInfoTableView:  UITableView  = UITableView()
    let highSpeedRailOptionTableView: UITableView  = UITableView()
    
    var trainServices:        [TrainService]        = []
    var highSpeedRailInfos:   [HighSpeedRailInfo]   = []
    var highSpeedRailOptions: [HighSpeedRailOption] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar ()
        fetchAllTheData    ()
        
        self.view.backgroundColor = Colors.brightGray
        

        
    }
    
    func fetchAllTheData () {
        trainServices        = fetchTrainServiceData()
        highSpeedRailInfos  = fetchHighSpeedRailInfoData()
        highSpeedRailOptions = fetchHighSpeedRailOptionData()
    }
    
    func setupNavigationBar () {
        // Set up titleText color in appearance.
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = Colors.navigationBarColor
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationItem.scrollEdgeAppearance = navigationBarAppearance
               
        // Set up titleView
        let hsrImageView = UIImageView(image: Images.hsrImage)
        self.navigationController?.isNavigationBarHidden      = false
        self.navigationItem.titleView?.tintColor = .white
        self.navigationItem.titleView = hsrImageView
        
        // Set up UIBarButtonItem
        let speakerBarButton: UIBarButtonItem = UIBarButtonItem(image: Images.speakerWave, style: .plain, target: self, action: #selector(speakerBarButtonTapped))
        let accountBarButton: UIBarButtonItem = UIBarButtonItem(image: Images.personCircle, style: .plain, target: self, action: #selector(accountBarButtonTapped))
        let fixedSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        
        // Set up UIBarButtonItem's tintColor
        speakerBarButton.tintColor = Colors.white
        accountBarButton.tintColor = Colors.white
        
        // Set up navigationItem's rightBarButton
        self.navigationItem.rightBarButtonItems = [accountBarButton, fixedSpace, speakerBarButton]
    }
    
    @objc func speakerBarButtonTapped () {
        
    }
    
    @objc func accountBarButtonTapped () {
        
    }
    
    func setTableViewDelegate () {
        trainServiceTableView.delegate   = self
        trainServiceTableView.dataSource = self
        
        hightSpeedRailInfoTableView.delegate   = self
        hightSpeedRailInfoTableView.dataSource = self
        
        highSpeedRailOptionTableView.delegate = self
        highSpeedRailOptionTableView.dataSource = self
    }
    
    func setupFirstTableView () {
        
    }
    
    func setupSecondTableView () {
        
    }
    
    func setupThirdTableView () {
        
    }
}

extension MoreTableViewController {
    func fetchTrainServiceData () -> [TrainService] {
        let trainServiceOne = TrainService(image: Images.docPlain, title: "交易注意事項", url:   "")
        let trainServiceTwo = TrainService(image: Images.doc,      title: "旅客運送契約", url:   "https://www.thsrc.com.tw/event/regulations/ThsrcPassengerTransportationContract.pdf")
        let trainServiceThree = TrainService(image: Images.infomation, title: "使用導覽", url:   "")
        return [trainServiceOne, trainServiceTwo, trainServiceThree]
    }
    
    func fetchHighSpeedRailOptionData () -> [HighSpeedRailOption] {
        let highSpeedRailOptionOne =   HighSpeedRailOption(image: Images.clock,           title: "高鐵時刻表")
        let highSpeedRailOptionTwo =   HighSpeedRailOption(image: Images.dollarSign,      title: "票價資訊")
        let highSpeedRailOptionThree = HighSpeedRailOption(image: Images.magnifyingglass, title: "查詢訂位代號")
        return [highSpeedRailOptionOne, highSpeedRailOptionTwo, highSpeedRailOptionThree]
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == trainServiceTableView {
            
        } else if tableView == hightSpeedRailInfoTableView {
            
        } else if tableView == highSpeedRailOptionTableView {
            
        } else {
            
        }
    }
}

extension MoreTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == trainServiceTableView {
            
        } else if tableView == hightSpeedRailInfoTableView {
            
        } else if tableView == highSpeedRailOptionTableView {
            
        } else {
            
        }
        return UITableViewCell ()
    }
}


#Preview {
    UINavigationController(rootViewController: MoreTableViewController())
}

