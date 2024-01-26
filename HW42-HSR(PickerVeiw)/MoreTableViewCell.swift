//
//  MoreTableViewCell.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Da-wei Hao on 2024/1/26.
//

import UIKit

class MoreTableViewCell: UITableViewCell {
    
    static let identifier = "MoreTableViewCell"
    
    var serviceImageView: UIImageView = UIImageView()
    var serviceTitleLabel: UILabel    = UILabel()

    let stackView: UIStackView        = UIStackView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = Colors.white
        
        configureServiceImageView ()
        configureServiceTitleLabel()
        constriantsStackView      ()
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
        serviceTitleLabel.font          = UIFont.systemFont(ofSize: 17)
    }
    
    func constriantsStackView () {
        // Set up serviceImageView's width & height.
        serviceImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        serviceImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // Set up serviceTitleLabel's width & height.
        serviceTitleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 42).isActive = true
        serviceTitleLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        // Set up stackView
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(serviceImageView)
        stackView.addArrangedSubview(serviceTitleLabel)
        
        stackView.axis         = .horizontal
        stackView.distribution = .fill
        stackView.spacing      = 15
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 393),
            stackView.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    static func nib () -> UINib {
        return UINib(nibName: "MoreTableViewCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

#Preview(traits: .fixedLayout(width: 393, height: 55), body: {
    if let moreTableViewCell = Bundle.main.loadNibNamed("MoreTableViewCell", owner: nil)?.first as? MoreTableViewCell  {
        
        return moreTableViewCell
      } else {
          return UIView()
      }
   })
