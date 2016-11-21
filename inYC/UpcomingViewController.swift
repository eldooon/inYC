//
//  UpcomingViewController.swift
//  inYC
//
//  Created by Eldon Chan on 11/12/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import UIKit

class UpcomingViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    let data = testData()
    let scrollView = UIScrollView()
    let contentView = UIView()
    let upcomingLabel = UILabel()
    var eventCollectionView : UICollectionView!
    var firstSection = [EventInformation]()
    var secondSection = [EventInformation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        data.generateTestData()
        splitData()
        setUpEventCollectionCells()
        createLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func splitData () {
        
        firstSection.append(data.eventTestData[0])
        firstSection.append(data.eventTestData[1])
        secondSection.append(data.eventTestData[2])
        print(firstSection[0])
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
            make.height.equalTo(view.snp.height).multipliedBy(1.2)
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
            make.height.equalTo(contentView.snp.height)
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
        layout.headerReferenceSize = CGSize(width: self.view.frame.width, height: 50)
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        layout.itemSize = CGSize(width: screenWidth/1.2, height: screenWidth/2.005)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 5
        
        eventCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        eventCollectionView.dataSource = self
        eventCollectionView.delegate = self
        eventCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "basicCell")
        eventCollectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: "basicCell")
        eventCollectionView.register(EventHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerCell")
        eventCollectionView.showsVerticalScrollIndicator = false
        eventCollectionView.showsHorizontalScrollIndicator = false
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 && self.firstSection.count != 0 {
            return firstSection.count
        }
        
        else if section == 1 && self.secondSection.count != 0 {
            return secondSection.count
        }
        
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath) as! EventCollectionViewCell
        
        var currentEvent : EventInformation?
        if indexPath.section == 0 {
            currentEvent = firstSection[indexPath.item]
        }
        
        else {
            currentEvent = secondSection[indexPath.item]
        }
        
        cell.eventLabel.text = currentEvent?.eventName
        cell.dateLabel.text = currentEvent?.eventDate
        cell.locationLabel.text = currentEvent?.eventLocation
        
        
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
    
    func collectionView(_ collectionView: UICollectionView,viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableView : UICollectionReusableView? = nil
        
        if (kind == UICollectionElementKindSectionHeader) {

            let headerView = eventCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerCell", for: indexPath) as! EventHeaderCollectionReusableView
//            headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
            
            var currentEvent : EventInformation?
            if indexPath.section == 0 {
                headerView.headerLabel.text = firstSection[indexPath.item].eventDate
            }
                
            else {
                headerView.headerLabel.text = secondSection[indexPath.item].eventDate
            }
            
            reusableView = headerView
        }
        
        return reusableView!
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
