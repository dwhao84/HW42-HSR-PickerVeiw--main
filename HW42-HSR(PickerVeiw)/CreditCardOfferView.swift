//
//  CreditCardOfferView.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/2/18.
//

import UIKit
import SafariServices

class CreditCardOfferView: UIView {

    // MARK: - UILabel:
    /// 輸入信用卡號前8碼
    let descriptionTitleLabel: UILabel = UILabel()
    let hiddenCardNumberLabel: UILabel         = UILabel() /// XXXX
    let secondHiddenCardNumberLabel: UILabel   = UILabel() /// XXXX
   
    let dashLineLabel: UILabel                 = UILabel() /// -
    let dashLineTwoLabel: UILabel              = UILabel() /// -
    let dashLineThreeLabel: UILabel            = UILabel() /// -
    
    let noticeTitleLabel: UILabel                = UILabel()
    
    // MARK: - UITextField:
    var initialCardNumberTextField: UITextField = UITextField() /// ____ --
    var midCardNumberTextField: UITextField     = UITextField() /// ____ --
    
    // MARK: - UIView:
//    let policyView: UIView = UIView()
    
    // MARK: - UIButton:
    let loginButton: UIButton                  = UIButton(type: .system) /// 登入查詢
    let trainOffersButton: UIButton            = UIButton(type: .system) /// 查看商務升等/標準車廂對號座優惠
    var rectangleButton: UIButton              = UIButton(type: .system) /// rectangleButton
    var informationImageView: UIImageView      = UIImageView()           /// information icon
    ///
    // MARK: UIStackView:
    let creditCardNumberStackView: UIStackView = UIStackView() // beginningPartCardNumberTextField & middlePartCardNumberTextField & dashLineLabel
    let middleSectionStackView: UIStackView    = UIStackView() // rectangleButton &
    let searchSectionStackView: UIStackView    = UIStackView() // loginButton
    let seatsBonusInfoStackView: UIStackView   = UIStackView() // informationImageView &
    
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
        
        // Set up UILabel
        configureDescriptionTitleLabel ()
        configureNoticeLabel           ()
        
        configureBeginningPartCardNumberTextField ()
        configureDashLineLabel()
        configureMiddlePartCardNumberTextField    ()
        configureDashLineTwoLabel()
        configureHiddenCardNumberLabel()
        configureDashLineThreeLabel()
        configureSecHiddenCardNumberLabel()
        
        // Set up UIButton
        configureLoginButton       ()
        configureTrainOffersButton ()
        configureRectangleButton   ()
        
        configureInfoImageView ()
        
        configureStackView()
        configureSeatsBonusInfoStackView ()
        configureSearchSectionStackView  ()
    }


    // MARK: - Configure UILabel:
    /// 輸入信用卡號前8碼
    func configureDescriptionTitleLabel () {
        descriptionTitleLabel.text      = "輸入信用卡號前8碼"
        descriptionTitleLabel.textColor = Colors.lightGray
        descriptionTitleLabel.font      = UIFont.boldSystemFont(ofSize: 15)
        descriptionTitleLabel.frame     = CGRect(x: 25, y: 15, width: 140, height: 20)
//        descriptionTitleLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
//        descriptionTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.addSubview(descriptionTitleLabel)
    }
    
    func configureDashLineLabel () {
        dashLineLabel.text      = "-"
        dashLineLabel.textColor = Colors.lightGray
        dashLineLabel.font      = UIFont.systemFont(ofSize: 30)
        self.addSubview(dashLineLabel)
    }
    
    func configureDashLineTwoLabel () {
        dashLineTwoLabel.text      = "-"
        dashLineTwoLabel.textColor = Colors.lightGray
        dashLineTwoLabel.font      = UIFont.systemFont(ofSize: 30)
        self.addSubview(dashLineTwoLabel)
    }
    
    func configureDashLineThreeLabel () {
        dashLineThreeLabel.text      = "-"
        dashLineThreeLabel.textColor = Colors.lightGray
        dashLineThreeLabel.font      = UIFont.systemFont(ofSize: 30)
        self.addSubview(dashLineThreeLabel)
    }
    
    func configureHiddenCardNumberLabel () {
        hiddenCardNumberLabel.text      = "XXXX"
        hiddenCardNumberLabel.textColor = Colors.darkGray
        hiddenCardNumberLabel.font      = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(hiddenCardNumberLabel)
    }
    
    func configureSecHiddenCardNumberLabel () {
        secondHiddenCardNumberLabel.text      = "XXXX"
        secondHiddenCardNumberLabel.textColor = Colors.darkGray
        secondHiddenCardNumberLabel.font      = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(secondHiddenCardNumberLabel)
    }
    
    func configureNoticeLabel () {
        noticeTitleLabel.text      = "注意事項"
        noticeTitleLabel.textColor = Colors.black
        noticeTitleLabel.font      = UIFont.systemFont(ofSize: 15)
        noticeTitleLabel.frame     = CGRect(x: 25, y: 95, width: 140, height: 20)
        //        noticeTitleLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
        //        noticeTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.addSubview(noticeTitleLabel)
    }

    // MARK: - Configure UITextField:
    func configureBeginningPartCardNumberTextField () {
        initialCardNumberTextField.frame       = CGRect(x: 25, y: 42, width: 70, height: 30)
        initialCardNumberTextField.textColor   = Colors.black
        initialCardNumberTextField.font        = UIFont.systemFont(ofSize: 17)
        initialCardNumberTextField.delegate    = self
        initialCardNumberTextField.borderStyle = .none
        initialCardNumberTextField.addBottomBorder()
        self.addSubview(initialCardNumberTextField)
    }
    
    func configureMiddlePartCardNumberTextField () {
        midCardNumberTextField.frame       = CGRect(x: 110, y: 42, width: 70, height: 30)
        midCardNumberTextField.borderStyle = .roundedRect
        midCardNumberTextField.textColor   = Colors.black
        midCardNumberTextField.font        = UIFont.systemFont(ofSize: 17)
        midCardNumberTextField.delegate    = self
        midCardNumberTextField.borderStyle = .none
        midCardNumberTextField.addBottomBorder()
        self.addSubview(midCardNumberTextField)
    }
    
    
    // MARK: - Configure UITextView:
    /// Width: 340 Height: 400
    
    // MARK: - Configure UIButton:
    // 登入查詢
    func configureLoginButton () {
        var title                  = AttributedString("登入查詢")
        title.font                 = UIFont.boldSystemFont(ofSize: 17)
        var config                 = UIButton.Configuration.filled()
        config.baseBackgroundColor = Colors.orange
        config.baseForegroundColor = Colors.white
        config.attributedTitle     = title
        config.cornerStyle         = .small
        
        loginButton.configuration = config
        loginButton.frame = CGRect(x: 25, y: 455, width: 340, height: 45)
        self.addSubview(loginButton)
    }
    
    // Rectangle Button
    func configureRectangleButton () {
        var config                    = UIButton.Configuration.plain()
        config.baseForegroundColor    = Colors.systemGray2
        config.image                  = Images.rectangleImage
        config.imagePlacement         = .leading
        rectangleButton.configuration = config
        rectangleButton.frame         = CGRect(x: 28, y: 410, width: 20, height: 20)
        self.addSubview(rectangleButton)
        
//        rectangleButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
//        rectangleButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    // 查看商務升等/標準車廂對號座優惠
    func configureTrainOffersButton () {
        var title                  = AttributedString("查看商務升等/標準車廂對號座優惠")
        title.font                 = UIFont.boldSystemFont(ofSize: 15)
        var config                 = UIButton.Configuration.plain()
        config.baseForegroundColor = Colors.systemGray2
        config.baseBackgroundColor = Colors.green
        config.attributedTitle     = title
        trainOffersButton.configuration = config
        trainOffersButton.isUserInteractionEnabled = true
        self.addSubview(trainOffersButton)
    }
    
    // MARK: - UIImageView:
    func configureInfoImageView () {
        informationImageView.image       = Images.infomation
        informationImageView.tintColor   = Colors.systemGray2
        informationImageView.contentMode = .scaleAspectFill
        self.addSubview(informationImageView)
    }
    
    // MARK: - UIStackView:
    func configureStackView () {
        creditCardNumberStackView.axis         = .horizontal
        creditCardNumberStackView.distribution = .fill
        creditCardNumberStackView.alignment    = .center
        creditCardNumberStackView.spacing      = 7
        creditCardNumberStackView.addArrangedSubview(initialCardNumberTextField)
        creditCardNumberStackView.addArrangedSubview(dashLineLabel)
        creditCardNumberStackView.addArrangedSubview(midCardNumberTextField)
        creditCardNumberStackView.addArrangedSubview(dashLineTwoLabel)
        creditCardNumberStackView.addArrangedSubview(hiddenCardNumberLabel)
        creditCardNumberStackView.addArrangedSubview(dashLineThreeLabel)
        creditCardNumberStackView.addArrangedSubview(secondHiddenCardNumberLabel)
        
        creditCardNumberStackView.frame = CGRect(x: 25, y: 50, width: 330, height: 30)
        
        self.addSubview(creditCardNumberStackView)
         
        initialCardNumberTextField.widthAnchor.constraint(equalToConstant: 70).isActive   = true
        initialCardNumberTextField.heightAnchor.constraint(equalToConstant: 30).isActive  = true
        
        dashLineLabel.widthAnchor.constraint(equalToConstant: 10).isActive               = true
        dashLineLabel.heightAnchor.constraint(equalToConstant: 20).isActive              = true
        
        midCardNumberTextField.widthAnchor.constraint(equalToConstant: 70).isActive       = true
        midCardNumberTextField.heightAnchor.constraint(equalToConstant: 30).isActive      = true
        
        dashLineTwoLabel.widthAnchor.constraint(equalToConstant: 10).isActive            = true
        dashLineTwoLabel.heightAnchor.constraint(equalToConstant: 20).isActive           = true
        
        hiddenCardNumberLabel.widthAnchor.constraint(equalToConstant: 60).isActive       = true
        hiddenCardNumberLabel.heightAnchor.constraint(equalToConstant: 20).isActive       = true
        
        dashLineThreeLabel.widthAnchor.constraint(equalToConstant: 10).isActive          = true
        dashLineThreeLabel.heightAnchor.constraint(equalToConstant: 20).isActive         = true
        
        secondHiddenCardNumberLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        secondHiddenCardNumberLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func configureSecondStackView () {
        
    }
    
    func configureSeatsBonusInfoStackView () {
        seatsBonusInfoStackView.axis         = .horizontal
        seatsBonusInfoStackView.distribution = .fill
        seatsBonusInfoStackView.alignment    = .center
        seatsBonusInfoStackView.spacing      = .zero
        seatsBonusInfoStackView.addArrangedSubview(informationImageView)
        seatsBonusInfoStackView.addArrangedSubview(trainOffersButton)
        
        informationImageView.widthAnchor.constraint(equalToConstant: 10).isActive  = true
        
        trainOffersButton.widthAnchor.constraint(equalToConstant: 260).isActive = true
        trainOffersButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    func configureSearchSectionStackView () {
        searchSectionStackView.axis         = .vertical
        searchSectionStackView.distribution = .fill
        searchSectionStackView.alignment    = .leading
        searchSectionStackView.spacing      = 2
        searchSectionStackView.addArrangedSubview(loginButton)
        searchSectionStackView.addArrangedSubview(seatsBonusInfoStackView)
        self.addSubview(searchSectionStackView)
        
        searchSectionStackView.frame        = CGRect(x: 25, y: 300, width: 300, height: 80)
        
        loginButton.widthAnchor.constraint(equalToConstant: 340).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    
}

extension CreditCardOfferView: UITextFieldDelegate {
    
}

// MARK: - Preview for CreditCardView.
#Preview(traits: .fixedLayout(width: 390, height: 545), body: {
    let creditCardOfferView = CreditCardOfferView()
    return creditCardOfferView
   })


//        優惠車票依各發卡銀行規定須扣抵紅利點數、哩程數；如點數不足或不符優惠資格者，各發卡行將收取加價費用或票價差額，訂票前請務必詳閱各銀行規則。
//        如您持有的美國運通卡有參與本活動，請持卡至各車站售票窗口購買。
//        欲使用商務升等優惠者，如搭乘區間較短或為敬老、愛心及孩童票，可能發生扣抵紅利或支付加價金額後，升等票價高於原價之情況，購票前敬請先行評估。
//        本活動專區恕無法與其他優惠享重複折扣；欲購買早烏優惠者，請使用「一般訂票」功能預訂。
