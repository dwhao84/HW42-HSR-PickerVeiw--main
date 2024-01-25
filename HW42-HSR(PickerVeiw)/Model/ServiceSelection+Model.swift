//
//  File.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/1/1.
//

import UIKit

// Create a current time, and return the string value.
func getCurrentTime () -> String {
    let calendar = Calendar.current                             // Get the information from calendar.
    let currentTime = calendar.component(.minute, from: Date()) // Get the current time by minute and from now date.
    let addFiveMins = (5 - currentTime % 5)                     // Use the 5mins as unit, and calculate time from 5mins to minus currentTime.
    let date = calendar.date(byAdding: .minute, value: addFiveMins, to: Date()) // Append time different to set up as 5mins as uint.
    
    let dateFormatter        = DateFormatter()
    dateFormatter.calendar   = Calendar(identifier: .iso8601)
    dateFormatter.locale     = Locale(identifier: "zh-TW")         // Set up local time as "zh-TW"
    dateFormatter.timeZone   = .current                            // Get the current timeZone.
    dateFormatter.dateFormat = "yyyy/MM/dd(EEEE)HH:mm"             // Set up dateFormat for date.
    let selectedTime = dateFormatter.string(from: date!)           // Format the date by using dateFormatter.string to a string.
    let filteredSelectedTime = selectedTime.replacingOccurrences(of: "星期", with: "")
    
    return filteredSelectedTime
}

struct ServiceSelection {
    let service:         String
    let subtitleService: String
    let serviceIcon:     UIImage?
}

let servicesData: [ServiceSelection] = [
    ServiceSelection(service: "去程時間", subtitleService: getCurrentTime(), serviceIcon:  UIImage(systemName: "calendar")),
    ServiceSelection(service: "車廂種類", subtitleService: "標準車廂",         serviceIcon:  UIImage(systemName: "tram.fill")),
    ServiceSelection(service: "乘客人數", subtitleService: "全票*1",          serviceIcon:  UIImage(systemName: "person.2.fill")),
    ServiceSelection(service: "座位偏好", subtitleService: "無偏好",           serviceIcon: UIImage(systemName: "carseat.right"))
 ]
