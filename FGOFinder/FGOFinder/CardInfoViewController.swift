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
    var servantPhotoDataSource: NSArray?
    
    var height: CGFloat!
    var width: CGFloat!
    
    var tableView:UITableView!

    override func viewDidLoad() -> Void {
        super.viewDidLoad()
        
        setupUI()
        setupDataSource()
    }
    

    override func didReceiveMemoryWarning() -> Void {
        super.didReceiveMemoryWarning()
    }
    
    func setupDataSource() -> Void {
        servantPhotoDataSource = setupServantPhotoDataSource()
        collectionView.reloadData()
        
        performSelector(onMainThread: #selector(scrollToDefaultServantPhoto), with: nil, waitUntilDone: false)
    }
    
    func setupServantPhotoDataSource() -> NSArray {
        return [UIImage.init(named: "303200a")!, UIImage.init(named: "303200a")!, UIImage.init(named: "303200b")!, UIImage.init(named: "303200b")!]
    }
    
    @objc func scrollToDefaultServantPhoto() -> Void {
        let rect = CGRect (x: width*3, y: 0, width: width, height: height)
        self.collectionView.scrollRectToVisible(rect, animated: false)
        
//        self.collectionView.scrollToItem(at: IndexPath.init(row: servantPhotoDataSource!.count-1, section: 0), at: .left, animated: false)
    }
    
    func setupUI() -> Void {
        view.backgroundColor = UIColor.black
        
        backButton = UIButton.init(type: .custom)
        backButton.frame = CGRect (x: 0, y: 0, width: UIScreen.main.bounds.size.width/20, height: UIScreen.main.bounds.size.width/20)
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
        
        collectionView = UICollectionView.init(frame: CGRect (x: UIScreen.main.bounds.size.width/20, y: 0, width: width, height: height), collectionViewLayout:layout)
        collectionView.backgroundColor = UIColor.red
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.register(ServantPhotoCell.self, forCellWithReuseIdentifier: "Cell")
        view.addSubview(collectionView)
        
        tableView = UITableView.init(frame: CGRect (x: collectionView.frame.origin.x+collectionView.frame.size.width+20, y: 0, width: UIScreen.main.bounds.width-(UIScreen.main.bounds.size.width/20)-(collectionView.frame.origin.x+collectionView.frame.size.width+20), height: height))
        tableView.backgroundColor = UIColor.white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(KeepSkillsCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
    }
    
    @objc func backAction(sender: UIButton) -> Void {
        navigationController!.popViewController(animated: true)
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: KeepSkillsCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! KeepSkillsCell
        
        cell.skillImageView.image = UIImage.init(named: "SkillIcon_403")
        cell.skillNumberLabel.text = "skill \(indexPath.row+1)"
        cell.skillDescriptionLabel.text = "秘められた大王冠 A"
        
        return cell
    }
    
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var rowHeight = 0
        
        rowHeight = rowHeight+10+60+10
        
        return CGFloat(rowHeight)
    }
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return servantPhotoDataSource!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as?ServantPhotoCell
        
        cell!.servantImageView.image = servantPhotoDataSource![indexPath.row] as?UIImage
        
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
