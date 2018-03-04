//
//  KeepSkillsCell.swift
//  FGOFinder
//
//  Created by okami3363 on 2018/3/1.
//  Copyright © 2018年 okami3363. All rights reserved.
//

import UIKit

class KeepSkillsCell: UITableViewCell {

//    var skillNumberLabel: UILabel!
    var skillImageView: UIImageView!
    var skillNameLabel: UILabel!
    var skillColdDownLabel: UILabel!
    var skillWhenGetLabel: UILabel!
//    var skillDescriptionLabel: UILabel!
    var skillDescriptionArray: [UILabel]!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        
        skillDescriptionArray = []
//        skillNumberLabel = UILabel(frame: CGRect (x: 10, y: 10, width: 45, height: 20))
//        skillNumberLabel.adjustsFontSizeToFitWidth = true
//        skillNumberLabel.backgroundColor = UIColor.red
//        contentView.addSubview(skillNumberLabel)
        
        contentView.backgroundColor = UIColor.gray
        
        skillImageView = UIImageView(frame: CGRect (x: 10, y: 10, width: 50, height: 50))
        contentView.addSubview(self.skillImageView)
        
        skillNameLabel = UILabel(frame: CGRect (x: skillImageView.frame.origin.x+skillImageView.frame.size.width+10, y: skillImageView.frame.origin.y, width: (frame.size.width), height: 14))
//        skillNameLabel.adjustsFontSizeToFitWidth = true
        skillNameLabel.backgroundColor = UIColor.red
        contentView.addSubview(self.skillNameLabel)
        
        skillColdDownLabel = UILabel(frame: CGRect (x: skillNameLabel.frame.origin.x, y: skillNameLabel.frame.origin.y+skillNameLabel.frame.size.height+8, width: skillNameLabel.frame.size.width, height: 14))
        skillColdDownLabel.adjustsFontSizeToFitWidth = true
//        skillColdDownLabel.backgroundColor = UIColor.green
        contentView.addSubview(self.skillColdDownLabel)
        
        skillWhenGetLabel = UILabel(frame: CGRect (x: skillNameLabel.frame.origin.x, y: skillColdDownLabel.frame.origin.y+skillColdDownLabel.frame.size.height, width: skillNameLabel.frame.size.width, height: 14))
        skillWhenGetLabel.adjustsFontSizeToFitWidth = true
//        skillWhenGetLabel.backgroundColor = UIColor.blue
        contentView.addSubview(self.skillWhenGetLabel)
        
        
        for _ in 1...5 {
           let skillDescriptionLabel = UILabel(frame: CGRect (x: skillImageView.frame.origin.x, y: skillImageView.frame.origin.y+skillImageView.frame.size.height, width: frame.size.width-10-10, height: 0))
            
            skillDescriptionLabel.font = UIFont.systemFont(ofSize: 14)
            skillDescriptionLabel.numberOfLines = 99
            contentView.addSubview(skillDescriptionLabel)
            
            skillDescriptionArray.append(skillDescriptionLabel)
        }
        
//        for skillDescriptionLabel in skillDescriptionArray{
//            skillDescriptionLabel = UILabel(frame: CGRect (x: skillImageView.frame.origin.x, y: skillImageView.frame.origin.y+skillImageView.frame.size.height, width: frame.size.width-10-10, height: 0))
//            //        skillDescriptionLabel.adjustsFontSizeToFitWidth = true
//            skillDescriptionLabel.font = UIFont.systemFont(ofSize: 14)
//            skillDescriptionLabel.numberOfLines = 99
//            contentView.addSubview(skillDescriptionLabel)
//        }
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
