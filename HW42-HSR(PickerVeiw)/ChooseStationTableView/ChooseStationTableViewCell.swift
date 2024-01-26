//
//  ChooseStationTableViewCell.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2023/12/26.
//

import UIKit

class ChooseStationTableViewCell: UITableViewCell {
    
    static let identifier = "ChooseStationTableViewCell"
    
    @IBOutlet weak var fromStationButton: UIButton!
    @IBOutlet weak var departureStationButton: UIButton!
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var departureLabel: UILabel!
    
    @IBOutlet weak var ticketStatusSegmentendControl: UISegmentedControl!
    
    static var fromStationButtonText: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // fromLabel
        fromLabel.text               = "起程點"
        fromLabel.textColor          = Colors.pickerViewLightColorForLabel
        fromLabel.numberOfLines      = 0
        fromLabel.font               = .systemFont(ofSize: 13)
        
        // arriveLabel
        departureLabel.text          = "到達站"
        departureLabel.textColor     = Colors.pickerViewLightColorForLabel
        departureLabel.numberOfLines = 0
        departureLabel.font          = .systemFont(ofSize: 13)
        
        // fromLocationLabel
        fromStationButton.setTitle(stationName[0], for: .normal)
        fromStationButton.titleLabel?.textAlignment     = .center
        fromStationButton.tintColor                     = .black
        fromStationButton.isEnabled                     = true
        fromStationButton.isUserInteractionEnabled      = true
        fromStationButton.sizeToFit()
        
        fromStationButton.setTitleColor(Colors.lightGray, for: .highlighted)
        
        // departureStationButton
        departureStationButton.setTitle(stationName[11], for: .normal)
        departureStationButton.titleLabel?.textAlignment = .center
        departureStationButton.tintColor                 = .black
        departureStationButton.isEnabled                 = true
        departureStationButton.isUserInteractionEnabled  = true
        departureStationButton.sizeToFit()
        
        departureStationButton.setTitleColor(Colors.lightGray, for: .highlighted)
        
        let font = UIFont.boldSystemFont(ofSize: 16)
        ticketStatusSegmentendControl.selectedSegmentIndex = 0
        ticketStatusSegmentendControl.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
    }
    
    static func nib () -> UINib {
        return UINib(nibName: "ChooseStationTableViewCell", bundle: nil)
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
