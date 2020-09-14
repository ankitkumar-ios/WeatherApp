//
//  BaseViewController.swift
//  Weather
//
//  Created by BasicFirst on 7/27/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import UIKit
import FittedSheets

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setupBackBarButtonTitle(){
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backBarButtonItem.tintColor = UIColor.black
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    //MARK: Validation Alert
    func showValidationAlert(title:String, message:String, handler: ((UIAlertAction) -> Void)? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constant.kAlertButtonOk, style: .default, handler: { (action) in
            handler?(action)
        }))
        self.present(alert, animated: true)
    }
    
    func openWeatherDetailViewController(_ data: WeatherData?){
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Constant.kIdentifierWeatherDetailViewController) as? WeatherDetailViewController else{
            return
        }
        detailVC.data = data
        let controller = SheetViewController(controller: detailVC, sizes: [.halfScreen])
        controller.topCornersRadius = 30.0
        self.present(controller, animated: false, completion: nil)
    }
    
}
