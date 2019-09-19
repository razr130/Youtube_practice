//
//  SettingController.swift
//  Youtube_practice_fix
//
//  Created by Johanes Vincent Fernando on 19/09/19.
//  Copyright © 2019 SpaceColony. All rights reserved.
//

import UIKit

class SettingController: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let settinglist: [SettingsModel] = [SettingsModel(settingtitle: "Settings", settingicon: "settings"),
    SettingsModel(settingtitle: "Terms & Privacy policy", settingicon: "padlock"),
    SettingsModel(settingtitle: "Send Feedback", settingicon: "bubble"),
    SettingsModel(settingtitle: "Help", settingicon: "help"),
    SettingsModel(settingtitle: "Switch Account", settingicon: "user-2"),
    SettingsModel(settingtitle: "Cancel", settingicon: "close")]
    
    
    let blackview = UIView()
    let settingsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    @objc func openSettings() {
        if let window = UIApplication.shared.keyWindow {
            
            blackview.backgroundColor = .black
            
            window.addSubview(blackview)
            window.addSubview(settingsCollection)
            let height = window.frame.height * 0.4
            let y = window.frame.height - height
            settingsCollection.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            blackview.frame = window.frame
            blackview.alpha = 0
            
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackview.alpha = 0.5
                self.settingsCollection.frame = CGRect(x: 0, y: y, width: self.settingsCollection.frame.width, height: self.settingsCollection.frame.height)
            }, completion: nil)
            
            blackview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
        }
        
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5, animations: {
            self.blackview.alpha = 0
            
             if let window = UIApplication.shared.keyWindow {
                self.settingsCollection.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 0)
            }
            
        })
    }
    
    override init() {
        super.init()
        
        settingsCollection.dataSource = self
        settingsCollection.delegate = self
        settingsCollection.register(SettingCell.self, forCellWithReuseIdentifier: "settingcellid")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settinglist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = settingsCollection.dequeueReusableCell(withReuseIdentifier: "settingcellid", for: indexPath) as! SettingCell
        cell.setting = settinglist[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: settingsCollection.frame.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
