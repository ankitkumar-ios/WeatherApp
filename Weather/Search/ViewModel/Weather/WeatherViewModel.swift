//
//  WeatherViewModel.swift
//  Weather
//
//  Created by BasicFirst on 7/27/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import Foundation

enum WeatherButtonKey:Int{
    case none = 0
    case moreDetail = 1
    case hourly = 2
}

struct WeatherViewModel{
    let weatherModel: WeatherModel
    
    let error:ApiError?
    let temperature:String?
    let apparentTemperature:String?
    let summary:String?
    
    let weatherHourlyReport:WeatherReport?
    let weatherCurrentyData: WeatherData?
    
    init(_ weatherModel:WeatherModel) {
        self.weatherModel = weatherModel
        
        self.temperature = String(weatherModel.currently?.temperature ?? 0.0)
        self.apparentTemperature = String(weatherModel.currently?.apparentTemperature ?? 0.0)
        self.summary = weatherModel.currently?.summary
        self.error = weatherModel.error
        
        self.weatherCurrentyData = weatherModel.currently
        self.weatherHourlyReport = weatherModel.hourly
    }
    
    func getWeatherDataFromServer(completion:@escaping (WeatherViewModel)->Void ){
        Api.getWeatherReport(model: weatherModel) { (weatherModel) in
            let viewModel = WeatherViewModel(weatherModel)
            completion(viewModel)
        }
    }
}
