//
//  EventCollectionViewCell.swift
//  inYC
//
//  Created by Eldon Chan on 11/13/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    
    var eventImageView = UIImageView()
    let eventOverlay = UIView()
    var eventLabel = UILabel()
    var dateLabel = UILabel()
    var locationLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(eventImageView)
        eventImageView.backgroundColor = UIColor.primaryColorLight()
        eventImageView.layer.borderWidth = 1
        eventImageView.layer.borderColor = UIColor.primaryColorDark().cgColor
        eventImageView.layer.cornerRadius = self.frame.height/20
        eventImageView.layer.masksToBounds = true
        eventImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(contentView.snp.centerX)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.equalTo(contentView.snp.width)
            make.height.equalTo(contentView.snp.height)
        }
        
        eventImageView.addSubview(eventOverlay)
        eventOverlay.backgroundColor = UIColor.primaryColor()
        eventOverlay.snp.makeConstraints { (make) in
            make.bottom.equalTo(eventImageView.snp.bottom)
            make.left.equalTo(eventImageView.snp.left)
            make.right.equalTo(eventImageView.snp.right)
            make.height.equalTo(eventImageView.snp.height).dividedBy(4)
        }
        
        eventOverlay.addSubview(eventLabel)
        eventLabel.text = "Event Name"
        eventLabel.font = UIFont.inYCBold()
        eventLabel.textColor = UIColor.white
        eventLabel.snp.makeConstraints { (make) in
            make.left.equalTo(eventOverlay.snp.left).offset(10)
            make.top.equalTo(eventOverlay.snp.top).offset(5)
        }
        
        eventOverlay.addSubview(dateLabel)
        dateLabel.text = "Date/time"
        dateLabel.font = UIFont.inYCNormal()
        dateLabel.textColor = UIColor.white
        dateLabel.snp.makeConstraints { (make) in
            make.right.equalTo(eventOverlay.snp.right).offset(-10)
            make.top.equalTo(eventOverlay.snp.top).offset(5)
        }
        
        eventOverlay.addSubview(locationLabel)
        locationLabel.text = "Location"
        locationLabel.font = UIFont.inYCNormal()
        locationLabel.textColor = UIColor.white
        locationLabel.snp.makeConstraints { (make) in
            make.left.equalTo(dateLabel.snp.left)
            make.top.equalTo(dateLabel.snp.bottom)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
