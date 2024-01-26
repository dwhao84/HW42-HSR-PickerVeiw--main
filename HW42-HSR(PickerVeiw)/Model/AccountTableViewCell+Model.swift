//
//  Account+Model.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/1/17.
//

import UIKit

// Create date struct for accountVC's infoTableView.
struct AccountCenter {
    let image: UIImage
    let title: String
}

let accountCenterInfo = [
    AccountCenter(image: Images.personCircle,  title: "個人資料設定"),
    AccountCenter(image: Images.personfill,    title: "常用乘客名單"),
    AccountCenter(image: Images.checkmark,     title: "常用訂位行程"),
    AccountCenter(image: Images.listBullet,    title: "交易歷史紀錄"),
    AccountCenter(image: Images.folder ,       title: "票券整理")
]

// Create data struct for accountVC's infoSecTableView.
struct AccountCenterSec {
    let image: UIImage
    let title: String
}

let accountCenterSecInfo = [
    AccountCenterSec(image: Images.horizontalSlider,  title: "提醒設定"),
    AccountCenterSec(image: Images.globeIcon,         title: "語言"),
    AccountCenterSec(image: Images.bell,              title: "推播通知"),
    AccountCenterSec(image: Images.speakerWaveBubble, title: "Siri 捷徑")
]

//enum AccountCenterImage {
//    static let imageOne: UIImage = UIImage(systemName: "Color")!
//}
