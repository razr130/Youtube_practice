//
//  SettingCell.swift
//  Youtube_practice_fix
//
//  Created by Johanes Vincent Fernando on 19/09/19.
//  Copyright © 2019 SpaceColony. All rights reserved.
//

import UIKit

class SettingCell: BaseCell {
    
    let TxtSettingTitle: UILabel = {
        let txt = UILabel()
        txt.text = "App Settings"
        txt.font = UIFont.systemFont(ofSize: 12)
        txt.textColor = #colorLiteral(red: 0.3653247058, green: 0.3631581664, blue: 0.3669934273, alpha: 1)
        return txt
    }()
    
    let SettingIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "settings")
        image.contentMode = .scaleAspectFill
        image.tintColor = #colorLiteral(red: 0.3653247058, green: 0.3631581664, blue: 0.3669934273, alpha: 1)
        return image
    }()
    
    var setting: SettingsModel? {
        didSet {
            
            TxtSettingTitle.text = setting?.SettingTitle
            SettingIcon.image = UIImage(named: setting!.SettingIcon!)
            SettingIcon.setImageColor(color: #colorLiteral(red: 0.3653247058, green: 0.3631581664, blue: 0.3669934273, alpha: 1))
            
        }
    }
    
    override func setupView() {
        super.setupView()
        
        addSubview(TxtSettingTitle)
        addSubview(SettingIcon)
        addConstraintWithFormat(format: "H:|-20-[v0(18)]-20-[v1]|", views: SettingIcon, TxtSettingTitle)
        addConstraintWithFormat(format: "V:|-15-[v0]|", views: TxtSettingTitle)
        addConstraintWithFormat(format: "V:[v0(18)]", views: SettingIcon)
        addConstraint(NSLayoutConstraint(item: SettingIcon, attribute: .centerY, relatedBy: .equal, toItem: TxtSettingTitle, attribute: .centerY, multiplier: 1, constant: 0))
        

        
    }
}
