//
//  VideoCell.swift
//  Youtube_practice
//
//  Created by Johanes Vincent Fernando on 16/09/19.
//  Copyright © 2019 SpaceColony. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupviews()
    }
    
    let ImgThumbnail:UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        return imgView
    }()
    
    let ProfileImage: UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return imgView
    }()
    
    let SeparatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9037305713, green: 0.907913208, blue: 0.918135941, alpha: 1)
        return view
    }()
    
    let TxtTitle: UILabel = {
        let txt = UILabel()
        txt.translatesAutoresizingMaskIntoConstraints  = false
        txt.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        return txt
    }()
    
    let TxtSubtitle: UILabel = {
        let txt = UILabel()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return txt
    }()
    
    private func setupviews(){
        addSubview(ImgThumbnail)
        addSubview(SeparatorLine)
        addSubview(ProfileImage)
        addSubview(TxtTitle)
        addSubview(TxtSubtitle)
        
        addConstraintWithFormat(format: "H:|-16-[v0]-16-|", views: ImgThumbnail)
        addConstraintWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: ImgThumbnail, ProfileImage, SeparatorLine)
        addConstraintWithFormat(format: "H:|-16-[v0(44)]", views: ProfileImage)
        addConstraintWithFormat(format: "H:|[v0]|", views: SeparatorLine)
        
        addConstraints([NSLayoutConstraint(item: TxtTitle, attribute: .top, relatedBy: .equal, toItem: ImgThumbnail, attribute: .bottom, multiplier: 1, constant: 8)])
        addConstraints([NSLayoutConstraint(item: TxtTitle, attribute: .left, relatedBy: .equal, toItem: ProfileImage, attribute: .right, multiplier: 1, constant: 8)])
        addConstraints([NSLayoutConstraint(item: TxtTitle, attribute: .right, relatedBy: .equal, toItem: ImgThumbnail, attribute: .right, multiplier: 1, constant: 0)])
        addConstraints([NSLayoutConstraint(item: TxtTitle, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20)])
        
        addConstraints([NSLayoutConstraint(item: TxtSubtitle, attribute: .top, relatedBy: .equal, toItem: TxtTitle, attribute: .bottom, multiplier: 1, constant: 8)])
        addConstraints([NSLayoutConstraint(item: TxtSubtitle, attribute: .left, relatedBy: .equal, toItem: ProfileImage, attribute: .right, multiplier: 1, constant: 8)])
        addConstraints([NSLayoutConstraint(item: TxtSubtitle, attribute: .right, relatedBy: .equal, toItem: ImgThumbnail, attribute: .right, multiplier: 1, constant: 0)])
        addConstraints([NSLayoutConstraint(item: TxtSubtitle, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20)])
        
        
    }
    
    private func addConstraintWithFormat(format: String, views: UIView...){
        var viewdictionary = [String: UIView]()
        for(index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewdictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewdictionary))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
