//
//  FragmentCell.swift
//  Youtube_practice_fix
//
//  Created by Johanes Vincent Fernando on 17/09/19.
//  Copyright © 2019 SpaceColony. All rights reserved.
//

import UIKit

class FragmentCell: BaseCell {
    
    override var isHighlighted: Bool {
        didSet {
            FragmentIcon.tintColor = isHighlighted ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.4173018932, green: 0.1169792786, blue: 0.1265625656, alpha: 1)
        }
    }
    override var isSelected: Bool {
        didSet {
            FragmentIcon.tintColor = isSelected ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.4173018932, green: 0.1169792786, blue: 0.1265625656, alpha: 1)
        }
    }
    
    let FragmentIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "home")
        return img
    }()
    
    override func setupView() {
        super.setupView()
        addSubview(FragmentIcon)
        addConstraintWithFormat(format: "H:[v0(20)]", views: FragmentIcon)
        addConstraintWithFormat(format: "V:[v0(20)]", views: FragmentIcon)
        addConstraint(NSLayoutConstraint(item: FragmentIcon, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraints([NSLayoutConstraint(item: FragmentIcon, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)])

    }
  
}
