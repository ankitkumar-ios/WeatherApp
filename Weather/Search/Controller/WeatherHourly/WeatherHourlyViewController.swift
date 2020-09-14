//
//  WeatherHourlyViewController.swift
//  Weather
//
//  Created by BasicFirst on 7/27/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import UIKit

class WeatherHourlyViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var datasource:WeatherReport?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        self.title = Constant.kHourlyVCTitle
        tableView.separatorStyle = .none
    }

}

extension WeatherHourlyViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.kIdentifierWeatherHourlyTableViewCell, for: indexPath) as? WeatherHourlyTableViewCell else{
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.delegate = self
        cell.indexPath = indexPath
        
        guard let data:WeatherData = datasource?.data?[indexPath.row] else{
            return cell
        }
        
        cell.temperatureLabel.text = String(data.temperature ?? 0.0) + Constant.kSymbolDegree
        cell.timeLabel.text = Utility.dateFormatToTimeFormat(fromTimestamp: (data.time ?? 0.0)) 
        cell.summaryLabel.text = data.summary
        
        
        return cell
    }
}


extension WeatherHourlyViewController: WeatherHourlyCellDelegate{
    func hourlyMoreButtonClicked(_ indexPath: IndexPath?) {
        guard let index = indexPath?.row else{
            return
        }
        openWeatherDetailViewController(datasource?.data?[index])
    }
}
