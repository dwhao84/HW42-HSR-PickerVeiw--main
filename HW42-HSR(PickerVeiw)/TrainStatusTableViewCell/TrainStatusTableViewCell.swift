//
//  TrainStatusTableViewCell.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2023/12/26.
//

import UIKit

class TrainStatusTableViewCell: UITableViewCell {

    static let identifier = "TrainStatusTableViewCell"

    @IBOutlet weak var statusButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "TrainStatusTableViewCell", bundle: nil)
    }
    
}
