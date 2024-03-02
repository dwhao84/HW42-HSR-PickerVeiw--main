//
//  TickerOrderViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2023/12/26.
//

import UIKit

class TickerOrderViewController: UIViewController {
        
    let backgroundView: UIView                = UIView()
    let stackView:       UIStackView          = UIStackView()
    let backgroundShadowView: UIView          = UIView()
    
    let segmentedControlContainerView: UIView = UIView()
    var segmentedControl: UISegmentedControl  = UISegmentedControl()
    let underlineView: UIView                 = UIView()

    var hsrLogoImageView: UIImageView         = UIImageView()
 
    let fromLocationLabel: UILabel            = UILabel()
    let departureLabel: UILabel               = UILabel()
         
    let pickerView: UIPickerView              = UIPickerView()
    let customToolbar: UIToolbar              = UIToolbar   ()
    let pickerStackView: UIStackView          = UIStackView ()
         
    let trainStatusTableView:    UITableView  = UITableView()
    let serviceTableView:        UITableView  = UITableView()
    let chooseStationTableView : UITableView  = UITableView()
    let searchTableView:         UITableView  = UITableView()
    
    var selectedServiceIndex: IndexPath?
    var selectedIndex: Int?
    
    let controller = UIAlertController(
        title: "選擇座位偏好",
        message: "",
        preferredStyle: .actionSheet)
    var names = ["靠窗優先", "靠走道優先", "無偏好"]
    
    // Store the selected FromStationRow & DepatureStationRow.
    var selectedFromStationRow:     String = stationName[0]
    var selectedDepatureStationRow: String = depatureStationName[11]
    
    let scrollView: UIScrollView = UIScrollView()
    
    enum Constants {
        static let segmentedControlHeight: CGFloat = 45
        static let underlineViewColor    : UIColor = Colors.orangeBrandColor
        static let underlineViewHeight   : CGFloat = 5
        static let underlineViewWidth    : CGFloat = UIScreen.main.bounds.width / 10
    }
    
    // MARK: - 信用卡優惠
    let creditCardBackgroundView: UIView = UIView()
    let creditCardOfferView: CreditCardOfferView = CreditCardOfferView()
    // MARK: - 今日自由座
    let nonReservedBackgroundView: UIView = UIView()
    let nonReservedView: NonReservedView  = NonReservedView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.brightGray
        setupUI ()
    }
    
    func setupUI () {
        // tableView
        constraintBackgroundView   ()
        constraintTableView        ()
        setupTableView             ()
        
        // tableView Delegate & DataSource
        addTableViewDelegateAndDataSource ()
        
        // pickerView
        addPickerViewDelegateAndDataSource ()
        customNavigationBar                ()
        
        // segmentedControl
        configureSegmentedControlContainerView ()
        constraintSegmentedControl             ()

    }
    
    func constraintTableView () {
        backgroundView.backgroundColor = Colors.white
        backgroundView.addSubview(trainStatusTableView)
        backgroundView.addSubview(chooseStationTableView)
        backgroundView.addSubview(serviceTableView)
        backgroundView.addSubview(searchTableView)
        
        trainStatusTableView.rowHeight   = 45
        chooseStationTableView.rowHeight = 145
        serviceTableView.rowHeight       = 75
        searchTableView.rowHeight        = 120

        // add roundCorner by using maskedCorners
        trainStatusTableView.layer.cornerRadius = 10
        trainStatusTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        searchTableView.layer.cornerRadius = 10
        searchTableView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        // Set Layout Constraints
        trainStatusTableView.translatesAutoresizingMaskIntoConstraints   = false
        chooseStationTableView.translatesAutoresizingMaskIntoConstraints = false
        serviceTableView.translatesAutoresizingMaskIntoConstraints       = false
        searchTableView.translatesAutoresizingMaskIntoConstraints        = false
                
        NSLayoutConstraint.activate([
            // trainStatusTableView
            trainStatusTableView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            trainStatusTableView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            trainStatusTableView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor),
            trainStatusTableView.heightAnchor.constraint(equalToConstant: 45),
            
            // chooseStationTableView
            chooseStationTableView.topAnchor.constraint(equalTo: trainStatusTableView.bottomAnchor),
            chooseStationTableView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            chooseStationTableView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor),
            chooseStationTableView.heightAnchor.constraint(equalToConstant: 145),
            
            // serviceTableView
            serviceTableView.topAnchor.constraint(equalTo: chooseStationTableView.bottomAnchor),
            serviceTableView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            serviceTableView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor),
            serviceTableView.heightAnchor.constraint(equalToConstant: 300),
            
            // searchTableView
            searchTableView.topAnchor.constraint(equalTo: serviceTableView.bottomAnchor),
            searchTableView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            searchTableView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor),
            searchTableView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
        ])
    }
    
    func setupTableView () {
        trainStatusTableView.register(TrainStatusTableViewCell.nib(),     forCellReuseIdentifier: TrainStatusTableViewCell.identifier)
        chooseStationTableView.register(ChooseStationTableViewCell.nib(), forCellReuseIdentifier: ChooseStationTableViewCell.identifier)
        serviceTableView.register(ServiceTableViewCell.nib(),    forCellReuseIdentifier: ServiceTableViewCell.identifier)
        searchTableView.register(SearchTableViewCell.nib(),               forCellReuseIdentifier: SearchTableViewCell.identifier)
        
        trainStatusTableView.isScrollEnabled   = false
        chooseStationTableView.isScrollEnabled = false
        serviceTableView.isScrollEnabled       = false
        searchTableView.isScrollEnabled        = false
        
        trainStatusTableView.separatorStyle    = .none
        chooseStationTableView.separatorStyle  = .none
        serviceTableView.separatorStyle        = .none
        searchTableView.separatorStyle         = .none
    }
    
    func addTableViewDelegateAndDataSource () {
        trainStatusTableView.delegate     = self
        trainStatusTableView.dataSource   = self
        
        chooseStationTableView.delegate   = self
        chooseStationTableView.dataSource = self
        
        searchTableView.delegate          = self
        searchTableView.dataSource        = self
        
        serviceTableView.delegate         = self
        serviceTableView.dataSource       = self
    }
    
    func customNavigationBar () {
        // scrollEdgeAppearance
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Colors.navigationBarColor
        self.navigationItem.scrollEdgeAppearance = appearance
        
        // Set up navigation item
        self.navigationItem.titleView?.backgroundColor           = Colors.navigationBarColor
        self.navigationController?.navigationBar.backgroundColor = Colors.navigationBarColor
        self.navigationController?.navigationBar.barTintColor    = Colors.navigationBarColor
        
        // Set up UIBarButtonItem
        let speakerBarButton: UIBarButtonItem = UIBarButtonItem(image: Images.speakerWave, style: .plain, target: self, action: #selector(speakerBarButtonTapped))
        let accountBarButton: UIBarButtonItem = UIBarButtonItem(image: Images.personfill, style: .plain, target: self, action: #selector(accountBarButtonTapped))
        let fixedSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        
        // Set up barButton's tintColor
        speakerBarButton.tintColor = Colors.white
        accountBarButton.tintColor = Colors.white

        // hsrLogo Set up
        hsrLogoImageView = UIImageView(image: Images.hsrImage)
        hsrLogoImageView.contentMode = .scaleAspectFit

        // Set up navigationItem's rightBarButton
        self.navigationItem.rightBarButtonItems = [accountBarButton, fixedSpace, speakerBarButton]
        // Set up navigationItem's titleView
        self.navigationItem.titleView           = hsrLogoImageView
    }
    
    func addPickerViewDelegateAndDataSource () {
        pickerView.delegate   = self
        pickerView.dataSource = self
    }
    
    
    func configurePickerView () {
        pickerView.backgroundColor = UIColor.white
        pickerView.selectedRow(inComponent: 0)
        pickerView.tintColor = Colors.orangeBrandColor
        
        // Set up selectRow in first row component zero in pickerView.
        let firstRowIndexInFirstComponent = stationName.startIndex
        pickerView.selectRow(firstRowIndexInFirstComponent, inComponent: 0, animated: false)
        print(firstRowIndexInFirstComponent)
        // Set up selectRow in last row component one in pickerView.
        let lastRowIndexInSecondComponent = depatureStationName.count - 1
        pickerView.selectRow(lastRowIndexInSecondComponent, inComponent: 1, animated: false)
        print(lastRowIndexInSecondComponent)
        
        fromLocationLabel.frame     = CGRect(x: 90, y: 3, width: 60, height: 20)
        fromLocationLabel.text      = "起程點"
        fromLocationLabel.textColor = Colors.pickerViewLightColorForLabel
        fromLocationLabel.font      = UIFont.systemFont(ofSize: 12)
        
        departureLabel.frame     = CGRect(x: 288, y: 3, width: 60, height: 20)
        departureLabel.text      = "到達站"
        departureLabel.textColor = Colors.pickerViewLightColorForLabel
        departureLabel.font      = UIFont.systemFont(ofSize: 12)
        
        pickerView.addSubview(fromLocationLabel)
        pickerView.addSubview(departureLabel)
        
        // Custom UIBarButtonItem
        let switchStationBarButtton: UIBarButtonItem = UIBarButtonItem(title: "起始站互換", style: .plain, target: self, action: #selector(switchButtonTapped))
        let doneBarButton: UIBarButtonItem = UIBarButtonItem(title: "完成", style: .plain, target: self, action: #selector(doneButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        // Set up tintColor
        switchStationBarButtton.tintColor = Colors.orangeBrandColor
        doneBarButton.tintColor           = Colors.orangeBrandColor
        
        // customToolbar
        customToolbar.barStyle = UIBarStyle.default
        customToolbar.backgroundColor = .white
        customToolbar.setItems([switchStationBarButtton, flexibleSpace, doneBarButton], animated: true)
        customToolbar.barTintColor = .white
        customToolbar.layer.cornerRadius  = 10
        customToolbar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        customToolbar.layer.borderColor   = UIColor.systemGray3.cgColor
        customToolbar.layer.borderWidth   = 0.2
        customToolbar.clipsToBounds      = true
            
        constraintPickerView()
    }
    
    func constraintPickerView () {
        view.addSubview(pickerView)
        view.addSubview(customToolbar)

        customToolbar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pickerView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        pickerStackView.addArrangedSubview(customToolbar)
        pickerStackView.addArrangedSubview(pickerView)
                
        pickerStackView.axis    = .vertical
        pickerStackView.spacing = 0
        pickerStackView.distribution = .fill
        
        pickerStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pickerStackView)
        NSLayoutConstraint.activate([
            pickerStackView.leadingAnchor.constraint(equalTo: view .leadingAnchor),
            pickerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pickerStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pickerStackView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }


    // MARK: - SegmentedControl
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
        segmentedControl.insertSegment(withTitle: "一般訂票",  at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "信用卡優惠", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "今日自由座", at: 2, animated: true)
        
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
            underlineView.leadingAnchor.constraint(equalTo: segmentedControlContainerView.leadingAnchor, constant: 50),
            underlineView.heightAnchor.constraint(equalToConstant: Constants.underlineViewHeight),
            underlineView.widthAnchor.constraint(equalToConstant:  Constants.underlineViewWidth)
        ])
    }
    
    func changeSegmentedControlLinePosition() {
        UIView.animate(withDuration: 0.3) {
            let segmentWidth = self.segmentedControl.frame.width / CGFloat(self.segmentedControl.numberOfSegments)
            let offsetX = segmentWidth * CGFloat(self.segmentedControl.selectedSegmentIndex) + 50
            self.underlineView.frame.origin.x = offsetX + self.segmentedControl.frame.minX
            
            print("offsetX Value is \(offsetX)")
        }
    }
    
    func constraintBackgroundView () {
        backgroundView.layer.cornerRadius = 10
        backgroundView.clipsToBounds      = true
        backgroundView.layer.borderColor  = UIColor.lightGray.cgColor
        backgroundView.layer.borderWidth  = 0.2
        backgroundView.dropShadow()
        
        backgroundView.heightAnchor.constraint(equalToConstant: 610).isActive = true
        
        stackView.axis         = .horizontal
        stackView.distribution = .fill
        stackView.spacing      = 0
        
        stackView.addArrangedSubview(backgroundView)
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 62),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
    }
    
    // MARK: - 信用卡優惠:
    func configureCreditCardOfferBackgroundView () {
        creditCardBackgroundView.layer.cornerRadius = 10
        creditCardBackgroundView.clipsToBounds      = true
        
        creditCardBackgroundView.layer.borderColor  = UIColor.lightGray.cgColor
        creditCardBackgroundView.layer.borderWidth  = 0.2
        
        creditCardBackgroundView.backgroundColor = Colors.white
        creditCardBackgroundView.dropShadow()
                
        scrollView.isScrollEnabled = true
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: underlineView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])

        scrollView.addSubview(creditCardBackgroundView)
        creditCardBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            creditCardBackgroundView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            creditCardBackgroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            creditCardBackgroundView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            creditCardBackgroundView.widthAnchor.constraint(equalToConstant: 400),
            creditCardBackgroundView.heightAnchor.constraint(equalToConstant: 700)
        ])
        
        creditCardBackgroundView.addSubview(creditCardOfferView)
        creditCardOfferView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            creditCardOfferView.topAnchor.constraint(equalTo: creditCardBackgroundView.topAnchor, constant: 10),
            creditCardOfferView.leadingAnchor.constraint(equalTo: creditCardBackgroundView.leadingAnchor),
            creditCardOfferView.trailingAnchor.constraint(equalTo: creditCardBackgroundView.trailingAnchor),
            creditCardOfferView.bottomAnchor.constraint(equalTo: creditCardBackgroundView.bottomAnchor, constant: -20)
        ])
    }
    
    // MARK: - 今日自由座:
    func configureNonReservedBackgroundView () {
                
        nonReservedBackgroundView.layer.cornerRadius = 10
        nonReservedBackgroundView.clipsToBounds      = true
        nonReservedBackgroundView.layer.borderColor  = UIColor.lightGray.cgColor
        nonReservedBackgroundView.layer.borderWidth  = 0.2
        
        nonReservedBackgroundView.backgroundColor = Colors.white
        nonReservedBackgroundView.dropShadow()
        
        nonReservedBackgroundView.heightAnchor.constraint(equalToConstant: 545).isActive = true
        
        view.addSubview(nonReservedBackgroundView)
        
        nonReservedBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nonReservedBackgroundView.topAnchor.constraint(equalTo: underlineView.topAnchor, constant: 20),
            nonReservedBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nonReservedBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            nonReservedBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
        
        // Set up nonReservedView for Auto-Layout.
        nonReservedBackgroundView.addSubview(nonReservedView)
        nonReservedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nonReservedView.topAnchor.constraint(equalTo: nonReservedBackgroundView.topAnchor, constant: 0),
            nonReservedView.centerXAnchor.constraint(equalTo: nonReservedBackgroundView.centerXAnchor)
        ])
    }
    
    
    // MARK: - Tap Gesture
    func tapTheViewController () {
        // tapGesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapTheView))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }

    // MARK: - ChooseStationTableViewCell Action:
    @objc func showFromLocationPickerView (_ sender: UIButton) {
        print("showFromLocationPickerView")
        configurePickerView()
        pickerStackView.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func showDepartureLocationPickerView (_ sender: UIButton) {
        print("showDepartureLocationPickerView")
        configurePickerView()
        pickerStackView.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
    }
    
    //MARK: - ServiceTableViewCell Action:
    @objc func ridingTimeSelectionCellTapped () {
        print("ridingTimeSelectionCellTapped")
    }
    
    @objc func carriageSelectionCellTapped () {
        print("carriageSelectionCellTapped")
    }
    
    @objc func numberOfPassengersCellTapped (_ sender: UITableViewCell) {
        print("numberOfPassengersCellTapped")
    }
    
    @objc func seatSelectionCellTapped () {
        print("seatSelectionCellTapped")
    }
    
    //MARK: - SearchTableViewCell Action:
    @objc func searchButtonTapped (_ sender: UIButton) {
        print("searchButtonTapped")
    }
    
    //MARK: - PickerView switchStation
    @objc func switchButtonTapped (_ sender: UIBarButtonItem) {
        print("switchButtonTapped")
        
        // Store the selecteRow in pickView's components.
        let selectedRowInFirstComponent  = pickerView.selectedRow(inComponent: 0)
        let selectedRowInSecondComponent = pickerView.selectedRow(inComponent: 1)
        
        print("selectedRowInFirstComponent is \(selectedRowInFirstComponent),",
              "selectedRowInSecondComponent is \(selectedRowInSecondComponent)"
        )
        
        // selectRow change to other components.
        pickerView.selectRow(selectedRowInSecondComponent, inComponent: 0, animated: true)
        pickerView.selectRow(selectedRowInFirstComponent,  inComponent: 1, animated: true)
        
        selectedFromStationRow     = depatureStationName[selectedRowInSecondComponent]
        selectedDepatureStationRow = stationName[selectedRowInFirstComponent]
        
        pickerView.reloadAllComponents   ()
        chooseStationTableView.reloadData()
    }
    
    @objc func doneButtonTapped (_ sender: UIBarButtonItem) {
        pickerStackView.removeFromSuperview()
        chooseStationTableView.reloadData  ()
        print("doneButtonTapped")
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @objc func tapTheView (_ sender: UITapGestureRecognizer) {
            pickerStackView.removeFromSuperview()
            print("tapTheView")
    }
    
    //MARK: - Segmented Control Action:
    @objc func segmentedControlTapped (_ sender: UISegmentedControl) {
        print("segmentedControl's selectedIndex is \(segmentedControl.selectedSegmentIndex)")
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            backgroundView.isHidden            = false
            creditCardBackgroundView.isHidden  = true
            nonReservedBackgroundView.isHidden = true
            print(segmentedControl.selectedSegmentIndex)
        case 1:
            backgroundView.isHidden            = true
            creditCardBackgroundView.isHidden  = false
            creditCardOfferView.isHidden       = false
            nonReservedBackgroundView.isHidden = true
            configureCreditCardOfferBackgroundView ()
            print(segmentedControl.selectedSegmentIndex)
        case 2:
            backgroundView.isHidden            = true
            nonReservedBackgroundView.isHidden = false
            creditCardOfferView.isHidden       = true
            creditCardBackgroundView.isHidden  = true
            configureNonReservedBackgroundView ()
            print(segmentedControl.selectedSegmentIndex)
        default:
            print("default")
        }

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
    
    // MARK: Alert Controller
    func trainClassSelectionAC () {
        // 建立一個提示框
        let alertController = UIAlertController(
            title: "",
            message: "選擇車廂種類",
            preferredStyle: .actionSheet)

        let cancelAction = UIAlertAction(
          title: "取消",
          style: .cancel,
          handler: nil)

        let economyClassAction = UIAlertAction(
          title: "標準車廂",
          style: .default,
          handler: nil)
        
        let bussinessClassAction  = UIAlertAction(
          title: "商務車廂",
          style: .default,
          handler: nil)
        
        alertController.view.tintColor = Colors.black
        alertController.addAction(cancelAction)
        alertController.addAction(economyClassAction)
        alertController.addAction(bussinessClassAction)
        
        // 顯示提示框
        self.present(alertController, animated: true, completion: nil)
    }
    
    func updateServiceTableViewWithSelection(_ selection: String) {
        serviceTableView.reloadData()
    }
    
    // MARK: - Seats Peference
    func seatsPeferenceAC() {
        // Create a alertController
        let alertController = UIAlertController(
            title: "",
            message: "選擇座位偏好",
            preferredStyle: .actionSheet)

        // alertActionHandler
        let alertActionHandler: (UIAlertAction) -> Void = { action in
            
            let selectedTitle = action.title!
            switch action.title {
            case "取消":
                print(selectedTitle)
                
            case "靠窗優先":
                print(selectedTitle)
                
            case "靠走道優先":
                print(selectedTitle)
                
            case "無偏好":
                print(selectedTitle)
                
            default:
                break
            }
        }
        
        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(
          title: "取消", style: .cancel, handler: nil)
        let okAction    = UIAlertAction(title: "靠窗優先", style: .default, handler: alertActionHandler)
        let aisleAction = UIAlertAction(title: "靠走道優先", style: .default, handler: alertActionHandler)
        let noPreferAction = UIAlertAction(title: "無偏好", style: .default, handler: alertActionHandler)
        
        alertController.view.tintColor = Colors.black
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        alertController.addAction(aisleAction)
        alertController.addAction(noPreferAction)
        
        // 顯示提示框
        self.present(alertController, animated: true, completion: nil)
    }
}


// MARK: - Extension for tableView dataSource:
extension TickerOrderViewController: UITableViewDataSource {
    
    // 用if else去呈現不同的tableView，並用return返回，顯示不同數值列的內容。
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == trainStatusTableView {
            return 1
        } else if tableView == chooseStationTableView {
            return 1
        } else if tableView == searchTableView        {
            return 1
        } else if tableView == serviceTableView       {
            print("servicesData.count is \(servicesData.count) qty")
            return servicesData.count
        } else {
            return 0
        }
    }
    
    // MARK: - cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if tableView == trainStatusTableView {
            guard let trainStatusTableViewCell = trainStatusTableView.dequeueReusableCell(withIdentifier: TrainStatusTableViewCell.identifier, for: indexPath) as? TrainStatusTableViewCell else {
                fatalError("Unable to dequeue Resable trainStatusTableViewCell")
            }
            // Set up selectionStyle.
            trainStatusTableViewCell.selectionStyle   = .none
            return trainStatusTableViewCell
            
        } else if tableView == chooseStationTableView {
            guard let chooseStationTableViewCell = chooseStationTableView.dequeueReusableCell(withIdentifier: ChooseStationTableViewCell.identifier, for: indexPath) as? ChooseStationTableViewCell else {
                fatalError("Unable to dequeue Resable chooseStationTableViewCell")
            }
            // Set up selectionStyle, setTitle.
            chooseStationTableViewCell.selectionStyle = .none
            chooseStationTableViewCell.fromStationButton.setTitle(selectedFromStationRow, for: .normal)
            chooseStationTableViewCell.departureStationButton.setTitle(selectedDepatureStationRow, for: .normal)
            
            // Add Target.
            chooseStationTableViewCell.fromStationButton.addTarget(self, action: #selector(showFromLocationPickerView), for: .touchUpInside)
            chooseStationTableViewCell.departureStationButton.addTarget(self, action: #selector(showDepartureLocationPickerView), for: .touchUpInside)

            chooseStationTableViewCell.ticketStatusSegmentendControl.selectedSegmentIndex = 0
            chooseStationTableViewCell.ticketStatusSegmentendControl.isEnabled            = true
            
            return chooseStationTableViewCell

        } else if tableView == searchTableView {

            guard let searchTableViewCell = searchTableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else {
                fatalError("Unable to dequeue Resable searchTableViewCell")
            }
            // Set up selectionStyle.
            searchTableViewCell.selectionStyle = .none
            
            // Add Target
            searchTableViewCell.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
            return searchTableViewCell

        } else if tableView == serviceTableView {

            guard let serviceTableViewCell = serviceTableView.dequeueReusableCell(withIdentifier: ServiceTableViewCell.identifier, for: indexPath) as? ServiceTableViewCell else {
                fatalError("Unable to dequeue Resable serviceSelectionTableViewCell")
            }
            
            // Set up selectionStyle, text, image.
            serviceTableViewCell.selectionStyle = .none
            serviceTableViewCell.accessoryType  = .disclosureIndicator
            serviceTableViewCell.serviceStatusLabel.text = servicesData[indexPath.row].service
            serviceTableViewCell.serviceImageView.image  = servicesData[indexPath.row].serviceIcon
            serviceTableViewCell.statusLabel.text        = servicesData[indexPath.row].subtitleService

            
            return serviceTableViewCell
        } else {
            print("Nothing")
        }
        tableView.reloadData()
        return UITableViewCell()
    }
}

// MARK: - tableView delegate didSelectRowAt
extension TickerOrderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == trainStatusTableView {
            
            trainStatusTableView.deselectRow(at: indexPath, animated: true)
            print("trainStatusTableView's index is \(indexPath)")
            
        } else if tableView == chooseStationTableView {
            chooseStationTableView.deselectRow(at: indexPath, animated: true)
            print("chooseStationTableView's index is \(indexPath)")
            
        } else if tableView == serviceTableView && indexPath.row == 0 {
            
            print("serviceTableView's index is \(indexPath.row)")
            serviceTableView.deselectRow(at: indexPath, animated: true)
            let ridingTimeVC = RidingTimeViewController()
            self.navigationController?.navigationBar.tintColor = Colors.white
            self.navigationController?.pushViewController(ridingTimeVC, animated: true)
      
        } else if tableView == serviceTableView && indexPath.row == 1 {
            
            print("serviceTableView's index is \(indexPath.row)")
            serviceTableView.deselectRow(at: indexPath, animated: true)
            
            // Showing which class that customer want.
            trainClassSelectionAC()
            
        } else if tableView == serviceTableView && indexPath.row == 2 {
            
            print("serviceTableView's index is \(indexPath.row)")
            serviceTableView.deselectRow(at: indexPath, animated: true)
            

        } else if tableView == serviceTableView && indexPath.row == 3 {
            
            print("serviceTableView's index is \(indexPath.row)")
            serviceTableView.deselectRow(at: indexPath, animated: true)
            
            seatsPeferenceAC()
            
        } else if tableView == searchTableView {
            searchTableView.deselectRow(at: indexPath, animated: true)
            print("searchTableView's index is \(indexPath)")
        }
    }
}

// MARK: - Extension for PickerView's delegate :
extension TickerOrderViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            print("component \(component) row \(row)")
            return stationName[row]
        } else {
            print("component \(component) row \(row)")
            return depatureStationName[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            selectedFromStationRow = stationName[row]
        } else {
            selectedDepatureStationRow = depatureStationName[row]
        }
        print("起程點為\(selectedFromStationRow)，到達站為\(selectedDepatureStationRow)")
        chooseStationTableView.reloadData()
    }
}

extension TickerOrderViewController: UIPickerViewDataSource {
    // Keyword: numberOfComponents 意思是顯示總共幾行
    // 舉例: 啟程點的南港是一行，點擊到達站 顯示的pickerView裡，左營站是一行
    // 所以當 return 2時，就意味著會顯示兩行(numberOfComponents)的內容。
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // Keyword: numberOfRowsInComponent意思是顯示一行裡面產生多少內容
    // 舉例: 顯示啟程點的站名，是從南港到左營，總共11站。
    // 所以當components == 0時，components的內容會從左至右產生，並且會產生stationName陣列裡面的內容。
    // 反觀當components != 0時，則產生 depatureStationName 陣列裡面的內容。
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return stationName.count
        } else {
            return depatureStationName.count
        }
    }
}


#Preview {
    UINavigationController(rootViewController: TickerOrderViewController())
}
