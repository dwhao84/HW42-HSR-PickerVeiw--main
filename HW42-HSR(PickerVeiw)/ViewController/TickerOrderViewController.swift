//
//  TickerOrderViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2023/12/26.
//

import UIKit

class TickerOrderViewController: UIViewController {
    
    let backgroundView: UIView       = UIView()
    let stackView:       UIStackView = UIStackView()
    let backgroundShadowView: UIView = UIView()
    
    let segmentedControlContainerView: UIView = UIView()
    var segmentedControl: UISegmentedControl  = UISegmentedControl()
    let underlineView: UIView                 = UIView()

    var hsrLogoImageView: UIImageView = UIImageView()

    let fromLocationLabel: UILabel   = UILabel()
    let departureLabel: UILabel      = UILabel()

    let pickerView: UIPickerView     = UIPickerView()
    let customToolbar: UIToolbar     = UIToolbar   ()
    let pickerStackView: UIStackView = UIStackView ()
        
    let trainStatusTableView:    UITableView = UITableView()
    let serviceTableView:        UITableView = UITableView()
    let chooseStationTableView : UITableView = UITableView()
    let searchTableView:         UITableView = UITableView()
    
    var selectedServiceIndex: IndexPath?
    var selectedIndex: Int?
    
    let controller = UIAlertController(
        title: "選擇座位偏好",
        message: "",
        preferredStyle: .actionSheet)
    var names = ["靠窗優先", "靠走道優先", "無偏好"]
    
    //
    var selectedFromStationRow:     String = stationName[0]
    var selectedDepatureStationRow: String = depatureStationName[11]
    
    enum Constants {
        static let segmentedControlHeight: CGFloat = 45
        static let underlineViewColor    : UIColor = SystemColor.orangeBrandColor
        static let underlineViewHeight   : CGFloat = 5
        static let underlineViewWidth    : CGFloat = UIScreen.main.bounds.width / 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = SystemColor.brightGray
        setupUI ()

    }
    
    func setupUI () {
        // tableView
        constraintBackgroundView   ()
        constraintTableView        ()
        setupTableView       ()
        
        addTableViewDelegateAndDataSource ()
        
        // pickerView
        addPickerViewDelegateAndDataSource ()
        customNavigationBar        ()
        
        // segmentedControl
        configureSegmentedControlContainerView ()
        constraintSegmentedControl()
    }
    
    func constraintTableView () {
        backgroundView.backgroundColor = .white
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
        appearance.backgroundColor = SystemColor.navigationBarColor
        self.navigationItem.scrollEdgeAppearance = appearance
        
        // Set up navigation item
        self.navigationItem.titleView?.backgroundColor           = SystemColor.navigationBarColor
        self.navigationController?.navigationBar.backgroundColor = SystemColor.navigationBarColor
        self.navigationController?.navigationBar.barTintColor    = SystemColor.navigationBarColor
        
        // Set up UIBarButtonItem
        let speakerBarButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"speaker.wave.3.fill"), style: .plain, target: self, action: #selector(speakerBarButtonTapped))
        let accountBarButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"person.fill"), style: .plain, target: self, action: #selector(accountBarButtonTapped))
        let fixedSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        
        // Set up barButton's tintColor
        speakerBarButton.tintColor = SystemColor.white
        accountBarButton.tintColor = SystemColor.white

        // hsrLogo Set up
        let hsrlogoImage = UIImage(named: "hsrLogo") //Your logo url here
        hsrLogoImageView = UIImageView(image: hsrlogoImage)

        let bannerWidth  = navigationController?.navigationBar.frame.size.width
        let bannerHeight = navigationController?.navigationBar.frame.size.height

        let bannerX = (bannerWidth! / 2  - (hsrlogoImage?.size.width)!) / 2
        let bannerY = (bannerHeight! / 2 - (hsrlogoImage?.size.height)!) / 2

        hsrLogoImageView.frame       = CGRect(x: bannerX, y: bannerY, width: bannerWidth!, height: bannerHeight!)
        hsrLogoImageView.contentMode = .scaleAspectFit

        // Set up navigationItem's rightBarButton
        self.navigationItem.rightBarButtonItems = [accountBarButton, fixedSpace, speakerBarButton]
        // Set up navigationItem's titleView
        self.navigationItem.titleView           = hsrLogoImageView
    
        NSLayoutConstraint.activate([
            hsrLogoImageView.centerXAnchor.constraint(equalTo: self.navigationItem.titleView!.centerXAnchor),
            hsrLogoImageView.centerYAnchor.constraint(equalTo: self.navigationItem.titleView!.centerYAnchor)
        ])
    }
    
    func addPickerViewDelegateAndDataSource () {
        pickerView.delegate   = self
        pickerView.dataSource = self
    }
    
    
    func configurePickerView () {
        pickerView.backgroundColor = UIColor.white
        pickerView.selectedRow(inComponent: 0)
        pickerView.tintColor = SystemColor.orangeBrandColor
        
        // Set up selectRow in first row component zero in pickerView.
        let firstRowIndexInFirstComponent = stationName.startIndex
        pickerView.selectRow(firstRowIndexInFirstComponent, inComponent: 0, animated: false)
        print(firstRowIndexInFirstComponent)
        // Set up selectRow in last row component one in pickerView.
        let lastRowIndexInSecondComponent = depatureStationName.count - 1
        pickerView.selectRow(lastRowIndexInSecondComponent, inComponent: 1, animated: false)
        print(lastRowIndexInSecondComponent)
        
        fromLocationLabel.frame = CGRect(x: 90, y: 3, width: 60, height: 20)
        fromLocationLabel.text      = "起程點"
        fromLocationLabel.textColor = UIColor(red: 133/255, green: 133/255, blue: 133/255, alpha: 1)
        fromLocationLabel.font      = UIFont.systemFont(ofSize: 12)
        
        departureLabel.frame = CGRect(x: 288, y: 3, width: 60, height: 20)
        departureLabel.text      = "到達站"
        departureLabel.textColor = UIColor(red: 133/255, green: 133/255, blue: 133/255, alpha: 1)
        departureLabel.font      = UIFont.systemFont(ofSize: 12)
        
        pickerView.addSubview(fromLocationLabel)
        pickerView.addSubview(departureLabel)
        
        // Custom UIBarButtonItem
        let switchStationBarButtton: UIBarButtonItem = UIBarButtonItem(title: "起始站互換", style: .plain, target: self, action: #selector(switchButtonTapped))
        let doneBarButton: UIBarButtonItem = UIBarButtonItem(title: "完成", style: .plain, target: self, action: #selector(doneButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        // Set up tintColor
        switchStationBarButtton.tintColor = SystemColor.orangeBrandColor
        doneBarButton.tintColor           = SystemColor.orangeBrandColor
        
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
//        tapTheViewController()
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
        
    }

    // MARK: - SegmentedControl
    func configureSegmentedControlContainerView () {
        
        // segmentedControlContainerView
        segmentedControlContainerView.backgroundColor = SystemColor.navigationBarColor
        
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
        underlineView.backgroundColor    = SystemColor.orangeBrandColor
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
            underlineView.leadingAnchor.constraint(equalTo: segmentedControlContainerView.leadingAnchor, constant: 60),
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
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        backgroundView.layer.borderColor  = UIColor.lightGray.cgColor
        backgroundView.layer.borderWidth  = 0.2
        backgroundView.dropShadow()
        
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
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
    }
    
    func tapTheViewController () {
        // tapGesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapTheView))
        self.view.addGestureRecognizer(tapGesture)
    }

    // MARK: - ChooseStationTableViewCell Action:
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
        
        var switchStationName = ""
        selectedFromStationRow = switchStationName
        switchStationName = selectedDepatureStationRow
                
        print(switchStationName)
    }
    
    @objc func doneButtonTapped (_ sender: UIButton) {
        pickerStackView.removeFromSuperview()
        print("doneButtonTapped")
    }
    
    @objc func tapTheView (_ sender: UITapGestureRecognizer) {
        pickerStackView.removeFromSuperview()
        print("tapTheView")
    }
    
    //MARK: - Segmented Control Action:
    @objc func segmentedControlTapped (_ sender: UISegmentedControl) {
        print("segmentedControlTapped")
        changeSegmentedControlLinePosition()
        
        switch selectedIndex {
        case 0:
            return
        case 1:
            return
        case 2:
            return
        default:
            break
        }
    }
    
    // MARK: - UIButton Action:
    @objc func speakerBarButtonTapped (_ sender: UIButton) {
        print("speakerBarButtonTapped")
    }
    
    @objc func accountBarButtonTapped (_ sender: UIButton) {
        print("accountBarButtonTapped")
        let accountVC = AccountViewController()
        self.navigationController?.navigationBar.tintColor = SystemColor.white
        self.navigationController?.pushViewController(accountVC, animated: true)
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

            guard let serviceSelectionTableViewCell = serviceTableView.dequeueReusableCell(withIdentifier: ServiceSelectionTableViewCell.identifier, for: indexPath) as? ServiceSelectionTableViewCell else {
                fatalError("Unable to dequeue Resable serviceSelectionTableViewCell")
            }
            
            // Set up selectionStyle, text, image.
            serviceSelectionTableViewCell.selectionStyle = .none
            serviceSelectionTableViewCell.accessoryType = .disclosureIndicator
            
            serviceSelectionTableViewCell.serviceStatusTitleLabel.text = servicesData[indexPath.row].service
            serviceSelectionTableViewCell.serviceImageView.image       = servicesData[indexPath.row].serviceIcon
            serviceSelectionTableViewCell.statusLabel.text             = servicesData[indexPath.row].subtitleService
            
            // Update the status label based on the selected index
            if let selectedIndex = selectedIndex, selectedServiceIndex == indexPath {
                      serviceSelectionTableViewCell.statusLabel.text = names[selectedIndex]
                  } else {
                // Default or previous value
//                serviceSelectionTableViewCell.statusLabel.text = "無偏好"
            }
            return serviceSelectionTableViewCell
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
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath)
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
        pickerView.reloadAllComponents()
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
