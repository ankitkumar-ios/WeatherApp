//
//  WeatherModel.swift
//  Weather
//
//  Created by BasicFirst on 7/27/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import Foundation

struct WeatherReport: Codable{
    var summary:String?
    var data:[WeatherData]?
    
    enum CodingKeys: String, CodingKey {
        case summary
        case data
    }
}


struct WeatherData: Codable{
    var time:Double?
    var summary:String?
    var icon:String?
    var precipIntensity:Float?
    var precipProbability:Float?
    var precipType:String?
    var temperature:Float?
    var apparentTemperature:Float?
    var humidity:Float?
    var pressure:Float?
    var windSpeed:Float?
    var cloudCover:Float?
    var visibility:Float?
    var ozone:Float?
    
    enum CodingKeys: String, CodingKey {
        case time
        case summary
        case icon
        case precipIntensity
        case precipProbability
        case precipType
        case temperature
        case apparentTemperature
        case humidity
        case pressure
        case windSpeed
        case cloudCover
        case visibility
        case ozone
    }

}

struct WeatherModel: Codable{
    var latitude:Double?
    var longitude:Double?
    var timezone:String?
    var currently:WeatherData?
    var hourly:WeatherReport?
    var error:ApiError?
    
    enum CodableKeys:String, CodingKey {
        case latitude
        case longitude
        case timezone
        case currently
        case hourly
    }
    
    init(latitude: Double?=nil, longitude: Double?=nil) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
