//
//  RidingTimeViewController.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/1/21.
//

import UIKit

class RidingTimeViewController: UIViewController, UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        
    }
    let backgroundView: UIView           = UIView()
    let lineView = UIView()
        
    let datePickerStackView: UIStackView = UIStackView()
    let buttonsStackView: UIStackView    = UIStackView()
    let bottomStackView: UIStackView     = UIStackView()
    
    let calendarView: UICalendarView = UICalendarView()
    let showButton: UIButton  = UIButton(type: .system)
    
    let depatureTitleLabel: UILabel = UILabel()
    let todayButton: UIButton = UIButton(type: .system)
    let finishButton: UIButton  = UIButton(type: .system)
    
    let fromTitleLabel: UILabel        = UILabel()
    
    let fromTimeTextField: UITextField = UITextField()
    let datePicker: UIDatePicker       = UIDatePicker()
    
    let buttonHeight: CGFloat    = 45
    let textFieldHeight: CGFloat = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Basic UI
        setupBackgroundColor()
        setupNavigationBar  ()
        
        // backgroundView
        setupBackgroundView ()
        constraintsBackgroundView()
        constraintsCalendarView  ()
        
        configureDatePicker()
        configureTodayButton()
        configureFinishButton()
        configureFromTextField()
        configureFromTitleLabel()
        
        configureCalendarView()
        
        configureDatePickerStackView ()
        configureButtonsStackView    ()
        configureBottomStackView     ()
        fromTimeTextField.text = getCurrentTimeAndUpdateContext ()
    }
    
    func dismissOrPopViewController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupBackgroundView () {
        backgroundView.backgroundColor = Colors.white
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.borderColor  = UIColor.lightGray.cgColor
        backgroundView.layer.borderWidth  = 0.2
        backgroundView.dropShadow()
    }

    func constraintsBackgroundView () {
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            backgroundView.heightAnchor.constraint(equalToConstant: 570)
        ])
    }
    
    func constraintsCalendarView() {
        backgroundView.addSubview(calendarView)
        calendarView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            calendarView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            calendarView.heightAnchor.constraint(equalToConstant: 340),
        ])

        lineView.backgroundColor = Colors.systemGray4
        calendarView.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: calendarView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: calendarView.trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: calendarView.bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }

    func configureDatePickerStackView () {
        datePickerStackView.axis         = .vertical
        datePickerStackView.distribution = .fill
        datePickerStackView.alignment    = .leading
        datePickerStackView.spacing      = 10
        datePickerStackView.addArrangedSubview(fromTitleLabel)
        datePickerStackView.addArrangedSubview(fromTimeTextField)
    }
    
    func configureButtonsStackView () {
        buttonsStackView.axis         = .vertical
        buttonsStackView.distribution = .fill
        buttonsStackView.alignment    = .center
        buttonsStackView.spacing      = 20
        buttonsStackView.addArrangedSubview(todayButton)
        buttonsStackView.addArrangedSubview(finishButton)
    }
    
    func configureBottomStackView () {
        bottomStackView.axis         = .vertical
        bottomStackView.distribution = .fill
        bottomStackView.alignment    = .center
        bottomStackView.spacing      = 15
        bottomStackView.addArrangedSubview(datePickerStackView)
        bottomStackView.addArrangedSubview(buttonsStackView)
        backgroundView.addSubview(bottomStackView)
        
        todayButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 370).isActive = true
        todayButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        finishButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 370).isActive = true
        finishButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        fromTimeTextField.widthAnchor.constraint(equalToConstant: 370).isActive = true
        fromTitleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        bottomStackView.widthAnchor.constraint(equalToConstant: 390).isActive = true
        
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: lineView.bottomAnchor),
            bottomStackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -15),
            bottomStackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            bottomStackView.widthAnchor.constraint(equalToConstant: 390)
        ])
    }
    
    func setupBackgroundColor () {
        self.view.backgroundColor = Colors.brightGray
    }
    
    func setupNavigationBar () {
        // Set up titleText color in appearance.
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Colors.navigationBarColor
        appearance.titleTextAttributes = [.foregroundColor: Colors.white]
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationController?.isNavigationBarHidden      = false
        self.navigationItem.title  = "選擇出發日期與時間"
        self.navigationItem.titleView?.tintColor = .white
    }
    
    // MARK: - Calendar View:
    func configureCalendarView () {
        let gregorianCalendar   = Calendar(identifier: .gregorian)
        calendarView.calendar   = gregorianCalendar
        calendarView.locale     = Locale(identifier: "zh_TW")
        calendarView.fontDesign = .rounded
        calendarView.tintColor  = Colors.orange
        
        let today = Date()
        let calendar = Calendar.current
        
        let year    = calendar.component(.year,    from: today)
        let month   = calendar.component(.month,   from: today)
        let date    = calendar.component(.day,     from: today)
        
        calendarView.visibleDateComponents = DateComponents(calendar: Calendar(identifier: .gregorian), year: year, month: month, day: date)
        
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = dateSelection
    }
    
    // MARK: - Bottom View
    // finishButton & todayButton & timeTextField
    func configureFromTitleLabel () {
        fromTitleLabel.text          = "出發時間"
        fromTitleLabel.textColor     = Colors.lightGray
        fromTitleLabel.font          = UIFont.systemFont(ofSize: 17)
        fromTitleLabel.numberOfLines = 0
    }
    
    func configureTodayButton () {
        todayButton.setTitle("今天", for: .normal)
        todayButton.backgroundColor    = Colors.white
        todayButton.tintColor          = Colors.orangeBrandColor
        todayButton.layer.cornerRadius = buttonHeight / 8
        todayButton.clipsToBounds      = true
        todayButton.layer.borderColor  = Colors.orangeBrandColor.cgColor
        todayButton.layer.borderWidth  = 1
    }
    
    func configureFinishButton () {
        finishButton.setTitle("完成", for: .normal)
        finishButton.setBackgroundColor(Colors.orangeBrandColor, for: .normal)
        finishButton.setBackgroundColor(Colors.orangeBrandColorSelected, for: .highlighted)
        finishButton.tintColor          = Colors.white
        finishButton.layer.cornerRadius = buttonHeight / 8
        finishButton.clipsToBounds      = true
        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
    }
    
    func getCurrentTimeAndUpdateContext () -> String {
        let calendar = Calendar.current                             // Get the information from calendar.
        let currentTime = calendar.component(.minute, from: Date()) // Get the current time by minute and from now date.
        let addFiveMins = (5 - currentTime % 5)                     // Use the 5mins as unit, and calculate time from 5mins to minus currentTime.
        let date = calendar.date(byAdding: .minute, value: addFiveMins, to: Date()) // Append time different to set up as 5mins as uint.
        
        let dateFormatter        = DateFormatter()
        dateFormatter.calendar   = Calendar(identifier: .iso8601)
        dateFormatter.locale     = Locale(identifier: "zh-TW")         // Set up local time as "zh-TW"
        dateFormatter.timeZone   = .current                            // Get the current timeZone.
        dateFormatter.dateFormat = "HH:mm"                             // Set up dateFormat for date.
        let current = dateFormatter.string(from: date!)           // Format the date by using dateFormatter.string to a string.
        let selectedTimeAddText = current + " 後出發"
        return selectedTimeAddText
    }
    
    func configureFromTextField () {
        fromTimeTextField.delegate = self
        // Set up fromTimeTextField content.
        fromTimeTextField.text        = getCurrentTimeAndUpdateContext ()
        fromTimeTextField.textColor   = Colors.darkGray
        fromTimeTextField.borderStyle = .none
        fromTimeTextField.isUserInteractionEnabled = true

        // Set up rightView for textField.
        fromTimeTextField.rightViewMode = UITextField.ViewMode.always
        fromTimeTextField.rightViewMode = .always
        
        // Set up arrowTriangleView as imageView.
        let arrowTriangleImageView = UIImageView(image: UIImage(systemName: "arrowtriangle.down.fill"))
        arrowTriangleImageView.tintColor = Colors.navigationBarColor
        fromTimeTextField.rightView = arrowTriangleImageView
                
        configureDatePicker ()
        
        fromTimeTextField.inputView = datePicker
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        doneButton.tintColor = Colors.orangeBrandColor
        let flexibleSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolBar.setItems([flexibleSpace, doneButton], animated: true)
        
        fromTimeTextField.inputAccessoryView = toolBar
    }
    
    func configureDatePicker () {
        let calendar = Calendar.current
        let currentTime = calendar.component(.minute, from: Date()) // Get the current time by minute and from now date.
        let addFiveMins = (5 - currentTime % 5)                     // Use the 5mins as unit, and calculate time from 5mins to minus currentTime.
        guard let date = calendar.date(byAdding: .minute, value: addFiveMins, to: Date()) else {
            datePicker.date = Date()
            print(datePicker.date)
            return
        }
        datePicker.date = date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.minuteInterval = 5
        datePicker.datePickerMode = .time
    }
    
    // Actions
    @objc func doneButtonTapped () {
        print("DEBUG PRINT: doneButtonTapped")
        self.view.endEditing(true)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let selectedTime = dateFormatter.string(from: datePicker.date)
        let selectedTimeAddText = selectedTime + " 後出發"
        fromTimeTextField.text = selectedTimeAddText
    }
    
    @objc func todayButtonTapped () {
        print("DEBUG PRINT: todayButtonTapped")
        fromTimeTextField.text = getCurrentTimeAndUpdateContext ()
        print("\(fromTimeTextField.text!), 回復成現在的時間")
    }
    
    @objc func finishButtonTapped () {
        print("DEBUG PRINT: finishButtonTapped")
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension RidingTimeViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        fromTimeTextField.inputView = datePicker
        fromTimeTextField.inputView = datePicker
        return true
    }
}

#Preview {
    UINavigationController(rootViewController: RidingTimeViewController())
}
