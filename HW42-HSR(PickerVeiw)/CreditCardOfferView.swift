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
    
    // MARK: - UITextField:
    var initialCardNumberTextField: UITextField = UITextField() /// ____ --
    var midCardNumberTextField: UITextField     = UITextField() /// ____ --
    
    // MARK: - UIView:
    let informationTextView: UITextView = UITextView()
    let policyTextView: UITextView = UITextView() // 我已閱讀商務升等優惠規則/標準車廂優惠規則並且同意遵守所有規定

    // MARK: - UIButton:
    let loginButton: UIButton                  = UIButton(type: .system) /// 登入查詢
    let trainOffersButton: UIButton            = UIButton(type: .system) /// 查看商務升等/標準車廂對號座優惠
    let squareButton: UIButton                 = UIButton(type: .system) /// squareButton

    // MARK: - UIImageView
    var informationImageView: UIImageView      = UIImageView()           /// information icon

    // MARK: UIStackView:
    let creditCardNumberStackView: UIStackView = UIStackView() // beginningPartCardNumberTextField & middlePartCardNumberTextField & dashLineLabel
    let policyStackView: UIStackView           = UIStackView() // squareButton & policyTextView
    let searchSectionStackView: UIStackView    = UIStackView() // loginButton
    let seatsBonusInfoStackView: UIStackView   = UIStackView() // informationImageView & trainOffersButton
    
    let enterTextFieldStackView: UIStackView   = UIStackView() // descriptionTitleLabel & creditCardNumberStackView.
    
    let creditCardOfferStackView: UIStackView  = UIStackView() // Combine all.
    
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
        
        // UILabel
        configureDescriptionTitleLabel ()
        
        // UITextField & UILabel
        configureBeginningPartCardNumberTextField ()
        configureDashLineLabel                    ()
        configureMiddlePartCardNumberTextField    ()
        configureDashLineTwoLabel                 ()
        configureHiddenCardNumberLabel            ()
        configureDashLineThreeLabel               ()
        configureSecHiddenCardNumberLabel         ()
        
        // UIButton
        configureLoginButton        ()
        configureTrainOffersButton  ()
        configureSquareButton       ()
        configurePolicyTextView     ()
        configureInfomationTextView ()
        
        // UIImageView
        configureInfoImageView     ()
        
        // UIStackView
        configureCardNumberStackView     ()
        configureSeatsBonusInfoStackView ()
        configureSearchSectionStackView  ()
        configurePolicyStackView         ()
        
        configureEnterSTextFieldtackView ()
        
        configureCreditCardStackView()
    }


    // MARK: - Configure UILabel:
    /// 輸入信用卡號前8碼
    func configureDescriptionTitleLabel () {
        descriptionTitleLabel.text      = "輸入信用卡號前8碼"
        descriptionTitleLabel.textColor = Colors.lightGray
        descriptionTitleLabel.font      = UIFont.boldSystemFont(ofSize: 15)
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
    
    // MARK: - Configure UITextField:
    func configureBeginningPartCardNumberTextField () {
        initialCardNumberTextField.frame        = CGRect(x: 0, y: 0, width: 70, height: 30)
        initialCardNumberTextField.borderStyle  = .none
        initialCardNumberTextField.textColor    = Colors.black
        initialCardNumberTextField.font         = UIFont.systemFont(ofSize: 17)
        initialCardNumberTextField.delegate     = self
        initialCardNumberTextField.keyboardType = .numberPad
        initialCardNumberTextField.addBottomBorder()
        self.addSubview(initialCardNumberTextField)
    }
    
    func configureMiddlePartCardNumberTextField () {
        midCardNumberTextField.frame        = CGRect(x: 0, y: 0, width: 70, height: 30)
        midCardNumberTextField.borderStyle  = .none
        midCardNumberTextField.textColor    = Colors.black
        midCardNumberTextField.font         = UIFont.systemFont(ofSize: 17)
        midCardNumberTextField.delegate     = self
        midCardNumberTextField.keyboardType = .numberPad
        midCardNumberTextField.addBottomBorder()
        self.addSubview(midCardNumberTextField)
    }
    
    
    // MARK: - Configure UITextView:
    // Width: 340 Height: 400
    func configureInfomationTextView () {
        /*
        * 本系統僅檢核您持有之信用卡是否參與本專案。
        * 優惠車票依各發卡銀行規定須扣抵紅利點數、哩程數；如點數不足或不符優惠資格者，各發卡行將收取加價費用或票價差額，訂票前請務必詳閱各銀行規則。
        * 如您持有的美國運通卡有參與本活動，請持卡至各車站售票窗口購買。
        * 欲使用商務升等優惠者，如搭乘區間較短或為敬老、愛心及孩童票，可能發生扣抵紅利或支付加價金額後，升等票價高於原價之情況，購票前敬請先行評估。
        * 本活動專區恕無法與其他優惠享重複折扣；欲購買早烏優惠者，請使用「一般訂票」功能預訂。
         */
        
        // 確認一下有沒有分行的寫法
        informationTextView.text = "注意事項\n\n* 本系統僅檢核您持有之信用卡是否參與本專案。\n\n* 優惠車票依各發卡銀行規定須扣抵紅利點數、哩程數；如點數不足或不符優惠資格者，各發卡行將收取加價費用或票價差額，訂票前請務必詳閱各銀行規則。\n\n* 如您持有的美國運通卡有參與本活動，請持卡至各車站售票窗口購買。\n\n* 欲使用商務升等優惠者，如搭乘區間較短或為敬老、愛心及孩童票，可能發生扣抵紅利或支付加價金額後，升等票價高於原價之情況，購票前敬請先行評估。\n\n* 本活動專區恕無法與其他優惠享重複折扣；欲購買早烏優惠者，請使用「一般訂票」功能預訂。"
        informationTextView.textColor       = Colors.darkGray
        informationTextView.backgroundColor = Colors.brightGray
        informationTextView.font            = UIFont.systemFont(ofSize: 15.5)
        informationTextView.textAlignment   = .left
        informationTextView.contentInset    = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
        self.addSubview(informationTextView)
    }

    func configurePolicyTextView () {
        policyTextView.backgroundColor   = Colors.clear
        policyTextView.isEditable        = false
        policyTextView.isScrollEnabled   = false
        policyTextView.dataDetectorTypes = .link
        
        let text     = "我已閱讀商務升等優惠規則/標準車廂優惠規則並且同意遵守所有規定"
        let linkText = "商務升等優惠規則/標準車廂優惠規則"

        // 創建富文本對象
        let attributedString = NSMutableAttributedString(string: text)

        // 為整個文本設置字體大小
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 17), range: NSRange(location: 0, length: text.count))

        // 為連結範圍設置字體顏色和下劃線
        if let linkRange = text.range(of: linkText) {
            let nsRange = NSRange(linkRange, in: text)
            attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: nsRange)
            // Add links.
            attributedString.addAttribute(.link, value: Links.creditCardOffer, range: nsRange)
            // 如果您還想改變連結的字體大小，可以再次使用以下代碼
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: nsRange)
        }
        
        // "商務升等優惠規則/標準車廂優惠規則" textColor adjustment with underline.
        policyTextView.linkTextAttributes = [
            .foregroundColor: Colors.orange,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        policyTextView.attributedText   = attributedString
        self.addSubview(policyTextView)
    }
        
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
        loginButton.configuration  = config
        self.addSubview(loginButton)
    }
    
    // squareButton
    func configureSquareButton () {
        var config                 = UIButton.Configuration.plain()
        config.baseForegroundColor = Colors.darkGray
        config.image               = Images.square
        config.imagePlacement      = .leading
        squareButton.configuration = config
        self.addSubview(squareButton)
    }
    
    // 查看商務升等/標準車廂對號座優惠
    func configureTrainOffersButton () {
        var title                       = AttributedString("查看商務升等/標準車廂對號座優惠")
        title.font                      = UIFont.boldSystemFont(ofSize: 15)
        var config                      = UIButton.Configuration.plain()
        config.baseForegroundColor      = Colors.systemGray2
        config.attributedTitle          = title
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
    func configureCardNumberStackView      () {
        initialCardNumberTextField.widthAnchor.constraint(equalToConstant: 70).isActive   = true
        initialCardNumberTextField.heightAnchor.constraint(equalToConstant: 30).isActive  = true
        dashLineLabel.widthAnchor.constraint(equalToConstant: 10).isActive                = true
        dashLineLabel.heightAnchor.constraint(equalToConstant: 20).isActive               = true
        midCardNumberTextField.widthAnchor.constraint(equalToConstant: 70).isActive       = true
        midCardNumberTextField.heightAnchor.constraint(equalToConstant: 30).isActive      = true
        dashLineTwoLabel.widthAnchor.constraint(equalToConstant: 10).isActive             = true
        dashLineTwoLabel.heightAnchor.constraint(equalToConstant: 20).isActive            = true
        hiddenCardNumberLabel.widthAnchor.constraint(equalToConstant: 60).isActive        = true
        hiddenCardNumberLabel.heightAnchor.constraint(equalToConstant: 20).isActive       = true
        dashLineThreeLabel.widthAnchor.constraint(equalToConstant: 10).isActive           = true
        dashLineThreeLabel.heightAnchor.constraint(equalToConstant: 20).isActive          = true
        secondHiddenCardNumberLabel.widthAnchor.constraint(equalToConstant: 60).isActive  = true
        secondHiddenCardNumberLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
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
        self.addSubview(creditCardNumberStackView)
    }
    
    func configurePolicyStackView () {
        squareButton.widthAnchor.constraint(equalToConstant: 25).isActive    = true
        squareButton.heightAnchor.constraint(equalToConstant: 25).isActive   = true
        policyTextView.widthAnchor.constraint(equalToConstant: 285).isActive = true
        policyTextView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        policyStackView.axis         = .horizontal
        policyStackView.distribution = .fill
        policyStackView.alignment    = .center
        policyStackView.spacing      = 20
        policyStackView.addArrangedSubview(squareButton)
        policyStackView.addArrangedSubview(policyTextView)
        
        self.addSubview(policyStackView)
    }
    
    func configureSeatsBonusInfoStackView () {
        informationImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        trainOffersButton.widthAnchor.constraint(equalToConstant: 60).isActive    = true
        trainOffersButton.heightAnchor.constraint(equalToConstant: 20).isActive   = true
        
        seatsBonusInfoStackView.axis         = .horizontal
        seatsBonusInfoStackView.distribution = .fill
        seatsBonusInfoStackView.alignment    = .center
        seatsBonusInfoStackView.spacing      = 0
        seatsBonusInfoStackView.addArrangedSubview(informationImageView)
        seatsBonusInfoStackView.addArrangedSubview(trainOffersButton)
    }
    
    func configureSearchSectionStackView () {
        searchSectionStackView.axis         = .vertical
        searchSectionStackView.distribution = .fill
        searchSectionStackView.alignment    = .leading
        searchSectionStackView.spacing      = 15
        searchSectionStackView.addArrangedSubview(loginButton)
        searchSectionStackView.addArrangedSubview(seatsBonusInfoStackView)
        self.addSubview(searchSectionStackView)
        
        loginButton.widthAnchor.constraint(equalToConstant: 340).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func configureEnterSTextFieldtackView () {
        descriptionTitleLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
        descriptionTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        enterTextFieldStackView.axis         = .vertical
        enterTextFieldStackView.distribution = .fill
        enterTextFieldStackView.alignment    = .leading
        enterTextFieldStackView.spacing      = 8
        
        enterTextFieldStackView.addArrangedSubview(descriptionTitleLabel)
        enterTextFieldStackView.addArrangedSubview(creditCardNumberStackView)
        
        self.addSubview(enterTextFieldStackView)
    }
    
    func configureCreditCardStackView () {
        
        descriptionTitleLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
        descriptionTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        informationTextView.widthAnchor.constraint(equalToConstant: 340).isActive  = true
        informationTextView.heightAnchor.constraint(equalToConstant: 410).isActive = true
        
        creditCardOfferStackView.axis         = .vertical
        creditCardOfferStackView.distribution = .fill
        creditCardOfferStackView.alignment    = .center
        creditCardOfferStackView.spacing      = 20
        
        creditCardOfferStackView.addArrangedSubview(enterTextFieldStackView)
        creditCardOfferStackView.addArrangedSubview(informationTextView)
        creditCardOfferStackView.addArrangedSubview(policyStackView)
        creditCardOfferStackView.addArrangedSubview(searchSectionStackView)
        creditCardOfferStackView.addArrangedSubview(seatsBonusInfoStackView)
        self.addSubview(creditCardOfferStackView)
        
        creditCardOfferStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            creditCardOfferStackView.topAnchor.constraint(equalTo:      self.topAnchor),
            creditCardOfferStackView.leadingAnchor.constraint(equalTo:  self.leadingAnchor),
            creditCardOfferStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            creditCardOfferStackView.bottomAnchor.constraint(equalTo:   self.bottomAnchor, constant: -5)
        ])
    }
    
    
    
}

extension CreditCardOfferView: UITextFieldDelegate {
    
}

// MARK: - Preview for CreditCardView.
#Preview(traits: .fixedLayout(width: 390, height: 690), body: {
    let creditCardOfferView = CreditCardOfferView()
    return creditCardOfferView
   })


//        優惠車票依各發卡銀行規定須扣抵紅利點數、哩程數；如點數不足或不符優惠資格者，各發卡行將收取加價費用或票價差額，訂票前請務必詳閱各銀行規則。
//        如您持有的美國運通卡有參與本活動，請持卡至各車站售票窗口購買。
//        欲使用商務升等優惠者，如搭乘區間較短或為敬老、愛心及孩童票，可能發生扣抵紅利或支付加價金額後，升等票價高於原價之情況，購票前敬請先行評估。
//        本活動專區恕無法與其他優惠享重複折扣；欲購買早烏優惠者，請使用「一般訂票」功能預訂。
