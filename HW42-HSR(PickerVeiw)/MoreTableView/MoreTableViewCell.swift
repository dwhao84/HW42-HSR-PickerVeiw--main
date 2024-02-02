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
//        drawLineFromPoint(start: CGPoint(x: 0, y: self.contentView.bounds.height), toPoint: CGPoint(x: self.contentView.bounds.width, y: self.contentView.bounds.height), ofColor: Colors.systemGray4, inView: self.contentView)
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
        return UINib(nibName: "MoreTableViewCell", bundle: nil)
    }
    
}
