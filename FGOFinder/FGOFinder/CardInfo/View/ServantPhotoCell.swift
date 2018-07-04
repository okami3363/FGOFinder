//
//  ServantPhotoCell.swift
//  FGOFinder
//
//  Created by okami3363 on 2018/2/14.
//  Copyright © 2018年 okami3363. All rights reserved.
//

import UIKit

class ServantPhotoCell: UICollectionViewCell {
    
    var servantImageView: UIImageView!
    var servantImageDefaultRect: CGRect!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() -> Void {
        contentView.layer.masksToBounds = true
        
        servantImageDefaultRect = CGRect(x: 0, y: 0, width: frame.size.width*2, height: frame.size.height)
        
        servantImageView = UIImageView(frame: servantImageDefaultRect)
        servantImageView.contentMode = .scaleAspectFit
        contentView.addSubview(servantImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
