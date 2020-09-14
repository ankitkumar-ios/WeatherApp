//
//  Constant.swift
//  Weather
//
//  Created by BasicFirst on 7/27/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import Foundation

struct Constant {
    
    static let kConstantString = "Constant String"
    
    //MARK: IDENTIFIERS
    static let kMainStoryboardName = "Main"
    static let kIdentifierWeatherViewController = "WeatherViewController"
    
    //MARK: BASE_VIEW_CONTROLLER
    static let kAlertButtonOk = "Ok"

    
    //MARK: Weather_VIEW_CONTROLLER
    static let kPermissionDeniedTitle = "Disabled"
    static let kPermissionDeniedMessage = "Permission to location is disabled. Kindly allow permission to get accurate results."
    
    static let kGPSNotAvailableMessage = "GPS facility might not be available on this device."
    
    static let kDefaultLatitude:Double = 28.7041
    static let kDefaultLongitude:Double = 77.1025
    
    static let kFeelsLike = "Feels like: "
    
    
    
    //MARK: Validation Title
    static let kValidationAlertTitle = "Message"
    static let kValidationAlertNetworkError = "Please check your internet connection"
    static let kSomeThingWentWrong = "Something went wrong, Please try again"
    
    
    //MARK: Symbols
    static let kSymbolDegree = "°C"
    static let kSymbolPercentage = "%"
    static let kSymbolKMH = " km/h"
    
    
    //MARK: Identifiers
    //ViewControllers
    static let kIdentifierWeatherDetailViewController = "WeatherDetailViewController"
    static let kIdentifierWeatherHourlyViewController = "WeatherHourlyViewController"
    
    //Cells
    static let kIdentifierWeatherHourlyTableViewCell = "WeatherHourlyTableViewCell"
    static let kIdentifierWeatherDetailTableViewCell = "WeatherDetailTableViewCell"
    
    
    //MARK: Hourly
    static let kHourlyVCTitle = "Hourly Detail"
    
    
    //MARK: Detail
    static let kDetailVCTitleTime = "Time"
    static let kDetailVCTitleSummary = "Summary"
    static let kDetailVCTitlePrecipitationIndensity = "Precipitation Intensity"
    static let kDetailVCTitlePrecipitationProbability = "Precipitation Probability"
    static let kDetailVCTitlePrecipitationType = "Precipitation Type"
    static let kDetailVCTitleTemperature = "Temperature"
    static let kDetailVCTitleApparentTemperature = "Feels like"
    static let kDetailVCTitleHumidity = "Humidity"
    static let kDetailVCTitlePressure = "Pressure"
    static let kDetailVCTitleWindSpeed = "Wind Speed"
    static let kDetailVCTitleVisibility = "Visibility"
    static let kDetailVCTitleOzone = "Ozone"
}
