//
//  KeepSkillsCell.swift
//  FGOFinder
//
//  Created by okami3363 on 2018/3/1.
//  Copyright © 2018年 okami3363. All rights reserved.
//

import UIKit

class KeepSkillsCell: UITableViewCell {

    var skillNumberLabel: UILabel!
    var skillImageView: UIImageView!
    var skillDescriptionLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        skillNumberLabel = UILabel(frame: CGRect (x: 10, y: 10, width: 45, height: 20))
        contentView.addSubview(skillNumberLabel)
        
        skillImageView = UIImageView(frame: CGRect (x: skillNumberLabel.frame.origin.x+skillNumberLabel.frame.size.width+10, y: skillNumberLabel.frame.origin.y, width: 60, height: 60))
        contentView.addSubview(self.skillImageView)
        
        skillDescriptionLabel = UILabel(frame: CGRect (x: skillImageView.frame.origin.x+skillImageView.frame.size.width+10, y: skillImageView.frame.origin.y, width: frame.size.width-(frame.origin.x+skillImageView.frame.size.width+10), height: skillImageView.frame.size.height))
        contentView.addSubview(self.skillDescriptionLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
