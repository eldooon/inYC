//
//  EventImageCollectionViewCell.swift
//  inYC
//
//  Created by Eldon Chan on 11/15/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import UIKit

class EventImageCollectionViewCell: UICollectionViewCell {
    
    var eventImageView = UIImageView()
    
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
