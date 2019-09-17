//
//  Extensions.swift
//  Youtube_practice_fix
//
//  Created by Johanes Vincent Fernando on 17/09/19.
//  Copyright © 2019 SpaceColony. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintWithFormat(format: String, views: UIView...){
        var viewdictionary = [String: UIView]()
        for(index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewdictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewdictionary))
    }
}
