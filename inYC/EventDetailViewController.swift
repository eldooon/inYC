//
//  EventDetailViewController.swift
//  inYC
//
//  Created by Eldon Chan on 11/15/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var scrollView = UIScrollView()
    let contentView = UIView()
    var imageCollectionView : UICollectionView!
    var eventTypeImageView = UIImageView()
    let shareButton = UIButton()
    var eventNameLabel = UILabel()
    var dateLabel = UILabel()
    var locationLabel = UILabel()
    var descriptionLabel = UILabel()
    var rsvpButton = UIButton()

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
        contentView.snp.makeConstraints { (make) in
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(view.snp.height).multipliedBy(1.4)
            make.top.equalTo(scrollView.snp.top)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
        
        contentView.addSubview(imageCollectionView)
        imageCollectionView.backgroundColor = UIColor.clear
        imageCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top)
            make.height.equalTo(view.snp.height).dividedBy(3)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-10)
        }
        
        contentView.addSubview(eventTypeImageView)
        eventTypeImageView.image = UIImage(named: "Location")
        eventTypeImageView.snp.makeConstraints { (make) in
            make.top.equalTo(imageCollectionView.snp.bottom)
            make.left.equalTo(contentView.snp.left).offset(50)
        }
        
        contentView.addSubview(shareButton)
        shareButton.setImage(UIImage(named: "Share"), for: .normal)
        shareButton.snp.makeConstraints { (make) in
            make.top.equalTo(imageCollectionView.snp.bottom)
            make.right.equalTo(contentView.snp.right).offset(-50)
        }
        
        contentView.addSubview(eventNameLabel)
        eventNameLabel.text = "Event Name"
        eventNameLabel.font = UIFont.inYCBold()
        eventNameLabel.addTextSpacing(spacing: 1.2)
        eventNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(eventTypeImageView.snp.bottom).offset(20)
            make.left.equalTo(contentView.snp.left).offset(20)
        }
        
        contentView.addSubview(dateLabel)
        dateLabel.text = "Date/time"
        dateLabel.font = UIFont.inYCNormal()
        dateLabel.addTextSpacing(spacing: 1.2)
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(eventNameLabel.snp.bottom).offset(20)
            make.left.equalTo(eventNameLabel.snp.left)
        }
        
        contentView.addSubview(locationLabel)
        locationLabel.text = "Location"
        locationLabel.font = UIFont.inYCNormal()
        locationLabel.addTextSpacing(spacing: 1.2)
        locationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.left.equalTo(eventNameLabel.snp.left)
        }
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.text = "Description:"
        descriptionLabel.font = UIFont.inYCNormal()
        descriptionLabel.addTextSpacing(spacing: 1.2)
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(locationLabel.snp.bottom).offset(20)
            make.left.equalTo(eventNameLabel.snp.left)
        }
        
        contentView.addSubview(rsvpButton)
        rsvpButton.backgroundColor = UIColor.primaryColorDark()
        rsvpButton.setTitle("RSVP", for: .normal)
        rsvpButton.setTitleColor(UIColor.white, for: .normal)
        rsvpButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp.bottom).offset(-50)
            make.width.equalTo(view.snp.width)
            make.height.equalTo(view.snp.height).dividedBy(10)
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
        
        imageCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        imageCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "basicCell")
        imageCollectionView.register(EventImageCollectionViewCell.self, forCellWithReuseIdentifier: "basicCell")
        imageCollectionView.showsVerticalScrollIndicator = false
        imageCollectionView.showsHorizontalScrollIndicator = false
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath) as! EventImageCollectionViewCell
        
        
        return cell
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
