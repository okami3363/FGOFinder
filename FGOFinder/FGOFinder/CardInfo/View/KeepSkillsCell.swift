//
//  KeepSkillsCell.swift
//  FGOFinder
//
//  Created by okami3363 on 2018/3/1.
//  Copyright © 2018年 okami3363. All rights reserved.
//

import UIKit

class KeepSkillsCell: UITableViewCell {

    var skillImageView: UIImageView!
    var skillNameLabel: UILabel!
    var skillColdDownLabel: UILabel!
    var skillWhenGetLabel: UILabel!
    var skillDescriptionLabelArray: [UILabel]!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        skillDescriptionLabelArray = []
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
//        contentView.backgroundColor = UIColor.gray
        
        skillImageView = UIImageView(frame: CGRect (x: 10, y: 10, width: 50, height: 50))
        skillImageView.contentMode = .scaleAspectFit
        contentView.addSubview(self.skillImageView)
        
        skillNameLabel = UILabel(frame: CGRect (x: skillImageView.frame.origin.x+skillImageView.frame.size.width+10, y: skillImageView.frame.origin.y, width: (frame.size.width), height: 16))
//        skillNameLabel.adjustsFontSizeToFitWidth = true
//        skillNameLabel.backgroundColor = UIColor.red
        contentView.addSubview(self.skillNameLabel)
        
        skillColdDownLabel = UILabel(frame: CGRect (x: skillNameLabel.frame.origin.x, y: skillNameLabel.frame.origin.y+skillNameLabel.frame.size.height+4, width: skillNameLabel.frame.size.width, height: 14))
        skillColdDownLabel.adjustsFontSizeToFitWidth = true
//        skillColdDownLabel.backgroundColor = UIColor.green
        contentView.addSubview(self.skillColdDownLabel)
        
        skillWhenGetLabel = UILabel(frame: CGRect (x: skillNameLabel.frame.origin.x, y: skillColdDownLabel.frame.origin.y+skillColdDownLabel.frame.size.height+2, width: skillNameLabel.frame.size.width, height: 14))
        skillWhenGetLabel.adjustsFontSizeToFitWidth = true
//        skillWhenGetLabel.backgroundColor = UIColor.blue
        contentView.addSubview(self.skillWhenGetLabel)
        
        for _ in 1...5 {
           let skillDescriptionLabel = UILabel(frame: CGRect (x: skillImageView.frame.origin.x, y: skillImageView.frame.origin.y+skillImageView.frame.size.height+8, width: frame.size.width-10-10, height: 0))
            
            skillDescriptionLabel.font = UIFont.systemFont(ofSize: 14)
            skillDescriptionLabel.numberOfLines = 99
            contentView.addSubview(skillDescriptionLabel)
            
            skillDescriptionLabelArray.append(skillDescriptionLabel)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
