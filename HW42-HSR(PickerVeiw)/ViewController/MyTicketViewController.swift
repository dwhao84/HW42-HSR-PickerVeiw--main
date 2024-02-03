//
//  MyTicketViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/1/27.
//

import UIKit

class MyTicketViewController: UIViewController {

    let reservationNumberLabel: UILabel = UILabel()
    let quantityLabel: UILabel          = UILabel()
    
    // StatusView
    let trainStatusButton: UIButton = UIButton(type: .system)
    let statusView: UIView          = UIView()
    
    // To calculate the number of tickets a user has.
    var ticketsNumber: Int = 10
    var pageControlIndex: Int     = 0
    
    let pageControl: UIPageControl   = UIPageControl()
    let introductionLabel: UILabel   = UILabel()
    let forwardButton: UIButton      = UIButton(type: .system)
    let backwardButton: UIButton     = UIButton(type: .system)
    
    // horizontal stackView for forwardBtn & pageControl & backwardButton
    let bottomStackView: UIStackView      = UIStackView()
    // Vertical stackView for introductionLabel & bottomStackView.
    let bottomOnTopStackView: UIStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar         ()
        configureStatusButton      ()
        configureStatusView        ()
        configureIntroductionLabel ()
        configureForwardButton     ()
        configureBackwardButton    ()
        configurePageControl       ()
        constraintBottomStackView  ()
        addTarget                  ()
        self.view.backgroundColor = Colors.brightGray
    }
    
    func setupNavigationBar () {
        // Set up scrollEdgeAppearance
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = Colors.navigationBarColor
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: Colors.white]
        self.navigationItem.scrollEdgeAppearance = navigationBarAppearance
        
        // Set up standardAppearance
        let standardAppearance                                 = UINavigationBarAppearance()
        standardAppearance.backgroundColor                     = Colors.navigationBarColor
        self.navigationController?.navigationBar.standardAppearance = standardAppearance
        
        // Set up titleView
        let hsrImageView = UIImageView(image: Images.hsrImage)
        self.navigationController?.isNavigationBarHidden      = false
        self.navigationItem.titleView?.tintColor = Colors.white
        self.navigationItem.titleView = hsrImageView
        
        // Set up UIBarButtonItem
        let speakerBarButton: UIBarButtonItem = UIBarButtonItem(image: Images.speakerWave, style: .plain, target: self, action: #selector(speakerBarButtonTapped))
        let accountBarButton: UIBarButtonItem = UIBarButtonItem(image: Images.personfill, style: .plain, target: self, action: #selector(accountBarButtonTapped))
        let fixedSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        
        // Set up UIBarButtonItem's tintColor
        speakerBarButton.tintColor = Colors.white
        accountBarButton.tintColor = Colors.white
        
        // Set up navigationItem's rightBarButton
        self.navigationItem.rightBarButtonItems = [accountBarButton, fixedSpace, speakerBarButton]
    }
    
    // MARK: - Configure StatusView
    // statusButton
    func configureStatusButton () {
        let attributedText = NSAttributedString(string: " 全線正常營運", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)])
        trainStatusButton.setAttributedTitle(attributedText, for: .normal)
        trainStatusButton.setImage(Images.circle, for: .normal)
        trainStatusButton.tintColor                = Colors.darkGreen
        trainStatusButton.isUserInteractionEnabled = false
        trainStatusButton.tintColor = Colors.darkGreen
        statusView.addSubview(trainStatusButton)
        trainStatusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trainStatusButton.centerXAnchor.constraint(equalTo: statusView.centerXAnchor),
            trainStatusButton.centerYAnchor.constraint(equalTo: statusView.centerYAnchor)
        ])
    }
    
    // statusView
    func configureStatusView () {
        statusView.backgroundColor   = Colors.white
        view.addSubview(statusView)
        statusView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            statusView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusView.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    // MARK: - Bottom view.
    func configureIntroductionLabel () {
        introductionLabel.text          = "點選車票，即可顯示條碼乘車"
        introductionLabel.textAlignment = .center
        introductionLabel.textColor     = Colors.black
        introductionLabel.numberOfLines = 1
        introductionLabel.font          = UIFont.systemFont(ofSize: 15)
        view.addSubview(introductionLabel)
    }
    
    func configureForwardButton () {
        forwardButton.setImage(Images.forwardImage, for: .normal)
        forwardButton.tintColor = Colors.navigationBarColor
//        forwardButton.layer.borderWidth = 2
//        forwardButton.layer.borderColor = Colors.black.cgColor
        view.addSubview(forwardButton)
    }
    
    func configureBackwardButton () {
        backwardButton.setImage(Images.backwardImage, for: .normal)
        backwardButton.tintColor = Colors.navigationBarColor
//        backwardButton.layer.borderWidth = 2
//        backwardButton.layer.borderColor = Colors.black.cgColor
        view.addSubview(backwardButton)
    }
    
    func configurePageControl () {
        pageControl.currentPage                   = 0
        pageControl.numberOfPages                 = ticketsNumber
        pageControl.pageIndicatorTintColor        = Colors.lightGray
        pageControl.currentPageIndicatorTintColor = Colors.darkGray
        pageControl.hidesForSinglePage            = true
        pageControl.backgroundStyle               = .minimal
        pageControl.direction                     = .leftToRight
//        pageControl.layer.borderColor = Colors.black.cgColor
//        pageControl.layer.borderWidth = 1
        view.addSubview(pageControl)
    }
    
    func constraintBottomStackView () {
        view.addSubview(bottomStackView)
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.addArrangedSubview(backwardButton)
        bottomStackView.addArrangedSubview(pageControl)
        bottomStackView.addArrangedSubview(forwardButton)
        
        bottomStackView.axis         = .horizontal
        bottomStackView.alignment    = .fill
        bottomStackView.distribution = .fill
        bottomStackView.spacing      = 5
        
        NSLayoutConstraint.activate([
            forwardButton.widthAnchor.constraint(equalToConstant: 30),
            forwardButton.heightAnchor.constraint(equalToConstant: 30),
            backwardButton.widthAnchor.constraint(equalToConstant: 30),
            backwardButton.heightAnchor.constraint(equalToConstant: 30),
            pageControl.widthAnchor.constraint(equalToConstant: 200),
            pageControl.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        view.addSubview(bottomOnTopStackView)
        bottomOnTopStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomOnTopStackView.addArrangedSubview(introductionLabel)
        bottomOnTopStackView.addArrangedSubview(bottomStackView)
        
        bottomOnTopStackView.axis         = .vertical
        bottomOnTopStackView.distribution = .fill
        bottomOnTopStackView.alignment    = .fill
        bottomOnTopStackView.spacing      = 20
        
//        bottomOnTopStackView.layer.borderColor = Colors.black.cgColor
//        bottomOnTopStackView.layer.borderWidth = 1
        
        NSLayoutConstraint.activate([
            bottomOnTopStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomOnTopStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
        
    }
    
    func addTarget () {
        backwardButton.addTarget(self, action: #selector(backwardButtonTapped), for: .touchUpInside)
        forwardButton.addTarget(self, action: #selector(forwardButtonTapped), for: .touchUpInside)
        pageControl.addTarget(self, action: #selector(pageControlValueChanged), for: .valueChanged)
    }
    
    // MARK: - UIButton Action:
    @objc func speakerBarButtonTapped (_ sender: UIButton) {
        print("DEGUG PRINT: speakerBarButtonTapped")
    }
    
    @objc func accountBarButtonTapped (_ sender: UIButton) {
        print("DEGUG PRINT: accountBarButtonTapped")
        let accountVC = AccountViewController()
        self.navigationController?.navigationBar.tintColor = Colors.white
        self.navigationController?.pushViewController(accountVC, animated: true)
    }

    @objc func backwardButtonTapped (_ sender: UIButton) {
        print("DEGUG PRINT: backwardButtonTapped")
        pageControl.currentPage = 0
        print("DEGUG PRINT: Page Index:0\(pageControl.currentPage)")
    }
    
    @objc func forwardButtonTapped (_ sender: UIButton) {
        print("DEGUG PRINT: forwardButtonTapped")
        pageControl.currentPage = 9
        print("DEGUG PRINT: Page Index:\(pageControl.currentPage)")
    }
    
    @objc func pageControlValueChanged (_ sender: UIPageControl) {
        print("DEGUG PRINT: pageControlValueChanged")
        pageControlIndex = sender.currentPage
        print("DEGUG PRINT: Index is \(pageControlIndex)")
    }
}

#Preview {
    UINavigationController(rootViewController: MyTicketViewController())
}
