//
//  WeatherDetailTableViewCell.swift
//  Weather
//
//  Created by BasicFirst on 7/27/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import UIKit

class WeatherDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mainContainerView: UIView!
    
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
//        setupShadow()
    }
    
    func setupShadow(){
        let shadowColor = UIColor(red: 113/255, green: 113/255, blue: 119/255, alpha: 1)
        Utility.setCornersRadiusForAllCorners(ofView: mainContainerView, withRaidus: 10.0)
        Utility.setShadow(onView: mainContainerView, shadowRadius: 10.0, shadowColor: shadowColor)
    }

}
