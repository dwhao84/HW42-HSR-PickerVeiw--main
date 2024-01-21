//
//  Account+Model.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/1/17.
//

import UIKit

// Create date struct for accountVC's infoTableView.
struct AccountCenter {
    let image: String
    let title: String
}

let accountCenterInfo = [
    AccountCenter(image: "person.circle", title: "個人資料設定"),
    AccountCenter(image: "person.2.fill", title: "常用乘客名單"),
    AccountCenter(image: "checkmark.circle", title: "常用訂位行程"),
    AccountCenter(image: "list.bullet.rectangle", title: "交易歷史紀錄"),
    AccountCenter(image: "folder", title: "票券整理")
]

// Create data struct for accountVC's infoSecTableView.
struct AccountCenterSec {
    let image: String
    let title: String
}

let accountCenterSecInfo = [
    AccountCenterSec(image: "slider.horizontal.3", title: "提醒設定"),
    AccountCenterSec(image: "globe.europe.africa.fill", title: "語言"),
    AccountCenterSec(image: "bell", title: "推播通知"),
    AccountCenterSec(image: "speaker.wave.2.bubble", title: "Siri 捷徑")
]

enum AccountCenterImage {
    static let imageOne: UIImage = UIImage(systemName: "Color")!
}
