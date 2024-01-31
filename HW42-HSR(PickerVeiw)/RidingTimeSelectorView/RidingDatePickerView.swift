//
//  RidingDatePickerView.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/1/23.
//

import UIKit

class RidingDatePickerView: UIView, UICalendarSelectionSingleDateDelegate {
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
    }
    
    let calendarView: UICalendarView = UICalendarView()
    let stackView: UIStackView       = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI () {
        configureCalendarView ()
        constraintCalendarView()
    }

    func configureCalendarView () {
        let gregorianCalendar = Calendar(identifier: .gregorian)
        calendarView.calendar = gregorianCalendar
        calendarView.locale = Locale(identifier: "zh_TW")
        calendarView.fontDesign = .rounded
        calendarView.tintColor = Colors.orange
        
        let today = Date()
        let calendar = Calendar.current        
        
        let year    = calendar.component(.year,    from: today)
        let month   = calendar.component(.month,   from: today)
        let date    = calendar.component(.day,     from: today)
        
        calendarView.visibleDateComponents = DateComponents(calendar: Calendar(identifier: .gregorian), year: year, month: month, day: date)
        
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = dateSelection
    }
    
    func constriantStackView () {
        self.addSubview(stackView)
        stackView.addArrangedSubview(calendarView)
        stackView.axis         = .horizontal
        stackView.spacing      = 0
        stackView.distribution = .fill
        stackView.alignment    = .center
    }
    
    func constraintCalendarView () {
        self.addSubview(calendarView)
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: self.topAnchor),
            calendarView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            calendarView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            calendarView.heightAnchor.constraint(equalToConstant: 360)
        ])
    }
}

#Preview(traits: .fixedLayout(width: 390, height: 360), body: {
    let ridingDatePickerView = RidingDatePickerView()
    return ridingDatePickerView
   })
