//
//  MenuBar.swift
//  Youtube_practice_fix
//
//  Created by Johanes Vincent Fernando on 17/09/19.
//  Copyright © 2019 SpaceColony. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    
    
    lazy var fragmentCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.01028202754, alpha: 1)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let iconNames = ["home","fire","subscription","user"]
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        fragmentCollection.register(FragmentCell.self, forCellWithReuseIdentifier: "cellid")
        addSubview(fragmentCollection)
        addConstraintWithFormat(format: "H:|[v0]|", views: fragmentCollection)
        addConstraintWithFormat(format: "V:|[v0]|", views: fragmentCollection)
        
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        fragmentCollection.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: [])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! FragmentCell
        cell.FragmentIcon.image = UIImage(named: iconNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = #colorLiteral(red: 0.4173018932, green: 0.1169792786, blue: 0.1265625656, alpha: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
