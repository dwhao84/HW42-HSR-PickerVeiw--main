//
//  UIView+Ext.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/1/3.
//

import UIKit
import QuartzCore

extension UIView {
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset  = .zero
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
    }

    func dropBottomShadow() {
        layer.masksToBounds = false
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset  = .zero
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    
    func dropSecondShadow() {
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 500, height: 500))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]

        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 1.0
        view.layer.shadowRadius = 4
        //view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.shouldRasterize = false


        let outter = UIView(frame: CGRect(x: 0, y: 0, width: 700, height: 700))
        outter.backgroundColor = UIColor.red
        outter.addSubview(view)
    }
    
    func roundCorner(corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
}
