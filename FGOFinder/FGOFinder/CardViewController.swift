//
//  CardViewController.swift
//  FGOFinder
//
//  Created by okami3363 on 2018/2/7.
//  Copyright © 2018年 okami3363. All rights reserved.
//

import UIKit

class CardViewController: UIViewController, UICollectionViewDataSource {
    
    var collectionView:UICollectionView!
    var layout: UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self .setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setupUI() {
        self.view.backgroundColor = UIColor.white
        
//        self.flowLayout = UICollectionViewFlowLayout()
////        self.flowLayout?.scrollDirection = UICollectionViewScrollDirectionVertical
//        self.flowLayout?.itemSize = CGSize(width: 60, height: 60)
//        self.flowLayout?.minimumLineSpacing = 10
        
        self.layout = UICollectionViewFlowLayout()
        
        let width = ((UIScreen.main.bounds.size.width-(2*(UIScreen.main.bounds.size.width/20)))-(10*7))/6
        self.layout.minimumLineSpacing = 10
        self.layout.minimumInteritemSpacing = 10
        self.layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.layout.itemSize = CGSize (width: width, height: width)
        
        
        
        
        
        self.collectionView = UICollectionView.init(frame: CGRect (x: UIScreen.main.bounds.size.width/20, y: 0, width: UIScreen.main.bounds.size.width-(2*(UIScreen.main.bounds.size.width/20)), height: UIScreen.main.bounds.size.height), collectionViewLayout:self.layout!)
        self.collectionView.backgroundColor = UIColor.gray
        self.collectionView.dataSource = self
        self.collectionView.register(CardCell.self, forCellWithReuseIdentifier: "Cell")
        
        self.view.addSubview(self.collectionView)
    }
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as?CardCell
//        cell?.contentView.backgroundColor = UIColor.red
        cell!.cardImageView.image = UIImage.init(named: "3032000")
        
        
        return cell!
        
    }

}
