//
//  ServantModel.swift
//  FGOFinder
//
//  Created by okami3363 on 2018/3/8.
//  Copyright © 2018年 okami3363. All rights reserved.
//

import UIKit

class ServantModel: NSObject {
    
    var keepSkillsArrry: [KeepSkillModel]?
    
    override init() {
        super.init()
        keepSkillsArrry = [KeepSkillModel(), KeepSkillModel(), KeepSkillModel()]
    }
}

class KeepSkillModel: NSObject {
    
    var keepSkillDescriptionArrry: [String]?
    var keepSkillDescriptionSizeArray: [CGSize]?
    var titleDescriptionHeight: Int!
    
    override init() {
        super.init()
        keepSkillDescriptionArrry = ["對自身隨機賦予各種效果[Lv.]\n以機率賦予弱體無效狀態[Lv.](1回合)\n┗以機率賦予即死無效狀態[Lv.](1回合)\n┗以機率賦予強化解除耐性提升100%[Lv.](1回合)\n60%|62%|64%|66%|68%|70%|72%|74%|76%|78%|80%", "┗對自身賦予無敵狀態(1回合)\n---",]
        
        keepSkillDescriptionSizeArray = []
        var title = 0
        for description in keepSkillDescriptionArrry! {
            let descriptionSize =  LayoutFormula().sizeOfStringAndFont(string: description, font: UIFont.systemFont(ofSize: 14))
            keepSkillDescriptionSizeArray?.append(descriptionSize)
            title += Int(descriptionSize.height)
        }
        titleDescriptionHeight = title
        
    }
}
