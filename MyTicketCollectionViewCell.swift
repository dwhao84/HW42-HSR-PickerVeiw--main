//
//  TicketCollectionViewCell.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/2/3.
//

import UIKit

class MyTicketCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyTicketCollectionViewCell"
    
    let topView: UIView                 = UIView()      // width: 390, height: 35
    var reservationNumberLabel: UILabel = UILabel()
    var ticketNumberLabel: UILabel      = UILabel()
    
    let stackView: UIStackView = UIStackView()
    let bottomStackView: UIStackView = UIStackView() // width: 390, height: 165
    
    // trainNumberView:
    let trainNumberView: UIView    = UIView()  // width: 390, height: 30
    let ridingDateLabel: UILabel   = UILabel() // 單程・2024/01/21
    let ticketRandomLabel: UILabel = UILabel() // 票號 2900200213160
    
    // trainTimeInfoView
    let trainTimeInfoView: UIView = UIView()   // width: 390, height: 90
    var departureLabel: UILabel   = UILabel()  // 左營
    var destinationLabel: UILabel = UILabel()  // 台北
    
    var departureTimeLabel: UILabel   = UILabel() // 18:55
    var destinationTimeLabel: UILabel = UILabel() // 20:20
    
    // trainInfoView
    let trainInfoView: UIView                  = UIView()  // width: 390, height: 45
    var trainNumberTitleLabel: UILabel         = UILabel() // 車次
    var trainNumberLabel: UILabel              = UILabel() // 152
    
    var carriageNumberTitleLabel: UILabel      = UILabel() // 車廂
    var carriageNumberLabel: UILabel           = UILabel() // 4
    
    var carriageSeatsTitleNumberLabel: UILabel = UILabel() // 座位
    var carriageSeatsNumberLabel: UILabel      = UILabel() // 15A
    
    let trainNumberStackView: UIStackView    = UIStackView()
    let carriageNumberStackView: UIStackView = UIStackView()
    let carriageSeatsStackView: UIStackView  = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTopViewLabels     ()
        constriantsTopView         ()
        
        configureTrainNumberLabels ()
        constraintsTrainNumberView  ()
        
        constaintsTrainTimeInfoView ()
        
        configuretrainInfoLabels    ()
        configureTrainInfoView      ()
        
        
        
        self.backgroundColor = Colors.brightGray
        
        self.layer.borderColor = Colors.black.cgColor
        self.layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Top View
    func configureTopViewLabels () {
        reservationNumberLabel.text          = "訂位代號 07562974"
        reservationNumberLabel.font          = UIFont.systemFont(ofSize: 16)
        reservationNumberLabel.textColor     = Colors.black
        reservationNumberLabel.numberOfLines = 0
        reservationNumberLabel.textAlignment = .left
        topView.addSubview(reservationNumberLabel)
        
        ticketNumberLabel.text             = "成人1張"
        ticketNumberLabel.font             = UIFont.systemFont(ofSize: 16)
        ticketNumberLabel.textColor        = Colors.black
        ticketNumberLabel.numberOfLines    = 0
        ticketNumberLabel.textAlignment    = .right
        topView.addSubview(ticketNumberLabel)
    }
    
    func constriantsTopView () {
        
        //        topView.layer.borderWidth = 2
        //        topView.layer.borderColor = Colors.black.cgColor
        
        topView.backgroundColor   = Colors.clear
        self.addSubview(topView)
        
        topView.translatesAutoresizingMaskIntoConstraints                = false
        reservationNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        ticketNumberLabel.translatesAutoresizingMaskIntoConstraints      = false
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: self.topAnchor),
            topView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topView.widthAnchor.constraint(equalToConstant: 390),
            topView.heightAnchor.constraint(equalToConstant: 35),
            
            reservationNumberLabel.topAnchor.constraint(equalTo: topView.topAnchor),
            reservationNumberLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            reservationNumberLabel.widthAnchor.constraint(equalToConstant: 200),
            reservationNumberLabel.heightAnchor.constraint(equalToConstant: 20),
            
            ticketNumberLabel.topAnchor.constraint(equalTo: topView.topAnchor),
            ticketNumberLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            ticketNumberLabel.widthAnchor.constraint(equalToConstant: 200),
            ticketNumberLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    // MARK: - TrainNumberView
    func configureTrainNumberLabels () {
        ridingDateLabel.text               = "單程・2024/01/21"
        ridingDateLabel.font               = UIFont.systemFont(ofSize: 16)
        ridingDateLabel.textColor          = Colors.black
        ridingDateLabel.numberOfLines      = 1
        ridingDateLabel.textAlignment      = .left
        trainNumberView.addSubview(ridingDateLabel)
        
        ticketRandomLabel.text             = "票號 2900200213160"
        ticketRandomLabel.font             = UIFont.systemFont(ofSize: 16)
        ticketRandomLabel.textColor        = Colors.black
        ticketRandomLabel.numberOfLines    = 1
        ticketRandomLabel.textAlignment    = .right
        trainNumberView.addSubview(ticketRandomLabel)
        
        trainNumberView.backgroundColor = Colors.white
    }
    
    func constraintsTrainNumberView () {
        trainNumberView.layer.borderWidth = 0.5
        trainNumberView.layer.borderColor = Colors.lightGray.cgColor
        
        trainNumberView.layer.cornerRadius = 15
        trainNumberView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        trainNumberView.backgroundColor = Colors.white
        self.addSubview(trainNumberView)
        
        trainNumberView.translatesAutoresizingMaskIntoConstraints  = false
        ridingDateLabel.translatesAutoresizingMaskIntoConstraints   = false
        ticketRandomLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            trainNumberView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            trainNumberView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            trainNumberView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            trainNumberView.heightAnchor.constraint(equalToConstant: 30),
            ridingDateLabel.centerYAnchor.constraint(equalTo: trainNumberView.centerYAnchor),
            ridingDateLabel.leadingAnchor.constraint(equalTo: trainNumberView.leadingAnchor, constant: 15),
            
            ticketRandomLabel.centerYAnchor.constraint(equalTo: trainNumberView.centerYAnchor),
            ticketRandomLabel.trailingAnchor.constraint(equalTo: trainNumberView.trailingAnchor, constant: -15),
        ])
    }
    
    func constaintsTrainTimeInfoView () {
        self.addSubview(trainTimeInfoView)
        trainTimeInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        trainTimeInfoView.backgroundColor = Colors.white
        NSLayoutConstraint.activate([
            trainTimeInfoView.topAnchor.constraint(equalTo: trainNumberView.bottomAnchor),
            trainTimeInfoView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            trainTimeInfoView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            trainTimeInfoView.heightAnchor.constraint(equalToConstant: 90)
        ])
        
    }
    
    func configuretrainInfoLabels () {
        
        // 車次 152
        trainNumberTitleLabel.text             = "車次"
        trainNumberTitleLabel.font             = UIFont.systemFont(ofSize: 16)
        trainNumberTitleLabel.textColor        = Colors.black
        trainNumberTitleLabel.numberOfLines    = 0
        trainNumberTitleLabel.textAlignment    = .center
        trainInfoView.addSubview(trainNumberTitleLabel)
        
        trainNumberLabel.text                  = "152"
        trainNumberLabel.font                  = UIFont.boldSystemFont(ofSize: 22)
        trainNumberLabel.textColor             = Colors.black
        trainNumberLabel.numberOfLines         = 0
        trainNumberLabel.textAlignment         = .center
        trainInfoView.addSubview(trainNumberLabel)
        
        // 車廂 4
        carriageNumberTitleLabel.text          = "車廂"
        carriageNumberTitleLabel.font          = UIFont.systemFont(ofSize: 16)
        carriageNumberTitleLabel.textColor     = Colors.black
        carriageNumberTitleLabel.numberOfLines = 1
        carriageNumberTitleLabel.textAlignment = .center
        trainInfoView.addSubview(carriageNumberTitleLabel)
        
        carriageNumberLabel.text               = "4"
        carriageNumberLabel.font               = UIFont.boldSystemFont(ofSize: 22)
        carriageNumberLabel.textColor          = Colors.black
        carriageNumberLabel.numberOfLines      = 1
        carriageNumberLabel.textAlignment      = .center
        trainInfoView.addSubview(carriageNumberLabel)
        
        // 座位15A
        carriageSeatsTitleNumberLabel.text          = "座位"
        carriageSeatsTitleNumberLabel.font          = UIFont.systemFont(ofSize: 16)
        carriageSeatsTitleNumberLabel.textColor     = Colors.black
        carriageSeatsTitleNumberLabel.numberOfLines = 1
        carriageSeatsTitleNumberLabel.textAlignment = .center
        trainInfoView.addSubview(carriageSeatsTitleNumberLabel)
        
        carriageSeatsNumberLabel.text               = "15A"
        carriageSeatsNumberLabel.font               = UIFont.boldSystemFont(ofSize: 22)
        carriageSeatsNumberLabel.textColor          = Colors.black
        carriageSeatsNumberLabel.numberOfLines      = 1
        carriageSeatsNumberLabel.textAlignment      = .center
        trainInfoView.addSubview(carriageSeatsNumberLabel)
        
        trainInfoView.backgroundColor = Colors.secondBrightGray
    }
    
    func configureTrainInfoView () {
        self.addSubview(trainInfoView)
        trainInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        //        trainInfoView.layer.borderWidth = 0.5
        //        trainInfoView.layer.borderColor = Colors.black.cgColor
        
        trainInfoView.layer.cornerRadius = 15
        trainInfoView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        // trainNumberStackView:
        trainNumberStackView.addArrangedSubview(trainNumberTitleLabel)
        trainNumberStackView.addArrangedSubview(trainNumberLabel)
        
        trainNumberStackView.axis         = .horizontal
        trainNumberStackView.alignment    = .fill
        trainNumberStackView.spacing      = 0
        trainNumberStackView.distribution = .fill
        
        trainInfoView.addSubview(trainNumberStackView)
        trainNumberStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // carriageNumberStackView:
        carriageNumberStackView.addArrangedSubview(carriageNumberTitleLabel)
        carriageNumberStackView.addArrangedSubview(carriageNumberLabel)
        
        carriageNumberStackView.axis         = .horizontal
        carriageNumberStackView.alignment    = .fill
        carriageNumberStackView.spacing      = 0
        carriageNumberStackView.distribution = .fill
        
        trainInfoView.addSubview(carriageNumberStackView)
        carriageNumberStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // carriageSeatsStackView
        carriageSeatsStackView.addArrangedSubview(carriageSeatsTitleNumberLabel)
        carriageSeatsStackView.addArrangedSubview(carriageSeatsNumberLabel)
        
        carriageSeatsStackView.axis         = .horizontal
        carriageSeatsStackView.alignment    = .fill
        carriageSeatsStackView.spacing      = 0
        carriageSeatsStackView.distribution = .fill
        
        trainInfoView.addSubview(carriageSeatsStackView)
        carriageSeatsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            trainInfoView.leadingAnchor.constraint(equalTo:  self.leadingAnchor),
            trainInfoView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            trainInfoView.bottomAnchor.constraint(equalTo:   self.bottomAnchor),
            trainInfoView.heightAnchor.constraint(equalToConstant: 45),
            
            trainNumberStackView.leadingAnchor.constraint(equalTo: trainInfoView.leadingAnchor, constant: 15),
            trainNumberStackView.centerYAnchor.constraint(equalTo: trainInfoView.centerYAnchor),
            
            carriageNumberStackView.centerXAnchor.constraint(equalTo: trainInfoView.centerXAnchor),
            carriageNumberStackView.centerYAnchor.constraint(equalTo: trainInfoView.centerYAnchor),
            
            carriageSeatsStackView.trailingAnchor.constraint(equalTo: trainInfoView.trailingAnchor, constant: -15),
            carriageSeatsStackView.centerYAnchor.constraint(equalTo: trainInfoView.centerYAnchor),
        ])
    }
    
    
    
}


#Preview(traits: .fixedLayout(width: 390, height: 200), body: {
    let myTicketCollectionViewCell = MyTicketCollectionViewCell()
    return myTicketCollectionViewCell
   })
