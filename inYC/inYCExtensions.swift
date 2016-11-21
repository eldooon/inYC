//
//  inYCExtensions.swift
//  inYC
//
//  Created by Eldon Chan on 11/13/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import UIKit

extension UIFont {

    class func inYCNormal() -> UIFont {
        return UIFont(name: "TrebuchetMS", size: 14)!
    }
    
    class func inYCBold() -> UIFont {
        return UIFont(name: "TrebuchetMS-Bold", size: 16)!
    }
    
    class func inYCNormalWithSize(with size: CGFloat) -> UIFont {
        return UIFont(name: "TrebuchetMS", size: size)!
    }
    
    class func inYCBoldWithSize(with size: CGFloat) -> UIFont {
        return UIFont(name: "TrebuchetMS-Bold", size: size)!
    }

}

extension UIColor {
    
    class func primaryText() -> UIColor {
        
        return hexColor(rgbValue: 0x4A4A4A)
    }
    
    class func secondaryText() -> UIColor {
        
        return hexColor(rgbValue: 0x666666)
    }
    
    class func primaryColor() -> UIColor {
        
        return hexColor(rgbValue: 0x4A4A4A, alpha: 0.5)
    }

    class func primaryColorLight() -> UIColor {
        
        return hexColor(rgbValue: 0xD8D8D8)
    }
    
    class func primaryColorDark() -> UIColor {
        
        return hexColor(rgbValue: 0x4C4C4C)
    }
    
    class func hexColor(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
    class func hexColor(rgbValue: UInt,alpha:CGFloat) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}

extension UILabel {
    func addTextSpacing(spacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: self.text!)
        attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: self.text!.characters.count))
        self.attributedText = attributedString
    }
}

extension UISegmentedControl {
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: UIColor.clear), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: UIColor.clear), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
    
    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 20)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}
