//
//  CreditCardOfferView.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/2/18.
//

import UIKit

class CreditCardOfferView: UIView {

    // MARK: - UILabel:
    /// 輸入信用卡號前8碼
    let descriptionForCreditCardLabel: UILabel = UILabel()
    
    // MARK: - UITextField:
    
    
    
    // MARK: - UITextView:
    
    
    
    // MARK: - UIButton:
    /// 登入查詢
    let loginButton: UIButton       = UIButton(type: .system)
    /// 查看商務升等/標準車廂對號座優惠
    let trainOffersButton: UIButton = UIButton(type: .system)
    
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    
    // MARK: - Beginning of code snippet
    func setupUI ()  {
        self.backgroundColor = Colors.white
        
        /// Call Function
        configureDescriptionForCreditCardLabel ()
        
    }


    // MARK: - Configure UILabel:
    /// 輸入信用卡號前8碼
    func configureDescriptionForCreditCardLabel () {
        descriptionForCreditCardLabel.text = "輸入信用卡號前8碼"
    }
    
    // MARK: - Configure UITextField:
    
    
    
    // MARK: - Configure UITextView:
    
    
    
    
    // MARK: - Configure UIButton:
    /// 登入查詢
    func configureLoginButton () {
        loginButton.setTitle("登入查詢", for: .normal)
    }
    
    /// 查看商務升等/標準車廂對號座優惠
    func configureTrainOffersButton () {
        trainOffersButton.setTitle("查看商務升等/標準車廂對號座優惠", for: .normal)
    }
    
    
    
}

// MARK: - Preview for CreditCardView.
#Preview(traits: .fixedLayout(width: 390, height: 545), body: {
    let creditCardOfferView = CreditCardOfferView()
    return creditCardOfferView
   })
