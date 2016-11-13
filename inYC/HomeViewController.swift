//
//  ViewController.swift
//  inYC
//
//  Created by Eldon Chan on 11/12/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    let nearYouImageView = UILabel()
    let scrollView = UIScrollView()
    let contentView = UIView()
    let event1Button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUpCollectionCells()
        createLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createLayout() {
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(nearYouImageView)
        nearYouImageView.text = "Near you:"
        nearYouImageView.font = UIFont.inYCNormal()
        nearYouImageView.textColor = UIColor.primaryColor()
        nearYouImageView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(80)
            make.left.equalTo(view.snp.left).offset(10)
        }
        
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor.clear
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(nearYouImageView.snp.bottom)
            make.bottom.equalTo(view.snp.centerY)
            make.left.equalTo(view.snp.left).offset(10)
            make.right.equalTo(view.snp.right).offset(-10)
        }

    }
    
    func setUpCollectionCells() {
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        //setup Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.itemSize = CGSize(width: screenWidth/1.2, height: screenWidth/2.005)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 5
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "basicCell")
        collectionView?.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: "basicCell")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath) as! EventCollectionViewCell
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
        // handle tap events
//        print("You selected cell #\(indexPath.item)!")
//        let postDetailVC = PostDetailViewController()
//        postDetailVC.delegate = self
//        let post = shared.postArray[indexPath.item]
//        postDetailVC.itemTitle = post.itemTitle
//        postDetailVC.itemPrice = post.price
//        postDetailVC.itemDescription = post.itemDescription
//        postDetailVC.email = post.email
//        postDetailVC.fullName = post.name
//        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! PostViewCell
//        postDetailVC.itemImage = cell.postImage.image
//        
//        self.parentNavigationController?.pushViewController(postDetailVC, animated: true)
    }
    

}

