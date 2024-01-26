//
//  ServiceTableViewCell.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2024/1/21.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var serviceStatusLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var serviceImageView: UIImageView!
    
    static let identifier = "ServiceTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       serviceStatusLabel.text          = "座位偏好"
       serviceStatusLabel.textAlignment = .left
       serviceStatusLabel.textColor     = Colors.lightGray
       serviceStatusLabel.font          = UIFont.systemFont(ofSize: 15)
       
       statusLabel.text                 = "無偏好"
       statusLabel.textAlignment        = .left
       statusLabel.textColor            = .black
       statusLabel.font                 = UIFont.boldSystemFont(ofSize: 16)

       serviceImageView.tintColor       = Colors.lightGray
       serviceImageView.alpha           = 0.4
        
       // drawLine for tableViewCell
       drawLineFromPoint(start: CGPoint(x: 40, y: 75), toPoint: CGPoint(x: 365, y: 75), ofColor: UIColor.systemGray4, inView: self.contentView)
        
    }
    
    func drawLineFromPoint(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {
        //design the path
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        //design path in layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 1.0

        view.layer.addSublayer(shapeLayer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib () -> UINib {
        return UINib(nibName: "ServiceTableViewCell", bundle: nil)
    }
    
    
}
