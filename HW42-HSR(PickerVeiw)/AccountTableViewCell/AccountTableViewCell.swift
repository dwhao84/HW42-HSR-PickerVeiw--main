//
//  AccountTableViewCell.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/1/17.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    static let identifier = "AccountTableViewCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var serviceTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        iconImageView.tintColor     = SystemColor.darkGray
        serviceTitleLabel.textColor = SystemColor.darkGray
        serviceTitleLabel.font = UIFont.boldSystemFont(ofSize: 17)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "AccountTableViewCell", bundle: nil)
    }
    
}
