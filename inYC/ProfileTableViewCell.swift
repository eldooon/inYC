//
//  ProfileTableViewCell.swift
//  inYC
//
//  Created by Eldon Chan on 11/20/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    var textCellLabel = UILabel()
    var subTextCellLabel = UILabel()
    
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
        
        createLayout()
    }
    
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)!
    }
    
    func createLayout(){
        
        contentView.addSubview(textCellLabel)
        textCellLabel.font = UIFont.inYCBold()
        textCellLabel.text = "Text"
        textCellLabel.addTextSpacing(spacing: 1.2)
        textCellLabel.textColor = UIColor.primaryText()
        textCellLabel.snp.makeConstraints { (make) in
            make.left.equalTo(contentView.snp.left).offset(20)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        contentView.addSubview(subTextCellLabel)
        textCellLabel.font = UIFont.inYCNormal()
        textCellLabel.addTextSpacing(spacing: 1.2)
        textCellLabel.textColor = UIColor.primaryText()
        textCellLabel.snp.makeConstraints { (make) in
            make.right.equalTo(contentView.snp.right).offset(20)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
    }

}
