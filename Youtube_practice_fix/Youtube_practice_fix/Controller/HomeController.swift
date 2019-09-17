//
//  ViewController.swift
//  Youtube_practice
//
//  Created by Johanes Vincent Fernando on 11/09/19.
//  Copyright © 2019 SpaceColony. All rights reserved.
//

import UIKit

class HomeController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        let titlelabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titlelabel.text = "Home"
        titlelabel.textColor = .white
        titlelabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titlelabel
        collectionView?.backgroundColor = UIColor.white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cellid")
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        setUpMenubar()
        setUpNavMenu()
    }
    
    let menuBar: MenuBar = {
        let menu = MenuBar()
        return menu
    }()
    
    func setUpNavMenu() {
        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
        menuBtn.setImage(UIImage(named:"more"), for: .normal)
        menuBtn.addTarget(self, action: #selector(handleMenu), for: UIControl.Event.touchUpInside)
        
        let menubutton = UIBarButtonItem(customView: menuBtn)
        let currWidthmenu = menubutton.customView?.widthAnchor.constraint(equalToConstant: 18)
        currWidthmenu?.isActive = true
        let currHeightmenu = menubutton.customView?.heightAnchor.constraint(equalToConstant: 18)
        currHeightmenu?.isActive = true
        
        
        let searchBtn = UIButton(type: .custom)
        searchBtn.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
        searchBtn.setImage(UIImage(named:"search"), for: .normal)
        searchBtn.addTarget(self, action: #selector(handleSearch), for: UIControl.Event.touchUpInside)
        
        let searchbutton = UIBarButtonItem(customView: searchBtn)
        let currWidth = searchbutton.customView?.widthAnchor.constraint(equalToConstant: 18)
        currWidth?.isActive = true
        let currHeight = searchbutton.customView?.heightAnchor.constraint(equalToConstant: 18)
        currHeight?.isActive = true
        
        navigationItem.rightBarButtonItems = [menubutton, searchbutton]
    }
    
    @objc func handleSearch() {
        print("aaaaa")
    }
    @objc func handleMenu() {
    }
    
    private func setUpMenubar() {
        view.addSubview(menuBar)
        view.addConstraintWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintWithFormat(format: "V:|[v0(50)]", views: menuBar)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! VideoCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let heightme = (view.frame.width - 16 - 16) * 9 / 16
        
        return CGSize(width: view.frame.width, height: heightme + 16 + 68)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}

