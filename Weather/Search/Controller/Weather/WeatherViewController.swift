//
//  WeatherViewController.swift
//  Weather
//
//  Created by BasicFirst on 7/27/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import UIKit
import CoreLocation
import SVProgressHUD
import FittedSheets

class WeatherViewController: BaseViewController {

    @IBOutlet weak var temperatureContainerView: UIView!
    
    @IBOutlet weak var summeryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var apparentTemperatureLabel: UILabel!
    
    @IBOutlet weak var moreDetailButton: UIButton!
    @IBOutlet weak var hourlyButton: UIButton!
    
    let locationManager = CLLocationManager()
    
    //Default Latitude & Longitude Delhi
    var latitude:Double? = 28.7041
    var longitude:Double? = 77.1025
    
    var weatherViewModel:WeatherViewModel?
    
    var isProgressHudShown:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLocationManager()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        setupButton()
        setupView()
        setupBackBarButtonTitle()
    }
    
    func setupButton(){
        Utility.setupSecondaryButtonShadowAndColor(moreDetailButton)
        Utility.setupPrimaryButtonShadowAndColor(hourlyButton)
    }
    
    func setupView(){
        Utility.setCornersRadiusForAllCorners(ofView: temperatureContainerView, withRaidus: temperatureContainerView.frame.height/2)
        Utility.setShadow(onView: temperatureContainerView, shadowRadius: 10, shadowOpacity: 1, shadowColor: UIColor.init(red: 235/255, green: 235/255, blue: 251/255, alpha: 1))
    }

    @IBAction func buttonClicked(_ sender: Any) {
        guard let button:UIButton = sender as? UIButton else{
            return
        }
        
        let buttonKey:WeatherButtonKey = WeatherButtonKey(rawValue: button.tag) ?? .none
        
        switch buttonKey {
        case .none:
            print("Weather: Do Nothing")
        case .moreDetail:
            buttonClickedMoreDetail()
        case .hourly:
            buttonClickedHourly()
        }
    }
    
    
    func buttonClickedMoreDetail(){
        openWeatherDetailViewController(weatherViewModel?.weatherCurrentyData)
    }
    
    func buttonClickedHourly(){
        guard let hourlyViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Constant.kIdentifierWeatherHourlyViewController) as? WeatherHourlyViewController else {
            return
        }
        hourlyViewController.datasource = weatherViewModel?.weatherHourlyReport
        self.navigationController?.pushViewController(hourlyViewController, animated: true)
    }

}


//CoreLocation
extension WeatherViewController : CLLocationManagerDelegate{
    func setupLocationManager(){
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.latitude = location.coordinate.latitude
            self.longitude = location.coordinate.longitude
            
            UserDefaultSave.setLatitude(value: self.latitude ?? Constant.kDefaultLatitude)
            UserDefaultSave.setLongitude(value: self.longitude ?? Constant.kDefaultLongitude)
            
            if !isProgressHudShown {
                getWeatherDataFromServer(showProgressHUD: true)
                isProgressHudShown = true
            }
            getWeatherDataFromServer(showProgressHUD: false)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            showLocationDisabledAlert()
        }
        if status == CLAuthorizationStatus.notDetermined{
            showValidationAlert(title: Constant.kPermissionDeniedTitle, message: Constant.kGPSNotAvailableMessage)
//            getWeatherDataFromServer()
        }
    }
    
    func showLocationDisabledAlert(){
        showValidationAlert(title: Constant.kPermissionDeniedTitle, message: Constant.kPermissionDeniedMessage)
    }
}


//MARK: API Calling
extension WeatherViewController {
    func getWeatherDataFromServer(showProgressHUD:Bool){
        
        let latitude = UserDefaultSave.getLatitude()
        let longitude = UserDefaultSave.getLongitude()
        
        if latitude == 0.0 || longitude == 0.0 {
            self.latitude = Constant.kDefaultLatitude
            self.longitude = Constant.kDefaultLongitude
        }
        
        let model = WeatherModel(latitude: latitude, longitude: longitude)
        let viewModel = WeatherViewModel(model)
        
        if showProgressHUD {
            SVProgressHUD.show()
        }
        viewModel.getWeatherDataFromServer { [weak self](weatherViewModel) in
            SVProgressHUD.dismiss()
            self?.getWeatherResponse(weatherViewModel)
        }
    }
    
    func getWeatherResponse(_ viewModel: WeatherViewModel){
        if viewModel.error == .networkError{
            showValidationAlert(title: Constant.kValidationAlertTitle, message: Constant.kValidationAlertNetworkError)
            return
        }
        if viewModel.error == .responseError{
            showValidationAlert(title: Constant.kValidationAlertTitle, message: Constant.kSomeThingWentWrong)
            return
        }
        //success response from server
        setupDatasourceOnView(viewModel)
    }
    
    func setupDatasourceOnView(_ viewModel:WeatherViewModel){
        weatherViewModel = viewModel
        
        summeryLabel.text = viewModel.summary
        temperatureLabel.text = (viewModel.temperature ?? "") + Constant.kSymbolDegree
        apparentTemperatureLabel.text = Constant.kFeelsLike + (viewModel.apparentTemperature ?? "") + Constant.kSymbolDegree
    }
    
}
