//
//  ServantModel.swift
//  FGOFinder
//
//  Created by okami3363 on 2018/3/8.
//  Copyright © 2018年 okami3363. All rights reserved.
//

import UIKit

class ServantModel: NSObject {
    
    var iconURL: String!
    
    var photosArray: [String]!
    var keepSkillsArrry: [KeepSkillModel]!
    var careerSkillsArrry: [CareerSkillModel]!
    var npArray:[NoblePhantasmsModel]!
    
    override init() {
        super.init()
        iconURL = "https://kazemai.github.io/fgo-vz/common/images/icon/faces/3032000.png"
        
        photosArray = ["https://kazemai.github.io/fgo-vz/common/images/CharaGraph/303200a.png",
                             "https://kazemai.github.io/fgo-vz/common/images/CharaGraph/303200a.png",
                             "https://kazemai.github.io/fgo-vz/common/images/CharaGraph/303200b.png",
                             "https://kazemai.github.io/fgo-vz/common/images/CharaGraph/303200b.png"]
        
        let keepSkill1 = KeepSkillModel()
        keepSkill1.iconURL = "https://kazemai.github.io/fgo-vz/common/images/SkillIcon/SkillIcon_403.png"
        keepSkill1.name = "秘められた大王冠 A"
        keepSkill1.coldDown = "冷卻8回合"
        keepSkill1.whenGet = "初期"
        keepSkill1.descriptionArrry = ["對自身隨機賦予各種效果[Lv.]\n以機率賦予弱體無效狀態[Lv.](1回合)\n┗以機率賦予即死無效狀態[Lv.](1回合)\n┗以機率賦予強化解除耐性提升100%[Lv.](1回合)\n    [60%|62%|64%|66%|68%|70%|72%|74%|76%|78%|80%]", "┗對自身賦予無敵狀態(1回合)",]
        
        let keepSkill2 = KeepSkillModel()
        keepSkill2.iconURL = "https://kazemai.github.io/fgo-vz/common/images/SkillIcon/SkillIcon_306.png"
        keepSkill2.name = "魔力放出（檻） A+"
        keepSkill2.coldDown = "冷卻8回合"
        keepSkill2.whenGet = "靈基再臨第1階段"
        keepSkill2.descriptionArrry = ["自身的Buster卡性能提升[Lv.](1回合)\n    [30%|32%|34%|36%|38%|40%|42%|44%|46%|48%|50%]", "┗NP增加[Lv.]\n    [30%|32%|34%|36%|38%|40%|42%|44%|46%|48%|50%]",]
        
        let keepSkill3 = KeepSkillModel()
        keepSkill3.iconURL = "https://kazemai.github.io/fgo-vz/common/images/SkillIcon/SkillIcon_1004.png"
        keepSkill3.name = "冥界の護り EX"
        keepSkill3.coldDown = "冷卻8回合"
        keepSkill3.whenGet = "靈基再臨第3階段"
        
        keepSkill3.descriptionArrry = ["對我方全體賦予〔冥界加護〕狀態<能受到寶具「霊峰踏抱く冥府の鞴」追加效果狀態>(3回合)", "┗防禦力提升[Lv.](3回合)\n    [10%|11%|12%|13%|14%|15%|16%|17%|18%|19%|20%]", "┗NP獲得量提升[Lv.](3回合)\n    [20%|21%|22%|23%|24%|25%|26%|27%|28%|29%|30%]", "┗最大HP提升[Lv.](3回合)\n    [2000|2100|2200|2300|2400|2500|2600|2700|2800|2900|3000]"]
        
        keepSkillsArrry = [keepSkill1, keepSkill2, keepSkill3]
        
        let careerSkill1 = CareerSkillModel()
        careerSkill1.iconURL = "https://kazemai.github.io/fgo-vz/common/images/SkillIcon/SkillIcon_100.png"
        careerSkill1.name = "対魔力 D"
        careerSkill1.descriptionArrry = ["自身的弱體耐性稍微提升：12.5%"]
        
        let careerSkill2 = CareerSkillModel()
        careerSkill2.iconURL = "https://kazemai.github.io/fgo-vz/common/images/SkillIcon/SkillIcon_104.png"
        careerSkill2.name = "陣地作成 A+"
        careerSkill2.descriptionArrry = ["自身的Arts卡性能提升：11%"]
        
        let careerSkill3 = CareerSkillModel()
        careerSkill3.iconURL = "https://kazemai.github.io/fgo-vz/common/images/SkillIcon/SkillIcon_301.png"
        careerSkill3.name = "女神の神核 B"
        careerSkill3.descriptionArrry = ["對自身賦予傷害加成狀態：225\n┗弱體耐性提升：22.5%"]
        
        careerSkillsArrry = [careerSkill1, careerSkill2, careerSkill3]
        
        let np = NoblePhantasmsModel()
        np.iconURL = "https://kazemai.github.io/fgo-vz/common/images/icon/cmdCard/icon_cmdCard_2.png"
        np.name = "霊峰踏抱く冥府の鞴"
        np.descriptionArrry = ["自身的Buster卡性能提升(1回合)\n┗< OverCharge的話效果提升>\n    [10%|20%|30%|40%|50%]", "┗對敵全體的強力攻擊[Lv.]\n    [300%|400%|450%|475%|500%]", "┗〔冥界加護〕狀態的我方全體的攻擊力提升(3回合)\n    [20%]"]
        npArray = [np]
    }
}

class NoblePhantasmsModel: KeepSkillModel {
    
}

class CareerSkillModel: KeepSkillModel {
    
}

class KeepSkillModel: NSObject {
    
    var iconURL: String!
    var name: String!
    var coldDown: String!
    var whenGet: String!
    private var _descriptionArrry: [String]?
    var descriptionSizeArray: [CGRect]?
    var titleDescriptionHeight: Int!
    
    var descriptionArrry: [String]? {
        get {
            return _descriptionArrry
        }
        set {
            _descriptionArrry = newValue
            var title = 0
            let x: CGFloat = 10
            var y: CGFloat = 10+50+8
            var i = 0
            for description in _descriptionArrry! {
                let descriptionSize =  LayoutFormula().sizeOfStringAndFont(string: description, font: UIFont.systemFont(ofSize: 14))
                descriptionSizeArray?.append(CGRect (x: x, y: y, width: descriptionSize.width, height: descriptionSize.height))
                title += Int(descriptionSize.height)
                y += descriptionSize.height
                i += 1
            }
            titleDescriptionHeight = title
        }
    }
    
    override init() {
        super.init()
        descriptionSizeArray = []
    }
}
