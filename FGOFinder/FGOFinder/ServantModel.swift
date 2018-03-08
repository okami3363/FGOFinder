//
//  ServantModel.swift
//  FGOFinder
//
//  Created by okami3363 on 2018/3/8.
//  Copyright © 2018年 okami3363. All rights reserved.
//

import UIKit

class ServantModel: NSObject {
    
    var servantPhotoArray: [UIImage]!
    var keepSkillsArrry: [KeepSkillModel]!
    
    override init() {
        super.init()
        servantPhotoArray = [UIImage.init(named: "303200a")!, UIImage.init(named: "303200a")!, UIImage.init(named: "303200b")!, UIImage.init(named: "303200b")!]
        
        let keepSkill1 = KeepSkillModel()
        keepSkill1.iconURL = "SkillIcon_403"
        keepSkill1.name = "秘められた大王冠 A"
        keepSkill1.coldDown = "冷卻8回合"
        keepSkill1.whenGet = "初期"
        keepSkill1.descriptionArrry = ["對自身隨機賦予各種效果[Lv.]\n以機率賦予弱體無效狀態[Lv.](1回合)\n┗以機率賦予即死無效狀態[Lv.](1回合)\n┗以機率賦予強化解除耐性提升100%[Lv.](1回合)\n[60%|62%|64%|66%|68%|70%|72%|74%|76%|78%|80%]", "┗對自身賦予無敵狀態(1回合)",]
        
        let keepSkill2 = KeepSkillModel()
        keepSkill2.iconURL = "SkillIcon_306"
        keepSkill2.name = "魔力放出（檻） A+"
        keepSkill2.coldDown = "冷卻8回合"
        keepSkill2.whenGet = "靈基再臨第1階段"
        keepSkill2.descriptionArrry = ["自身的Buster卡性能提升[Lv.](1回合)\n[30%|32%|34%|36%|38%|40%|42%|44%|46%|48%|50%]", "┗NP增加[Lv.]\n[30%|32%|34%|36%|38%|40%|42%|44%|46%|48%|50%]",]
        
        let keepSkill3 = KeepSkillModel()
        keepSkill3.iconURL = "SkillIcon_1004"
        keepSkill3.name = "冥界の護り EX"
        keepSkill3.coldDown = "冷卻8回合"
        keepSkill3.whenGet = "靈基再臨第3階段"
        
        keepSkill3.descriptionArrry = ["對我方全體賦予〔冥界加護〕狀態<能受到寶具「霊峰踏抱く冥府の鞴」追加效果狀態>(3回合)", "┗防禦力提升[Lv.](3回合)\n[10%|11%|12%|13%|14%|15%|16%|17%|18%|19%|20%]", "┗NP獲得量提升[Lv.](3回合)\n[20%|21%|22%|23%|24%|25%|26%|27%|28%|29%|30%]", "┗最大HP提升[Lv.](3回合)\n[2000|2100|2200|2300|2400|2500|2600|2700|2800|2900|3000]"]
        
        keepSkillsArrry = [keepSkill1, keepSkill2, keepSkill3]
    }
}

class KeepSkillModel: NSObject {
    
    var iconURL: String!
    var name: String!
    var coldDown: String!
    var whenGet: String!
    private var _descriptionArrry: [String]?
    var descriptionArrry: [String]? {
        get {
            return _descriptionArrry
        }
        set {
            _descriptionArrry = newValue
            var title = 0
            for description in _descriptionArrry! {
                let descriptionSize =  LayoutFormula().sizeOfStringAndFont(string: description, font: UIFont.systemFont(ofSize: 14))
                descriptionSizeArray?.append(descriptionSize)
                title += Int(descriptionSize.height)
            }
            titleDescriptionHeight = title
        }
    }
    var descriptionSizeArray: [CGSize]?
    var titleDescriptionHeight: Int!
    
    override init() {
        super.init()
        descriptionSizeArray = []
    }
}
