//
//  WeatherDetailViewController.swift
//  Weather
//
//  Created by BasicFirst on 7/27/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import UIKit

class WeatherDetailViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data:WeatherData?
    var datasourceTitle:[String] = []
    var datasourceDescription:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }

    func setupUI(){
//        tableView.separatorStyle = .none
        setupDatasource()
    }
    
    func setupDatasource(){
        setupTitle()
        setupDescription()
    }
    
    func setupTitle(){
        datasourceTitle = [Constant.kDetailVCTitleTime, Constant.kDetailVCTitleSummary, Constant.kDetailVCTitlePrecipitationType, Constant.kDetailVCTitlePrecipitationIndensity, Constant.kDetailVCTitlePrecipitationProbability, Constant.kDetailVCTitleTemperature, Constant.kDetailVCTitleApparentTemperature, Constant.kDetailVCTitleHumidity, Constant.kDetailVCTitlePressure, Constant.kDetailVCTitleWindSpeed, Constant.kDetailVCTitleVisibility, Constant.kDetailVCTitleOzone]
    }
    
    func setupDescription(){
        let time = Utility.dateFormatToDateFormat(fromTimestamp: (data?.time ?? 0.0))
        let precipIntensity = String((data?.precipIntensity ?? 0.0) * 100)  + Constant.kSymbolPercentage
        let precipProbability = String((data?.precipProbability ?? 0.0) * 100)  + Constant.kSymbolPercentage
        let temperature = String(data?.temperature ?? 0.0) + Constant.kSymbolDegree
        let apparentTemperature = String(data?.apparentTemperature ?? 0.0) + Constant.kSymbolDegree
        let humidity = String((data?.humidity ?? 0.0) * 100)  + Constant.kSymbolPercentage
        let pressure = String(data?.pressure ?? 0.0)
        let windSpeed = String(data?.windSpeed ?? 0.0) + Constant.kSymbolKMH
        let visibility = String((data?.visibility ?? 0.00) * 100)  + Constant.kSymbolPercentage
        let ozone = String(data?.ozone ?? 0.0)
        let summary = (data?.summary ?? "")
        let precipType = (data?.precipType ?? "")
        
        datasourceDescription = [time, summary, precipType, precipIntensity, precipProbability, temperature, apparentTemperature, humidity, pressure, windSpeed, visibility, ozone]
    }
}


extension WeatherDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasourceTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.kIdentifierWeatherDetailTableViewCell, for: indexPath) as? WeatherDetailTableViewCell else{
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        
        cell.titleLabel.text = datasourceTitle[indexPath.row]
        cell.descriptionLabel.text = datasourceDescription[indexPath.row]

        return cell
    }
}

