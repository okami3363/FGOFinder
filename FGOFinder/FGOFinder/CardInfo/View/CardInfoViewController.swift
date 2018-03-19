//
//  CardInfoViewControlle.swift
//  FGOFinder
//
//  Created by david on 2018/2/13.
//  Copyright © 2018年 okami3363. All rights reserved.
//

import UIKit
import Kingfisher

class CardInfoViewController: UIViewController, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {
    
    var backButton: UIButton!
    
    var collectionView: UICollectionView!
    
    var servantPhotoHeight: CGFloat!
    var servantPhotoWidth: CGFloat!
    
    var tableView: UITableView!
    
    var nameLabel: UILabel!
    var skillButton: UIButton!
    var materialButton: UIButton!
    
    var servantModel: ServantModel!
    var servantSkillDataSource: [Array<Any>]!

    override func viewDidLoad() -> Void {
        super.viewDidLoad()
        setupUI()
        setupDataSource()
    }
    
    override func didReceiveMemoryWarning() -> Void {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Func
    func setupDataSource() -> Void {
        servantModel = ServantModel()
        servantSkillDataSource = [servantModel.keepSkillsArrry, servantModel.careerSkillsArrry, servantModel.npArray];
        nameLabel.text = "艾蕾修卡"
//        collectionView.reloadData()
        
        performSelector(onMainThread: #selector(scrollToDefaultServantPhoto), with: nil, waitUntilDone: false)
    }
    
    @objc func scrollToDefaultServantPhoto() -> Void {
        let rect = CGRect (x: servantPhotoWidth*3, y: 0, width: servantPhotoWidth, height: servantPhotoHeight)
        self.collectionView.scrollRectToVisible(rect, animated: false)
    }
    
    func setupUI() -> Void {
        view.backgroundColor = UIColor.white
        
        additionalSafeAreaInsets = LayoutFormula().landscapeAdditionalSafeAreaInsets()
        
        backButton = UIButton.init(type: .custom)
        backButton.frame = CGRect (x: 0, y: 0, width: additionalSafeAreaInsets.left+15, height: additionalSafeAreaInsets.left)
        backButton.setTitle("<", for: .normal)
        backButton.setTitleColor(UIColor.black, for: .normal)
//        backButton.layer.borderColor = UIColor.blue.cgColor
//        backButton.layer.borderWidth = 1
        backButton.addTarget(self, action: #selector(backAction(sender:)), for: .touchUpInside)
        view.addSubview(backButton)
        
        servantPhotoWidth = LayoutFormula().servantPhotoSize().width
        servantPhotoHeight = LayoutFormula().servantPhotoSize().height
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize (width: servantPhotoWidth, height: servantPhotoHeight)
        
        collectionView = UICollectionView.init(frame: CGRect (x: backButton.frame.origin.x+backButton.frame.size.width, y: 0, width: servantPhotoWidth, height: servantPhotoHeight), collectionViewLayout:layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.register(ServantPhotoCell.self, forCellWithReuseIdentifier: NSStringFromClass(ServantPhotoCell.self))
        view.addSubview(collectionView)
        
        nameLabel = UILabel.init(frame: CGRect (x: collectionView.frame.origin.x+collectionView.frame.size.width, y: 0, width: UIScreen.main.bounds.size.width-(collectionView.frame.origin.x+collectionView.frame.size.width)-additionalSafeAreaInsets.right, height: additionalSafeAreaInsets.left))
//        nameLabel.backgroundColor = UIColor.blue
        nameLabel.numberOfLines = 2
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        
        var actionButtonWidth = (UIScreen.main.bounds.size.width-(collectionView.frame.origin.x+collectionView.frame.size.width)-(10*3))/2
        actionButtonWidth = ceil(actionButtonWidth)
        skillButton = UIButton.init(type: .custom)
        skillButton.frame = CGRect (x: nameLabel.frame.origin.x+10, y: nameLabel.frame.origin.y+nameLabel.frame.size.height, width: actionButtonWidth, height: 44)
        skillButton.setTitle("技能寶具", for: .normal)
        skillButton.setTitleColor(UIColor.black, for: .normal)
        skillButton.layer.borderWidth = 1
        skillButton.layer.borderColor = UIColor.black.cgColor
        view.addSubview(skillButton)
        
        materialButton = UIButton.init(type: .custom)
        materialButton.frame = CGRect (x: skillButton.frame.origin.x+skillButton.frame.size.width+10, y: skillButton.frame.origin.y, width: skillButton.frame.size.width, height: skillButton.frame.size.height)
        materialButton.setTitle("強化素材", for: .normal)
        materialButton.setTitleColor(UIColor.black, for: .normal)
        materialButton.layer.borderWidth = 1
        materialButton.layer.borderColor = UIColor.black.cgColor
        view.addSubview(materialButton)
        
        tableView = UITableView.init(frame: CGRect (x: collectionView.frame.origin.x+collectionView.frame.size.width, y: skillButton.frame.origin.y+skillButton.frame.size.height, width: UIScreen.main.bounds.width-(additionalSafeAreaInsets.left+additionalSafeAreaInsets.right)-collectionView.frame.size.width, height: servantPhotoHeight-nameLabel.frame.size.height-skillButton.frame.size.height), style: .grouped)
        tableView.backgroundColor = UIColor.clear
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(KeepSkillsCell.self, forCellReuseIdentifier: NSStringFromClass(KeepSkillsCell.self))
        tableView.register(CareerSkillsCell.self, forCellReuseIdentifier: NSStringFromClass(CareerSkillsCell.self))
        tableView.register(NoblePhantasmsCell.self, forCellReuseIdentifier: NSStringFromClass(NoblePhantasmsCell.self))
        
        view.addSubview(tableView)
    }
    
    @objc func backAction(sender: UIButton) -> Void {
        navigationController!.popViewController(animated: true)
    }
    
    //MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return servantSkillDataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servantSkillDataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = ""
        switch indexPath.section {
        case 0:
            cellIdentifier = NSStringFromClass(KeepSkillsCell.self)
        case 1:
            cellIdentifier = NSStringFromClass(CareerSkillsCell.self)
        case 2:
            cellIdentifier = NSStringFromClass(NoblePhantasmsCell.self)
        default: break
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! KeepSkillsCell
        if indexPath.section == 0 || indexPath.section == 1 || indexPath.section == 2 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! KeepSkillsCell
//            let keepSkillModel = servantModel.keepSkillsArrry![indexPath.row]
            let keepSkillsArrry = servantSkillDataSource[indexPath.section]
            let keepSkillModel: KeepSkillModel = keepSkillsArrry[indexPath.row] as! KeepSkillModel
            
            var i = 0
            for skillDescription in keepSkillModel.descriptionArrry! {
                let skillDescriptionLabel:UILabel = cell.skillDescriptionLabelArray[i]
                skillDescriptionLabel.frame = keepSkillModel.descriptionSizeArray![i]
                skillDescriptionLabel.text = skillDescription
                i+=1
            }
            
            cell.skillImageView.kf.setImage(with: URL(string: keepSkillModel.iconURL))
            cell.skillNameLabel.text = keepSkillModel.name
            cell.skillColdDownLabel.text = keepSkillModel.coldDown
            cell.skillWhenGetLabel.text = keepSkillModel.whenGet
        }
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var rowHeight = 0
        if indexPath.section == 0 || indexPath.section == 1 || indexPath.section == 2 {
            let keepSkillsArrry = servantSkillDataSource[indexPath.section]
            let keepSkillModel: KeepSkillModel = keepSkillsArrry[indexPath.row] as! KeepSkillModel
            rowHeight = rowHeight+10+50+8+Int(keepSkillModel.titleDescriptionHeight)+10
        }
        
        return CGFloat(rowHeight)
    }
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return servantModel.photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(ServantPhotoCell.self), for: indexPath) as?ServantPhotoCell
        
        let urlString = servantModel.photosArray[indexPath.row]
        cell!.servantImageView.kf.setImage(with: URL(string: urlString))
        
        switch indexPath.row%2 {
        case 0:
            cell!.servantImageView.frame = cell!.servantImageDefaultRect

        case 1:
            cell!.servantImageView.frame = CGRect (x: cell!.servantImageDefaultRect.origin.x-(cell!.servantImageDefaultRect.size.width/2), y: cell!.servantImageDefaultRect.origin.y, width: cell!.servantImageDefaultRect.size.width, height: cell!.servantImageDefaultRect.size.height)

        default:
            cell!.servantImageView.frame = cell!.servantImageDefaultRect
        }
        
        return cell!
    }
}
