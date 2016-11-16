//
//  UpcomingViewController.swift
//  inYC
//
//  Created by Eldon Chan on 11/12/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import UIKit

class UpcomingViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    let scrollView = UIScrollView()
    let contentView = UIView()
    let upcomingLabel = UILabel()
    var eventCollectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpEventCollectionCells()
        createLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createLayout() {
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        scrollView.addSubview(contentView)
        scrollView.sizeToFit()
        contentView.snp.makeConstraints { (make) in
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(view.snp.height).multipliedBy(1.4)
            make.top.equalTo(scrollView.snp.top)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
        
        contentView.addSubview(upcomingLabel)
        upcomingLabel.text = "Upcoming"
        upcomingLabel.font = UIFont.inYCNormalWithSize(with: 18)
        upcomingLabel.textColor = UIColor.primaryColorDark()
        upcomingLabel.addTextSpacing(spacing: 1.2)
        upcomingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.left.equalTo(contentView.snp.left).offset(15)
        }
        
        contentView.addSubview(eventCollectionView)
        eventCollectionView.backgroundColor = UIColor.clear
        eventCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(upcomingLabel.snp.bottom).offset(20)
            make.height.equalTo(view.snp.height)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-10)
        }
    }
    
    func setUpEventCollectionCells() {
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        //setup Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
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
        self.navigationController?.pushViewController(EventDetailViewController(), animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
