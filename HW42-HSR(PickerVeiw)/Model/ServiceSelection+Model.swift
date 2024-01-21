//
//  File.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/1/1.
//

import UIKit

struct ServiceSelection {
    let service:         String
    let subtitleService: String
    let serviceIcon:     UIImage?
}

func getCurrentTime () -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd/ HH:mm"
//    dateFormatter.dateStyle  = .short
    
    let currentDateAndTime = Date()
    let currentTime = dateFormatter.string(from: currentDateAndTime)
    
    return currentTime
}

let servicesData: [ServiceSelection] = [
    ServiceSelection(service: "去程時間", subtitleService: getCurrentTime(),   serviceIcon:   UIImage(systemName: "calendar")),
    ServiceSelection(service: "車廂種類", subtitleService: "標準車廂", serviceIcon: UIImage(systemName: "tram.fill")),
    ServiceSelection(service: "乘客人數", subtitleService: "全票*1",  serviceIcon:  UIImage(systemName: "person.2.fill")),
    ServiceSelection(service: "座位偏好", subtitleService: "無偏好",  serviceIcon:  UIImage(systemName: "carseat.right"))
]
