//
//  MaterialCell.swift
//  FGOFinder
//
//  Created by david on 2018/3/20.
//  Copyright © 2018年 okami3363. All rights reserved.
//

import UIKit

class MaterialCell: UITableViewCell {
    
    var intensifyTitleLabel: UILabel!
    var materialArray: [MaterialAmountView]!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        materialArray = []
        setupUI()
    }
    
    func setupUI() -> Void {
        let cellWidth = LayoutFormula().materialCellWidth()
        
        intensifyTitleLabel = UILabel(frame: CGRect(x: 10, y: 0, width: cellWidth, height: 20))
        contentView.addSubview(intensifyTitleLabel)
        
        let width = 50+30
        var x = Int(intensifyTitleLabel.frame.origin.x)
        let y = Int(intensifyTitleLabel.frame.origin.y+intensifyTitleLabel.frame.size.height)
        var i = 1
        for _ in 1...4 {
            var rect = CGRect(x: x, y: y, width: width, height: 50)
            var materialAmountView: MaterialAmountView
            if i == 4 {
                rect = CGRect(x: x, y: 20, width: cellWidth-x, height: 50)
                materialAmountView = MaterialAmountView(frame: rect)
                materialAmountView.showQP()
            }
            else {
                materialAmountView = MaterialAmountView(frame: rect)
            }
            contentView.addSubview(materialAmountView)
            materialArray.append(materialAmountView)
            x+=width
            x+=10
            i+=1
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

class MaterialAmountView: UIView {
    
    var intensifyLabel: UILabel!
    var materialImageView: UIImageView!
    var amountLabel: UILabel!
    var qpLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        materialImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        addSubview(materialImageView)
        
        amountLabel = UILabel(frame: CGRect(x: materialImageView.frame.origin.x+materialImageView.frame.size.width, y: materialImageView.frame.origin.y, width: 30, height: materialImageView.frame.size.height))
        addSubview(amountLabel)
        
        qpLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: materialImageView.frame.size.height))
        qpLabel.textAlignment = .right
        qpLabel.isHidden = true
        addSubview(qpLabel)
    }
    
    func showQP() -> Void {
        materialImageView.isHidden = true
        amountLabel.isHidden = true
        qpLabel.isHidden = false
    }
}
