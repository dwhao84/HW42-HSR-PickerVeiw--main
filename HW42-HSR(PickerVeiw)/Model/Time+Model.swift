//
//  Time+Model.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/1/23.
//

import Foundation

func getCurrentHoursAndMins() -> (String, String) {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    dateFormatter.locale = .autoupdatingCurrent
    let currentTimeString = dateFormatter.string(from: Date())
    
    let timeComponents = currentTimeString.split(separator: ":")
    let hours = String(timeComponents[0])
    let mins = String(timeComponents[1])
    
    return (hours, mins)
}
