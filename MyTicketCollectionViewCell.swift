//
//  TicketCollectionViewCell.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/2/3.
//

import UIKit

class MyTicketCollectionViewCell: UICollectionViewCell {
    
    // width: 390, height: 35
    let topView: UIView                 = UIView()
    var reservationNumberLabel: UILabel = UILabel()
    var ticketNumber: UILabel           = UILabel()
    
    
    // width: 390, height: 165
    let bottomView: UIView = UIView()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel ()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabel () {
        reservationNumberLabel.frame         = CGRect(x: 0, y: 0, width: 200, height: 20)
        reservationNumberLabel.text          = "訂位代號 07562974"
        reservationNumberLabel.font          = UIFont.systemFont(ofSize: 15)
        reservationNumberLabel.textColor     = Colors.black
        reservationNumberLabel.numberOfLines = 1
        reservationNumberLabel.textAlignment = .left
        topView.addSubview(reservationNumberLabel)
        
        ticketNumber.frame            = CGRect(x: 190, y: 0, width: 200, height: 20)
        ticketNumber.text             = "成人1張"
        ticketNumber.font             = UIFont.systemFont(ofSize: 15)
        ticketNumber.textColor        = Colors.black
        ticketNumber.numberOfLines    = 1
        ticketNumber.textAlignment    = .right
        topView.addSubview(ticketNumber)
        
        topView.layer.borderWidth = 2
        topView.layer.borderColor = Colors.black.cgColor
        topView.backgroundColor   = Colors.clear
        self.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: self.topAnchor),
            topView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        topView.widthAnchor.constraint(equalToConstant: 390).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
    }
    
    
}


#Preview(traits: .fixedLayout(width: 390, height: 200), body: {
    let myTicketCollectionViewCell = MyTicketCollectionViewCell()
    return myTicketCollectionViewCell
   })
