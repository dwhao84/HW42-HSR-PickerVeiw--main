//
//  UIView+Ext.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/1/3.
//

import UIKit

extension UIView {
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
//        layer.shouldRasterize = false
//        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
