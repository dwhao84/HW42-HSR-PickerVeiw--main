//
//  PayAndCollectTicketViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/1/27.
//

import UIKit

class PayAndCollectTicketViewController: UIViewController {

    let backgroundView: UIView = UIView()
    let nonReservedView: NonReservedView = NonReservedView()
    
    let segmentedControl: UISegmentedControl = UISegmentedControl()
    let segmentedControlContainerView: UIView = UIView()
    let underlineView: UIView = UIView()
    
    let firstContainerView: UIView = UIView()
    let imageView: UIImageView     = UIImageView()
    let descriptionLabel: UILabel  = UILabel()
    let stackView: UIStackView     = UIStackView()
    
    enum Constants {
        static let segmentedControlHeight: CGFloat = 45
        static let underlineViewColor    : UIColor = Colors.orangeBrandColor
        static let underlineViewHeight   : CGFloat = 5
        static let underlineViewWidth    : CGFloat = UIScreen.main.bounds.width / 5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar ()
        self.view.backgroundColor = Colors.brightGray
//        configureBackgroundView ()
        configureSegmentedControlContainerView ()
        constraintSegmentedControl ()
        changeSegmentedControlLinePosition()
        configureFirstContainerView ()
    }
    
    func configureFirstContainerView () {
        firstContainerView.backgroundColor = Colors.brightGray
        view.addSubview(firstContainerView)
        firstContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstContainerView.topAnchor.constraint(equalTo: underlineView.bottomAnchor),
            firstContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        imageView.image = Images.nonReservationImage
        imageView.contentMode = .scaleAspectFit
        
        descriptionLabel.text = "目前沒有未付款的訂位紀錄"
        descriptionLabel.textColor = Colors.darkGray
        descriptionLabel.font      = UIFont.systemFont(ofSize: 12)
        
        imageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        descriptionLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(descriptionLabel)
        
        stackView.axis         = .vertical
        stackView.spacing      = 30
        stackView.distribution = .fill
        stackView.alignment    = .center
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: firstContainerView.topAnchor, constant: 250),
            stackView.centerXAnchor.constraint(equalTo: firstContainerView.centerXAnchor)
        ])
    }
    
    func setupNavigationBar () {
        // Set up titleText color in appearance.
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = Colors.navigationBarColor
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: Colors.white]
        self.navigationItem.scrollEdgeAppearance = navigationBarAppearance
               
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
    
    func configureSegmentedControlContainerView () {
        // segmentedControlContainerView
        segmentedControlContainerView.backgroundColor = Colors.navigationBarColor
        
        // segmentedControl's text
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular)], for: .normal)
        
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .semibold)], for: .selected)
        segmentedControl.insertSegment(withTitle: "付款 (0)", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "取票 (0)", at: 1, animated: true)
        
        segmentedControl.sizeToFit()
        segmentedControl.backgroundColor         = .clear
        segmentedControl.tintColor               = .white
        segmentedControl.selectedSegmentIndex    = 0
        segmentedControl.isEnabled               = true
        segmentedControl.addTarget(self, action: #selector(segmentedControlTapped), for: .valueChanged)
        segmentedControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        // underline
        underlineView.backgroundColor    = Colors.orangeBrandColor
        underlineView.layer.cornerRadius = Constants.underlineViewHeight / 2
    }
    
    func constraintSegmentedControl () {
        view.addSubview(segmentedControlContainerView)
        segmentedControlContainerView.addSubview(segmentedControl)
        view.addSubview(underlineView)
        
        segmentedControlContainerView.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.translatesAutoresizingMaskIntoConstraints              = false
        underlineView.translatesAutoresizingMaskIntoConstraints                 = false
        
        NSLayoutConstraint.activate([
            segmentedControlContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentedControlContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            segmentedControlContainerView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            segmentedControlContainerView.heightAnchor.constraint(equalToConstant: Constants.segmentedControlHeight),
        ])
        
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: segmentedControlContainerView.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: segmentedControlContainerView.centerYAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: segmentedControlContainerView.leadingAnchor),
            segmentedControl.heightAnchor.constraint(equalToConstant: Constants.segmentedControlHeight)
        ])
        
        NSLayoutConstraint.activate([
            underlineView.bottomAnchor.constraint(equalTo: segmentedControlContainerView.bottomAnchor),
            underlineView.leadingAnchor.constraint(equalTo: segmentedControlContainerView.leadingAnchor, constant: 70),
            underlineView.heightAnchor.constraint(equalToConstant: Constants.underlineViewHeight),
            underlineView.widthAnchor.constraint(equalToConstant:  Constants.underlineViewWidth)
        ])
    }
    
    func changeSegmentedControlLinePosition() {
        UIView.animate(withDuration: 0.3) {
            let segmentWidth = self.segmentedControl.frame.width / CGFloat(self.segmentedControl.numberOfSegments)
            let offsetX = segmentWidth * CGFloat(self.segmentedControl.selectedSegmentIndex) + 70
            self.underlineView.frame.origin.x = offsetX + self.segmentedControl.frame.minX
        }
    }
    
    @objc func segmentedControlTapped (_ sender: UISegmentedControl) {
        changeSegmentedControlLinePosition()
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            descriptionLabel.text = "目前沒有未付款的訂位紀錄"
        case 1:
            descriptionLabel.text = "目前沒有未取票的訂位紀錄"
        default:
            break
        }
        print("DEBUG PRINT: segmentedControl index is \(segmentedControl.selectedSegmentIndex)")
    }
    
    func configureBackgroundView () {
        backgroundView.backgroundColor = Colors.white
        backgroundView.addSubview(nonReservedView)

        backgroundView.layer.cornerRadius = 5
        backgroundView.clipsToBounds      = true
        backgroundView.dropShadow()
        
        backgroundView.heightAnchor.constraint(equalToConstant: 505).isActive = true
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        nonReservedView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nonReservedView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            nonReservedView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    // MARK: - UIButton Action:
    @objc func speakerBarButtonTapped (_ sender: UIButton) {
        print("speakerBarButtonTapped")
    }
    
    @objc func accountBarButtonTapped (_ sender: UIButton) {
        print("accountBarButtonTapped")
        let accountVC = AccountViewController()
        self.navigationController?.navigationBar.tintColor = Colors.white
        self.navigationController?.pushViewController(accountVC, animated: true)
    }
}

#Preview {
    UINavigationController(rootViewController: PayAndCollectTicketViewController())
}
