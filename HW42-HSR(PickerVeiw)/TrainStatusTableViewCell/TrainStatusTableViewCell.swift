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
        
        statusButton.tintColor = Colors.green

        // drawLine for tableViewCell
        drawLineFromPoint(start: CGPoint(x: 0, y: 45), toPoint: CGPoint(x: 405, y: 45), ofColor: UIColor.systemGray4, inView: self.contentView)
        
        // Call function
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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "TrainStatusTableViewCell", bundle: nil)
    }
    
}
