//
//  NonReservedView.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/1/31.
//

import UIKit

class NonReservedView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI () {
        
    }
    
    

}

#Preview(traits: .fixedLayout(width: 390, height: 230), body: {
    let nonReservedView = NonReservedView()
    return nonReservedView
   })
