//
//  UserDefaultSave.swift
//  Weather
//
//  Created by BasicFirst on 7/27/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import UIKit

enum UserDefaultKeys:String{
    case latitude
    case longitude
}

class UserDefaultSave: NSObject {
    static func getLatitude() -> Double{
        let latitude = UserDefaults.standard.double(forKey: UserDefaultKeys.latitude.rawValue)
        if latitude == 0.0 {
            return Constant.kDefaultLatitude
        }
        return latitude
    }
    
    static func setLatitude(value:Double){
        UserDefaults.standard.setValue(value, forKey: UserDefaultKeys.latitude.rawValue)
    }


    static func getLongitude() -> Double{
        let longitude = UserDefaults.standard.double(forKey: UserDefaultKeys.longitude.rawValue)
        if longitude == 0.0 {
            return Constant.kDefaultLongitude
        }
        return longitude
    }
    
    static func setLongitude(value:Double){
        UserDefaults.standard.setValue(value, forKey: UserDefaultKeys.longitude.rawValue)
    }

}
