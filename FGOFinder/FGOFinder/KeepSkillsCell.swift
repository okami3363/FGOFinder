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
    var skillDescriptionLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        skillImageView = UIImageView(frame: CGRect (x: 0, y: 0, width: 40, height: 40))
        contentView.addSubview(self.skillImageView)
        
        skillDescriptionLabel = UILabel(frame: CGRect (x: skillImageView.frame.origin.x+skillImageView.frame.size.width+10, y: skillImageView.frame.origin.y, width: frame.size.width-(frame.origin.x+skillImageView.frame.size.width+10), height: frame.size.height))
        contentView.addSubview(self.skillDescriptionLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
