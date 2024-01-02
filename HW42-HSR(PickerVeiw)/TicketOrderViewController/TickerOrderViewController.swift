//
//  TickerOrderViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2023/12/26.
//

import UIKit

class TickerOrderViewController: UIViewController {
    
    let backgroundView = UIView()
    let stackView:       UIStackView = UIStackView()
    
    let segmentedControlContainerView: UIView = UIView()
    var segmentedControl: UISegmentedControl  = UISegmentedControl()
    let underlineView: UIView                 = UIView()
    
    let pickerView: UIPickerView     = UIPickerView()
    let customToolbar: UIToolbar     = UIToolbar   ()
    let pickerStackView: UIStackView = UIStackView ()
    
    let trainStatusTableView:    UITableView = UITableView()
    let serviceTableView:        UITableView = UITableView()
    let chooseStationTableView : UITableView = UITableView()
    let searchTableView:         UITableView = UITableView()
    
    // Define Common color
    static let orangeBrandColor: UIColor        = UIColor(red: 222/255, green: 83/255, blue: 9/255, alpha: 1)
    static let navigationBarColor: UIColor     = UIColor(red: 53/255, green: 56/255, blue: 61/255, alpha: 1)
    
    enum Constants {
        static let segmentedControlHeight: CGFloat = 45
        static let underlineViewColor    : UIColor = TickerOrderViewController.orangeBrandColor
        static let underlineViewHeight   : CGFloat = 5
        static let underlineViewWidth    : CGFloat = UIScreen.main.bounds.width / 10
    }
    
    enum SelectRowAt: Int {
        case zero  = 0
        case one   = 1
        case two   = 2
        case three = 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 247/255, alpha: 1)
        
        constraintBackgroundView   ()
        constraintTableView        ()
        registerForTableView       ()
        setupDelegateAndDataSource ()
        customNavigationBar        ()
        configureSegmentedControlContainerView ()
        
        //        // tapGesture
        //        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapTheView))
        //        view.addGestureRecognizer(tapGesture)
    }
    
    func constraintTableView () {
        backgroundView.addSubview(trainStatusTableView)
        backgroundView.addSubview(chooseStationTableView)
        backgroundView.addSubview(serviceTableView)
        backgroundView.addSubview(searchTableView)
        
        trainStatusTableView.rowHeight   = 45
        chooseStationTableView.rowHeight = 145
        serviceTableView.rowHeight       = 75
        searchTableView.rowHeight        = 120
        
        //        trainStatusTableView.backgroundColor   = .red
        //        chooseStationTableView.backgroundColor = .black
        //        serviceTableView.backgroundColor       = .cyan
        //        searchTableView.backgroundColor        = .blue
        
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
    
    func registerForTableView () {
        trainStatusTableView.register(TrainStatusTableViewCell.nib(),     forCellReuseIdentifier: TrainStatusTableViewCell.identifier)
        chooseStationTableView.register(ChooseStationTableViewCell.nib(), forCellReuseIdentifier: ChooseStationTableViewCell.identifier)
        serviceTableView.register(ServiceSelectionTableViewCell.nib(),    forCellReuseIdentifier: ServiceSelectionTableViewCell.identifier)
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
    
    func setupDelegateAndDataSource () {
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
        appearance.backgroundColor = TickerOrderViewController.navigationBarColor
        self.navigationItem.scrollEdgeAppearance = appearance
        
        // Set up navigation item
        self.navigationItem.titleView?.backgroundColor           = TickerOrderViewController.navigationBarColor
        self.navigationController?.navigationBar.backgroundColor = TickerOrderViewController.navigationBarColor
        self.navigationController?.navigationBar.barTintColor    = TickerOrderViewController.navigationBarColor
        
        // Set up UIBarButtonItem
        let speakerBarButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"speaker.wave.3.fill"), style: .plain, target: self, action: #selector(speakerBarButtonTapped))
        let accountBarButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"person.fill"), style: .plain, target: self, action: #selector(accountBarButtonTapped))
        let fixedSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        
        // Set up barButton's tintColor
        speakerBarButton.tintColor = .white
        accountBarButton.tintColor = .white
        
        // Set up navigationItem's rightBarButton
        self.navigationItem.rightBarButtonItems = [accountBarButton, fixedSpace, speakerBarButton]
        print("customNavigationBar")
    }
    
    func configurePickerView () {
        pickerView.delegate   = self
        pickerView.dataSource = self
        pickerView.backgroundColor = UIColor.white
        pickerView.selectedRow(inComponent: 0)
        pickerView.tintColor = TickerOrderViewController.orangeBrandColor
        
        // custom UIBarButtonItem
        let switchStationBarButtton: UIBarButtonItem = UIBarButtonItem(title: "起始站互換", style: .plain, target: self, action: #selector(switchButtonTapped))
        let doneBarButton: UIBarButtonItem = UIBarButtonItem(title: "完成", style: .plain, target: self, action: #selector(doneButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        switchStationBarButtton.tintColor = TickerOrderViewController.orangeBrandColor
        doneBarButton.tintColor           = TickerOrderViewController.orangeBrandColor
        
        // customToolbar
        customToolbar.barStyle = UIBarStyle.default
        customToolbar.backgroundColor = .white
        customToolbar.items = [switchStationBarButtton, flexibleSpace, doneBarButton]
        constraintPickerView()
    }
    
    func constraintPickerView () {
        view.addSubview(pickerView)
        view.addSubview(customToolbar)
        
        customToolbar.widthAnchor.constraint(equalToConstant: 428).isActive = true
        customToolbar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        pickerView.widthAnchor.constraint(equalToConstant: 428).isActive  = true
        pickerView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        pickerStackView.addArrangedSubview(customToolbar)
        pickerStackView.addArrangedSubview(pickerView)
        
        pickerStackView.axis    = .vertical
        pickerStackView.spacing = 0
        pickerStackView.distribution = .equalSpacing
        
        pickerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pickerStackView)
        
        NSLayoutConstraint.activate([
            pickerStackView.leadingAnchor.constraint(equalTo: view .leadingAnchor),
            pickerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pickerStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pickerStackView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func showingSeatSelectionAlertSheet () {
        let controller = UIAlertController(title: "選擇座位偏好", message: "", preferredStyle: .actionSheet)
        let names = ["靠窗優先", "靠走道優先", "無偏好"]
        for name in names {
            let action = UIAlertAction(title: name, style: .default) { action in
                print(action.title!)
            }
            controller.addAction(action)
        }
        controller.view.tintColor       = .black
        let cancelAction = UIAlertAction(title: "取消", style: .cancel)
        controller.addAction(cancelAction)
        present(controller, animated: true)
    }
    
    func configureSegmentedControlContainerView () {
        
        // segmentedControlContainerView
        segmentedControlContainerView.backgroundColor = TickerOrderViewController.navigationBarColor
        
        // segmentedControl
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular)], for: .normal)
        
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .semibold)], for: .selected)
        segmentedControl.insertSegment(withTitle: "一般訂票",  at:  0, animated: true)
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
        underlineView.backgroundColor    = TickerOrderViewController.orangeBrandColor
        underlineView.layer.cornerRadius = Constants.underlineViewHeight / 2
        
        
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
        }
    }
    
    func constraintBackgroundView () {
        backgroundView.backgroundColor    = .white
        backgroundView.layer.cornerRadius = 10
        backgroundView.clipsToBounds      = false
        
        backgroundView.layer.borderColor  = UIColor.lightGray.cgColor
        backgroundView.layer.borderWidth  = 0.3
        
        backgroundView.widthAnchor.constraint(equalToConstant:  395).isActive = true
        backgroundView.heightAnchor.constraint(equalToConstant: 610).isActive = true
        
        stackView.axis         = .horizontal
        stackView.distribution = .fill
        stackView.spacing      = 0
        
        stackView.addArrangedSubview(backgroundView)
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 62),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - @objc function Action.
    // MARK: ChooseStationTableViewCell Action:
    @objc func showFromLocationPickerView (_ sender: UIButton) {
        print("showFromLocationPickerView")
        configurePickerView()
        pickerStackView.isHidden = false
    }
    
    @objc func showDepartureLocationPickerView (_ sender: UIButton) {
        print("showDepartureLocationPickerView")
        configurePickerView()
        pickerStackView.isHidden = false
    }
    
    //MARK: -  ServiceTableViewCell Action:
    @objc func ridingTimeSelectionCellTapped () {
        print("ridingTimeSelectionCellTapped")
    }
    
    @objc func carriageSelectionCellTapped () {
        print("carriageSelectionCellTapped")
    }
    
    @objc func numberOfPassengersCellTapped () {
        print("numberOfPassengersCellTapped")
    }
    
    @objc func seatSelectionCellTapped () {
        print("seatSelectionCellTapped")
        showingSeatSelectionAlertSheet ()
    }
    
    //MARK: - SearchTableViewCell Action:
    @objc func searchButtonTapped (_ sender: UIButton) {
        print("searchButtonTapped")
    }
    
    //MARK: - PickerView switchStation
    @objc func switchButtonTapped (_ sender: UIButton) {
        print("switchButtonTapped")
    }
    
    @objc func doneButtonTapped (_ sender: UIButton) {
        pickerStackView.isHidden = true
    }
    
    @objc func tapTheView (_ sender: UITapGestureRecognizer) {
        pickerStackView.isHidden = true
        print("tapTheView action")
    }
    
    @objc func segmentedControlTapped (_ sender: UISegmentedControl) {
        print("segmentedControlTapped")
        changeSegmentedControlLinePosition()
        
    }
    
    @objc func speakerBarButtonTapped () {
        print("speakerBarButtonTapped")
    }
    
    @objc func accountBarButtonTapped () {
        print("speakerBarButtonTapped")
    }
}


// MARK: - Extension for tableView dataSource:
extension TickerOrderViewController: UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if tableView == trainStatusTableView {

            let trainStatusTableViewCell = trainStatusTableView.dequeueReusableCell(withIdentifier: TrainStatusTableViewCell.identifier, for: indexPath) as! TrainStatusTableViewCell

            trainStatusTableViewCell.selectionStyle   = .none

            return trainStatusTableViewCell
            
        } else if tableView == chooseStationTableView {

            let chooseStationTableViewCell = chooseStationTableView.dequeueReusableCell(withIdentifier: ChooseStationTableViewCell.identifier, for: indexPath) as! ChooseStationTableViewCell
            chooseStationTableViewCell.selectionStyle = .none
            
            // addTarget
            chooseStationTableViewCell.fromStationButton.addTarget(self, action: #selector(showFromLocationPickerView), for: .touchUpInside)
            chooseStationTableViewCell.departureStationButton.addTarget(self, action: #selector(showDepartureLocationPickerView), for: .touchUpInside)

            chooseStationTableViewCell.ticketStatusSegmentendControl.selectedSegmentIndex = 0
            chooseStationTableViewCell.ticketStatusSegmentendControl.isEnabled            = true
            
            return chooseStationTableViewCell

        } else if tableView == searchTableView {

            let searchTableViewCell = searchTableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as! SearchTableViewCell
            searchTableViewCell.selectionStyle = .none
            
            // addTarget
            searchTableViewCell.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
            
            
            return searchTableViewCell

        } else if tableView == serviceTableView {

            let serviceSelectionTableViewCell: ServiceSelectionTableViewCell = serviceTableView.dequeueReusableCell(withIdentifier: ServiceSelectionTableViewCell.identifier, for: indexPath) as! ServiceSelectionTableViewCell
            serviceSelectionTableViewCell.selectionStyle = .none
            serviceSelectionTableViewCell.accessoryType = .disclosureIndicator
            
            serviceSelectionTableViewCell.serviceStatusTitleLabel.text = servicesData[indexPath.row].service
            serviceSelectionTableViewCell.statusLabel.text             = servicesData[indexPath.row].subtitleService
            serviceSelectionTableViewCell.serviceImageView.image       = servicesData[indexPath.row].serviceIcon
            
            print("\(indexPath.row)")
            
            return serviceSelectionTableViewCell

        } else {
            print("Nothing")
        }
        return UITableViewCell()
    }
}

// MARK: - Extension for TableView's delegate :
extension TickerOrderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch indexPath.row {
            case 0:
                ridingTimeSelectionCellTapped ()
                print("case \(indexPath.row)")
            case 1:
                carriageSelectionCellTapped ()
                print("case \(indexPath.row)")
            case 2:
                numberOfPassengersCellTapped ()
                print("case \(indexPath.row)")
            case 3:
                showingSeatSelectionAlertSheet()
                print("case \(indexPath.row)")
            default:
                break
        }
    }
}

// MARK: - Extension for PickerView's delegate :
extension TickerOrderViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = stationName[row]
        return row
    }
}

extension TickerOrderViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stationName.count
    }
    
    
}

