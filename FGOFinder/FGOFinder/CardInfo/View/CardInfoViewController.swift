//
//  CardInfoViewControlle.swift
//  FGOFinder
//
//  Created by david on 2018/2/13.
//  Copyright © 2018年 okami3363. All rights reserved.
//

import UIKit

class CardInfoViewController: UIViewController, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {
    
    var backButton: UIButton!
    
    var collectionView: UICollectionView!
    
    var height: CGFloat!
    var width: CGFloat!
    
    var tableView: UITableView!
    
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
        collectionView.reloadData()
        
        performSelector(onMainThread: #selector(scrollToDefaultServantPhoto), with: nil, waitUntilDone: false)
    }
    
    @objc func scrollToDefaultServantPhoto() -> Void {
        let rect = CGRect (x: width*3, y: 0, width: width, height: height)
        self.collectionView.scrollRectToVisible(rect, animated: false)
    }
    
    func setupUI() -> Void {
        view.backgroundColor = UIColor.white
        
        additionalSafeAreaInsets = LayoutFormula().landscapeAdditionalSafeAreaInsets()
        
        backButton = UIButton.init(type: .custom)
        backButton.frame = CGRect (x: 0, y: 0, width: additionalSafeAreaInsets.left+15, height: additionalSafeAreaInsets.left)
        backButton.setTitle("<-", for: .normal)
        backButton.setTitleColor(UIColor.blue, for: .normal)
        backButton.layer.borderColor = UIColor.blue.cgColor
        backButton.layer.borderWidth = 1
        backButton.addTarget(self, action: #selector(backAction(sender:)), for: .touchUpInside)
        view.addSubview(backButton)
        
        width = LayoutFormula().servantPhotoSize().width
        height = LayoutFormula().servantPhotoSize().height
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize (width: width, height: height)
        
        collectionView = UICollectionView.init(frame: CGRect (x: backButton.frame.origin.x+backButton.frame.size.width, y: 0, width: width, height: height), collectionViewLayout:layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.register(ServantPhotoCell.self, forCellWithReuseIdentifier: NSStringFromClass(ServantPhotoCell.self))
        view.addSubview(collectionView)
        
        tableView = UITableView.init(frame: CGRect (x: collectionView.frame.origin.x+collectionView.frame.size.width, y: 0, width: UIScreen.main.bounds.width-(additionalSafeAreaInsets.left+additionalSafeAreaInsets.right)-collectionView.frame.size.width, height: height), style: .grouped)
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
            
            cell.skillImageView.image = UIImage.init(named: keepSkillModel.iconURL)
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
        return servantModel.servantPhotoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(ServantPhotoCell.self), for: indexPath) as?ServantPhotoCell
        
        cell!.servantImageView.image = servantModel.servantPhotoArray[indexPath.row]
        
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
