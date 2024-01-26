//
//  MoreTableView+Model.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/1/26.
//

import Foundation
import UIKit

// High Speed Rail Option
struct HighSpeedRailOption {
    var image : UIImage
    let title: String
}

let highSpeedRailOptionArray = [
    HighSpeedRailOption(
        image:  Images.clock,
        title: "高鐵時刻表"),
    HighSpeedRailOption(
        image:  Images.dollarSign,
        title: "票價資訊"),
    HighSpeedRailOption(
        image:  Images.magnifyingglass,
        title: "查詢訂位代號")
]

// Train Service
struct TrainService {
    var image : UIImage
    let title: String
    let url  : String
}

// High Speed Rail Information
struct HighSpeedRailInfo {
    var image : UIImage
    let title: String
    let url  : String
}

let highSpeedRailInfoArray = [
    HighSpeedRailInfo(
        image:  Images.questionMark,
        title: "關於 T Express",
        url:   "https://www.thsrc.com.tw/ArticleContent/4d262503-84bc-4963-a58e-4ca1a6453ad3"),
    HighSpeedRailInfo(
        image:  Images.wheelChair,
        title: "無障礙服務",
        url:   "https://www.thsrc.com.tw/ArticleContent/dba4ecd0-5ef0-45d2-aa64-bcecdf7d5fde?breadcrumbs=17b156fd-3e99-4d48-a63f-6dbc77823af3"),
    HighSpeedRailInfo(
        image:  Images.arrowForward,
        title: "前往高鐵網站",
        url:   "https://www.thsrc.com.tw"),
    HighSpeedRailInfo(
        image:  Images.checkmark,
        title: "前往台灣高鐵App",
        url:   "https://apps.apple.com/tw/app/%E5%8F%B0%E7%81%A3%E9%AB%98%E9%90%B5/id1266626655?l=en-GB"),
    HighSpeedRailInfo(
        image:  Images.checkmark,
        title: "前往高鐵 TLife 網站",
        url:   "https://tlife.thsrc.com.tw/tw"),
    HighSpeedRailInfo(
        image:  Images.checkmark,
        title: "高鐵運輸服務碳足跡",
        url:   "https://www.thsrc.com.tw/t/carbonFootprint#stations")
]

