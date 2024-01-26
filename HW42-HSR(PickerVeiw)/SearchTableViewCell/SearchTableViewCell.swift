//
//  SearchTableViewCell.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2023/12/25.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    static let identifier = "SearchTableViewCell"

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var savedItinerariesButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.backgroundColor   = .white
        searchButton.tintColor = Colors.orange
        searchButton.setBackgroundColor(Colors.orangeBrandColor, for: .normal)
        searchButton.setBackgroundColor(Colors.orangeBrandColorSelected, for: .highlighted)
    }

    static func nib () -> UINib {
        return UINib(nibName: "SearchTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
