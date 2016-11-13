//
//  LeftFeaturedEventTableViewCell.swift
//  inYC
//
//  Created by Eldon Chan on 11/13/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import UIKit

class LeftFeaturedEventTableViewCell: UITableViewCell {
    
    let eventImageView = UIImageView()
    var eventNameLabel = UILabel()
    var dateLabel = UILabel()
    var locationLabel = UILabel()
    var descriptionLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(eventImageView)
        eventImageView.backgroundColor = UIColor.primaryColorLight()
        eventImageView.layer.borderWidth = 1
        eventImageView.layer.borderColor = UIColor.primaryColorDark().cgColor
        eventImageView.layer.cornerRadius = self.frame.height/20
        eventImageView.layer.masksToBounds = true
        eventImageView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView.snp.left).offset(15)
            make.top.equalTo(contentView.snp.top)
            make.height.equalTo(contentView.snp.height).dividedBy(1.2)
            make.width.equalTo(contentView.snp.height).dividedBy(1.2)
        }
        
        contentView.addSubview(eventNameLabel)
        eventNameLabel.text = "Event Name"
        eventNameLabel.font = UIFont.inYCBold()
        eventNameLabel.textColor = UIColor.primaryText()
        eventNameLabel.addTextSpacing(spacing: 1.2)
        eventNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(eventImageView.snp.right).offset(20)
            make.top.equalTo(eventImageView.snp.top).offset(5)
        }
        
        contentView.addSubview(dateLabel)
        dateLabel.text = "Date/time"
        dateLabel.font = UIFont.inYCNormal()
        dateLabel.textColor = UIColor.secondaryText()
        dateLabel.addTextSpacing(spacing: 1.2)
        dateLabel.snp.makeConstraints { (make) in
            make.left.equalTo(eventNameLabel.snp.left)
            make.top.equalTo(eventNameLabel.snp.bottom)
        }
        
        contentView.addSubview(locationLabel)
        locationLabel.text = "Date/time"
        locationLabel.font = UIFont.inYCNormal()
        locationLabel.textColor = UIColor.secondaryText()
        locationLabel.addTextSpacing(spacing: 1.2)
        locationLabel.snp.makeConstraints { (make) in
            make.left.equalTo(dateLabel.snp.left)
            make.top.equalTo(dateLabel.snp.bottom)
        }
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.text = "Description:"
        descriptionLabel.font = UIFont.inYCNormal()
        descriptionLabel.textColor = UIColor.secondaryText()
        descriptionLabel.addTextSpacing(spacing: 1.2)
        descriptionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(locationLabel.snp.left)
            make.top.equalTo(locationLabel.snp.bottom)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
