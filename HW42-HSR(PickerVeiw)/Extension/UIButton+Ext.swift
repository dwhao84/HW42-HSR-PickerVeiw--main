//
//  UIButton+Ext.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/1/25.
//

import UIKit
// When the Button tapped, the backgroundColor will changed.
// https://stackoverflow.com/a/44325883
extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
    let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
    UIGraphicsBeginImageContext(rect.size)
    color.setFill()
    UIRectFill(rect)
    let colorImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    setBackgroundImage(colorImage, for: state)
  }
   func addButtonBottomBorder() {
       let frame = CGRect(x: 0, y: 45, width: 300, height: 2)
       let borderBottom = UIView(frame: frame)
       borderBottom.backgroundColor = Colors.black
       self.addSubview(borderBottom)
  }
}
