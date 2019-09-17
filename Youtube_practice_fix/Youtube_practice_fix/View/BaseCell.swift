//
//  BaseCell.swift
//  Youtube_practice_fix
//
//  Created by Johanes Vincent Fernando on 17/09/19.
//  Copyright © 2019 SpaceColony. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupView()
    }
    
    func setupView() {
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
