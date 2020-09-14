//
//  WeatherHourlyTableViewCell.swift
//  Weather
//
//  Created by BasicFirst on 7/27/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import UIKit

protocol WeatherHourlyCellDelegate: AnyObject {
    func hourlyMoreButtonClicked(_ indexPath:IndexPath?)
}

class WeatherHourlyTableViewCell: UITableViewCell {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var moreDetailButton: UIButton!
    @IBOutlet weak var mainContainerView: UIView!
    
    var indexPath:IndexPath?
    weak var delegate: WeatherHourlyCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupUI(){
        setupShadow()
        setupButton()
    }
    
    func setupShadow(){
        let shadowColor = UIColor(red: 113/255, green: 113/255, blue: 119/255, alpha: 1)
        Utility.setCornersRadiusForAllCorners(ofView: mainContainerView, withRaidus: 5.0)
        Utility.setShadow(onView: mainContainerView, shadowRadius: 5.0, shadowColor: shadowColor)
    }

    func setupButton(){
        Utility.setupPrimaryButtonShadowAndColor(moreDetailButton)
    }

    
    @IBAction func buttonClicked(_ sender: Any) {
        delegate?.hourlyMoreButtonClicked(indexPath)
    }
}
