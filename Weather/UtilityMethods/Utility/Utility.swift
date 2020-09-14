//
//  Utility.swift
//  Weather
//
//  Created by BasicFirst on 7/27/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import UIKit

class Utility: NSObject{
    static func setCornersRadiusForAllCorners(ofView view:UIView, withRaidus radius: CGFloat) {
        view.layer.cornerRadius = CGFloat(radius)
        view.clipsToBounds = true
        view.layer.masksToBounds = false
    }
    
    
    static func setCornersRadius(ofView view:UIView, withRaidus radius: CGFloat, andCACornerMask cornerMask:CACornerMask) {
        view.layer.cornerRadius = CGFloat(radius)
        view.clipsToBounds = true
        view.layer.maskedCorners = cornerMask
    }
    
    static func makeCircle(ofView view:UIView) {
        view.layer.cornerRadius = view.frame.height/2
        view.clipsToBounds = true
    }
    
    static func setShadow(onView view:UIView, shadowRadius:CGFloat=20, shadowOpacity:Float = 0.5, shadowColor:UIColor = UIColor(red: 124/255, green: 122/255, blue: 122/255, alpha: 1), shadowOffset:CGSize = CGSize(width: 0, height: 0)){
        view.layer.shadowColor = shadowColor.cgColor
        view.layer.shadowOffset = shadowOffset
        view.layer.shadowRadius = shadowRadius
        view.layer.shadowOpacity = shadowOpacity
        view.layer.masksToBounds = false
    }
    
    
    static func setupPrimaryButtonShadowAndColor(_ button:UIButton){
        let primaryColor = UIColor(red: 229/255, green: 149/255, blue: 15/255, alpha: 1)
        let shadowColor = UIColor(red: 206/255, green: 144/255, blue: 41/255, alpha: 1)
        
        button.layer.cornerRadius = 5.0
        button.backgroundColor = primaryColor
        button.layer.shadowColor = shadowColor.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.layer.masksToBounds = false
        let title = button.titleLabel?.text?.uppercased()
        button.setTitle(title, for: .normal)
    }
    
    static func setupSecondaryButtonShadowAndColor(_ button: UIButton){
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor(red: 91/255, green: 92/255, blue: 177/255, alpha: 1.0).cgColor
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.cornerRadius = 5
        let title = button.titleLabel?.text?.uppercased()
        button.setTitle(title, for: .normal)
    }
    
    static func dateFormatToTimeFormat(fromTimestamp timestamp:Double) -> String{
        if timestamp > 0.0 {
            let date = Date(timeIntervalSince1970: timestamp)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.short //Set time style
//            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
            dateFormatter.timeZone = .current
            let localDate = dateFormatter.string(from: date)
            return localDate
        }
        return ""
    }
    
    static func dateFormatToDateFormat(fromTimestamp timestamp:Double) -> String{
        if timestamp > 0.0 {
            let date = Date(timeIntervalSince1970: timestamp)
            let dateFormatter = DateFormatter()
//            dateFormatter.timeStyle = DateFormatter.Style.short //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
            dateFormatter.timeZone = .current
            let localDate = dateFormatter.string(from: date)
            return localDate
        }
        return ""
    }
}
