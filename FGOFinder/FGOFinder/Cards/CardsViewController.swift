//
//  CardViewController.swift
//  FGOFinder
//
//  Created by okami3363 on 2018/2/7.
//  Copyright © 2018年 okami3363. All rights reserved.
//

import UIKit

enum ShowType {
    case servant
    case craftEssence
}

class CardsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout!
    
    var actionBar: UIView!
    var servant: UIButton!
    var craftEssence: UIButton!
    
    var dataSource: [Any]?
    var showType: ShowType = ShowType.servant
    
    override func viewDidLoad() -> Void {
        super.viewDidLoad()
        setupUI()
        setupDataSource()
    }
    //MARK: - Func
    override func didReceiveMemoryWarning() -> Void {
        super.didReceiveMemoryWarning()
    }
    
    func setupDataSource() -> Void {
        
        FFRequestHandler().responseJSON(url: "https://fgo-vz.azurewebsites.net/Servant/") { (dataResponse) in
            print(dataResponse)
        }
        
        dataSource = (showType == ShowType.servant ? self.setupServantDataSource() :self.setupCraftEssenceDataSource())
        collectionView.reloadData()
    }
    
    func setupServantDataSource() -> [UIImage] {
        return [UIImage](repeating:UIImage.init(named: "3032000")!, count: 40)
    }
    
    func setupCraftEssenceDataSource() -> [UIImage] {
        return [UIImage](repeating:UIImage.init(named: "9302590")!, count: 40)
    }
    
    @objc func servantAction(sender: UIButton) -> Void {
        print(sender)
        showType = ShowType.servant
        setupDataSource()
    }
    
    @objc func craftEssenceAction(sender: UIButton) -> Void {
        showType = ShowType.craftEssence
        setupDataSource()
    }
    
    func setupUI() -> Void {
        view.backgroundColor = UIColor.white
        
        additionalSafeAreaInsets = LayoutFormula().landscapeAdditionalSafeAreaInsets()
        
        
        actionBar = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width-(0), height: 40));
        actionBar.backgroundColor = UIColor.lightGray
        view.addSubview(actionBar)
        
        servant = UIButton.init(type: .custom)
        servant.frame = CGRect (x: additionalSafeAreaInsets.left+15, y: 0, width: 80, height: 40)
        servant.setTitle("Servant", for: .normal)
        servant.setTitleColor(UIColor.blue, for: .normal)
        servant.layer.borderColor = UIColor.blue.cgColor
        servant.layer.borderWidth = 1
        servant.addTarget(self, action: #selector(servantAction(sender:)), for: .touchUpInside)
        actionBar.addSubview(servant)
        
        craftEssence = UIButton.init(type: .custom)
        craftEssence.frame = CGRect (x: servant.frame.origin.x+servant.frame.size.width+10, y: servant.frame.origin.y, width: 80, height: servant.frame.size.height)
        craftEssence.setTitle("概念禮裝", for: .normal)
        craftEssence.setTitleColor(UIColor.blue, for: .normal)
        craftEssence.layer.borderColor = UIColor.blue.cgColor
        craftEssence.layer.borderWidth = 1
        craftEssence.addTarget(self, action: #selector(craftEssenceAction(sender:)), for: .touchUpInside)
        actionBar.addSubview(craftEssence)
        
        layout = UICollectionViewFlowLayout()
        let width = ((UIScreen.main.bounds.size.width-(additionalSafeAreaInsets.left+additionalSafeAreaInsets.right))-(10*6))/7
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsetsMake(10, additionalSafeAreaInsets.left, 10, additionalSafeAreaInsets.right);
        layout.itemSize = CGSize (width: width, height: width)
        
        collectionView = UICollectionView.init(frame: CGRect (x: actionBar.frame.origin.x, y: actionBar.frame.origin.y+actionBar.frame.size.height, width: actionBar.frame.size.width, height: UIScreen.main.bounds.size.height-actionBar.frame.size.height), collectionViewLayout:layout!)
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "Cell")
        view.addSubview(collectionView)
    }
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as?CardCell
        cell!.cardImageView.image = dataSource![indexPath.row] as? UIImage
        
        return cell!
    }
    
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cardInfoViewControlle: CardInfoViewController = CardInfoViewController()
        navigationController?.pushViewController(cardInfoViewControlle, animated: true)
    }
    
}
