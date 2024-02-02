//
//  MoreTableViewCell.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/2/1.
//

import UIKit

class MoreTableViewCell: UITableViewCell {
    
    static let identifier = "MoreTableViewCell"
    
    @IBOutlet var serviceImageView: UIImageView!
    @IBOutlet var serviceTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    func setupUI () {
        self.backgroundColor = Colors.white
        configureServiceImageView ()
        configureServiceTitleLabel()
    }
    
    func configureServiceImageView () {
        serviceImageView.tintColor   = Colors.darkGray
        serviceImageView.image       = Images.clock
        serviceImageView.contentMode = .scaleAspectFit
    }
    
    func configureServiceTitleLabel() {
        serviceTitleLabel.textColor     = Colors.darkGray
        serviceTitleLabel.text          = "高鐵時刻表"
        serviceTitleLabel.textAlignment = .left
        serviceTitleLabel.numberOfLines = 0
        serviceTitleLabel.font          = UIFont.boldSystemFont(ofSize: 17)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib () -> UINib {
        return UINib(nibName: "MoreTableViewCell", bundle: nil)
    }
    
}
