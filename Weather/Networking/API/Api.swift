//
//  Api.swift
//  Weather
//
//  Created by BasicFirst on 7/27/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import UIKit
import Alamofire

enum ApiError: Int, Codable {
    case noError = 0
    case responseError
    case networkError
}
class Api: NSObject {
    
    static var SessionManager: Alamofire.SessionManager = Alamofire.SessionManager()
    
    static func getBaseURL() -> String {
        let serverURL = Environment().configuration(PlistKey.ServerURL)
        let connectionProtocol = Environment().configuration(PlistKey.ConnectionProtocol)
        let darkSkyKey = Environment().configuration(PlistKey.DarkSkyKey)
//        print("ServerURL" + serverURL)
        return connectionProtocol + "://" + serverURL + darkSkyKey + "/"
    }
    
    
    static func getWeatherReport(model:WeatherModel, completion:@escaping ((WeatherModel) -> Void)){
        let latitude = String(model.latitude ?? 0.0)
        let longitude = String(model.longitude ?? 0.0)
        
        let urlString = getBaseURL() + latitude + "," + longitude + "?units=auto"
        let url = URL(string: urlString)!
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        
        SessionManager.request(request).responseJSON { response in
            var model = WeatherModel()
            
            guard let json = response.data else{
                model.error = .responseError
                completion(model)
                return
            }
            
            if json.count == 0{
                model.error = .networkError
                completion(model)
                return
            }
            
            let jsonData = String(data: json, encoding: String.Encoding.utf8)
            let data = Data(jsonData?.utf8 ?? "".utf8)
            let decoder = JSONDecoder()
            
            do{
                model = try decoder.decode(WeatherModel.self, from: data)
                model.error = .noError
            }catch{
                model.error = .responseError
//                print(error.localizedDescription)
            }
            
            completion(model)
            
        }
    }
    
}
