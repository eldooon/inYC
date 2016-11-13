//
//  ViewController.swift
//  inYC
//
//  Created by Eldon Chan on 11/12/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    let nearYouImageView = UILabel()
    var eventCollectionView : UICollectionView!
    let dividerLine = UIImageView()
    let featuredLabel = UILabel()
    var featuredTableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUpEventCollectionCells()
        setUpFeaturedTableViewCells()
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
        nearYouImageView.font = UIFont.inYCNormalWithSize(with: 18)
        nearYouImageView.textColor = UIColor.primaryColorDark()
        nearYouImageView.addTextSpacing(spacing: 1.2)
        nearYouImageView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(80)
            make.left.equalTo(view.snp.left).offset(15)
        }
        
        self.view.addSubview(eventCollectionView)
        eventCollectionView.backgroundColor = UIColor.clear
        eventCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(nearYouImageView.snp.bottom)
            make.bottom.equalTo(view.snp.centerY)
            make.left.equalTo(view.snp.left).offset(10)
            make.right.equalTo(view.snp.right).offset(-10)
        }
        
        self.view.addSubview(dividerLine)
        dividerLine.backgroundColor = UIColor.primaryColor()
        dividerLine.snp.makeConstraints { (make) in
            make.width.equalTo(view.snp.width).offset(-50)
            make.height.equalTo(1)
            make.top.equalTo(eventCollectionView.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        self.view.addSubview(featuredLabel)
        featuredLabel.text = "Featured Events:"
        featuredLabel.font = UIFont.inYCNormalWithSize(with: 18)
        featuredLabel.textColor = UIColor.primaryColorDark()
        featuredLabel.addTextSpacing(spacing: 1.2)
        featuredLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dividerLine.snp.bottom).offset(15)
            make.left.equalTo(view.snp.left).offset(10)
        }

        self.view.addSubview(featuredTableView)
        featuredTableView.snp.makeConstraints { (make) in
            make.top.equalTo(featuredLabel.snp.bottom).offset(15)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    func setUpEventCollectionCells() {
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        //setup Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.itemSize = CGSize(width: screenWidth/1.2, height: screenWidth/2.005)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 5
        
        eventCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        eventCollectionView.dataSource = self
        eventCollectionView.delegate = self
        eventCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "basicCell")
        eventCollectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: "basicCell")
        eventCollectionView.showsVerticalScrollIndicator = false
        eventCollectionView.showsHorizontalScrollIndicator = false
        
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath) as! EventCollectionViewCell
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
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
    
    func setUpFeaturedTableViewCells() {
        
        featuredTableView.register(LeftFeaturedEventTableViewCell.self, forCellReuseIdentifier: "leftCell")
        featuredTableView.register(RightFeaturedEventTableViewCell.self, forCellReuseIdentifier: "rightCell")
        featuredTableView.delegate = self
        featuredTableView.dataSource = self
        featuredTableView.separatorStyle = .none
        featuredTableView.rowHeight = 150
        featuredTableView.showsVerticalScrollIndicator = false
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell
        
        if (indexPath.row % 2 == 0) {
            cell = tableView.dequeueReusableCell(withIdentifier: "leftCell", for: indexPath as IndexPath) as! LeftFeaturedEventTableViewCell
        }
        
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: "rightCell", for: indexPath as IndexPath) as! RightFeaturedEventTableViewCell
        }
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    

}

