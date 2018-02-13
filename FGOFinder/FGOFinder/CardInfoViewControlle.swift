//
//  CardInfoViewControlle.swift
//  FGOFinder
//
//  Created by david on 2018/2/13.
//  Copyright © 2018年 okami3363. All rights reserved.
//

import UIKit

class CardInfoViewControlle: UIViewController, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    var servantPhotoDataSource: NSArray?

    override func viewDidLoad() -> Void {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        setupDataSource()
    }

    override func didReceiveMemoryWarning() -> Void {
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
    
    func setupDataSource() -> Void {
        
        servantPhotoDataSource = setupServantPhotoDataSource()
        collectionView.reloadData()
        
    }
    
    func setupServantPhotoDataSource() -> NSArray {
        
        return [UIImage.init(named: "303200a")!, UIImage.init(named: "303200a")!, UIImage.init(named: "303200b")!, UIImage.init(named: "303200b")!]
        
    }
    
    func setupUI() -> Void {
        
        view.backgroundColor = UIColor.black
        
        let scale = 512.0/724.0
        let height = UIScreen.main.bounds.size.height-navigationController!.navigationBar.frame.size.height
        let width = CGFloat(height)*CGFloat(scale)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.itemSize = CGSize (width: width, height: height)
        
        collectionView = UICollectionView.init(frame: CGRect (x: UIScreen.main.bounds.size.width/20, y: navigationController!.navigationBar.frame.origin.y+navigationController!.navigationBar.frame.size.height, width: width, height: height), collectionViewLayout:layout)
        collectionView.backgroundColor = UIColor.red
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "Cell")
        view.addSubview(collectionView)
        
    }
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return servantPhotoDataSource!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as?CardCell
//        cell!.cardImageView.image = servantPhotoDataSource![indexPath.row] as?UIImage
        switch indexPath.row%2 {
        case 0:
            cell!.backgroundColor = UIColor.blue
        case 1:
            cell!.backgroundColor = UIColor.green
        default:
            cell!.backgroundColor = UIColor.white
        }
        
        
//        cell!.cardImageView.contentMode = .scaleAspectFit
//        cell!.cardImageView.contentMode = .left
        return cell!
        
    }
    
    
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(10, 10, 10, 10)
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let size = ((servantPhotoDataSource![indexPath.row] as?UIImage)?.size)!
//        print(size)
//        return size
//
//    }

}
