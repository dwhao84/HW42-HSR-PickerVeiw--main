//
//  ServiceSelectionTableViewCell.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2023/12/27.
//

import UIKit

class ServiceSelectionTableViewCell: UITableViewCell {

    static let identifier = "ServiceSelectionTableViewCell"

    @IBOutlet weak var serviceImageView: UIImageView!
    @IBOutlet weak var serviceStatusTitleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        serviceStatusTitleLabel.text          = "座位偏好"
        serviceStatusTitleLabel.textAlignment = .left
        serviceStatusTitleLabel.textColor     = .darkGray
        serviceStatusTitleLabel.font          = UIFont.systemFont(ofSize: 15)

        statusLabel.text                      = "無偏好"
        statusLabel.textAlignment             = .left
        statusLabel.textColor                 = .black
        statusLabel.font                      = UIFont.boldSystemFont(ofSize: 17)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static func nib () -> UINib {
        return UINib(nibName: "ServiceSelectionTableViewCell", bundle: nil)
    }
}
