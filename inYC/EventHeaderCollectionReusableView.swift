//
//  EventHeaderCollectionReusableView.swift
//  inYC
//
//  Created by Eldon Chan on 11/17/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import UIKit

class EventHeaderCollectionReusableView: UICollectionReusableView {
    
    let lineImageView = UILabel()
    var headerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.myCustomInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func myCustomInit() {
        
        self.addSubview(headerLabel)
        headerLabel.text = "HEADER"
        headerLabel.addTextSpacing(spacing: 1.2)
        headerLabel.font = UIFont.inYCBoldWithSize(with: 20)
        headerLabel.textColor = UIColor.primaryText()
        headerLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.right).offset(-75)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        self.addSubview(lineImageView)
        lineImageView.backgroundColor = UIColor.primaryColorLight()
        lineImageView.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.centerY.equalTo(headerLabel.snp.centerY)
            make.left.equalTo(self.snp.left).offset(10)
            make.right.equalTo(headerLabel.snp.left).offset(-10)
        }
        
    }
        
}
