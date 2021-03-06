//
//  CardCell.swift
//  FGOFinder
//
//  Created by okami3363 on 2018/2/10.
//  Copyright © 2018年 okami3363. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    var cardImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() -> Void {
        cardImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        contentView.addSubview(self.cardImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
