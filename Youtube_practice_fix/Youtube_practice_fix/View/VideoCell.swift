//
//  VideoCell.swift
//  Youtube_practice
//
//  Created by Johanes Vincent Fernando on 16/09/19.
//  Copyright © 2019 SpaceColony. All rights reserved.
//

import UIKit

class VideoCell: BaseCell {
    
    let ImgThumbnail: CustomImageView = {
        let imgView = CustomImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    let ProfileImage: CustomImageView = {
        let imgView = CustomImageView()
        imgView.layer.cornerRadius = 22
        imgView.layer.masksToBounds = true
        imgView.contentMode = .scaleAspectFill
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
        txt.font = UIFont.boldSystemFont(ofSize: 16)
        txt.numberOfLines = 2
        return txt
    }()
    
    let TxtSubtitle: UITextView = {
        let txt = UITextView()
        txt.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        txt.isEditable = false
        txt.isScrollEnabled = false
        return txt
    }()
    
    var video: VideoModel? {
        didSet {
            TxtTitle.text = video?.Title
            
            LoadProf()
            LoadImg()
           
            if let profilimage = video?.channel?.ProfileImage {
                ProfileImage.image = UIImage(named: profilimage)
            }
            let numberformatter = NumberFormatter()
            numberformatter.numberStyle = .decimal
            TxtSubtitle.text = (video?.channel!.ChannelName)! + " - " + numberformatter.string(from: (video?.views)!)! + " views - "
            
            if let title = video?.Title {
                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
                
                if estimatedRect.size.height > 20 {
                    TxtTitleHeightConstraint!.constant = 44
                } else {
                    TxtTitleHeightConstraint!.constant = 20
                }
            }
        }
    }
    
    func LoadImg() {
        if let ImgThumb = video?.ImgThumbnail {
            ImgThumbnail.loadImageFromURL(urlstring: ImgThumb)
        }
    }
    
    func LoadProf() {
        if let ImgProf = video?.channel?.ProfileImage {
            ProfileImage.loadProfFromURL(urlstring: ImgProf)
        }
    }
    
        
    var TxtTitleHeightConstraint: NSLayoutConstraint?
    
    override func setupView(){
        addSubview(ImgThumbnail)
        addSubview(SeparatorLine)
        addSubview(ProfileImage)
        addSubview(TxtTitle)
        addSubview(TxtSubtitle)
        
        addConstraintWithFormat(format: "H:|-16-[v0]-16-|", views: ImgThumbnail)
        addConstraintWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-36-[v2(1)]|", views: ImgThumbnail, ProfileImage, SeparatorLine)
        addConstraintWithFormat(format: "H:|-16-[v0(44)]", views: ProfileImage)
        addConstraintWithFormat(format: "H:|[v0]|", views: SeparatorLine)
        
        addConstraints([NSLayoutConstraint(item: TxtTitle, attribute: .top, relatedBy: .equal, toItem: ImgThumbnail, attribute: .bottom, multiplier: 1, constant: 8)])
        addConstraints([NSLayoutConstraint(item: TxtTitle, attribute: .left, relatedBy: .equal, toItem: ProfileImage, attribute: .right, multiplier: 1, constant: 8)])
        addConstraints([NSLayoutConstraint(item: TxtTitle, attribute: .right, relatedBy: .equal, toItem: ImgThumbnail, attribute: .right, multiplier: 1, constant: 0)])
        
        TxtTitleHeightConstraint = NSLayoutConstraint(item: TxtTitle, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20)
        addConstraints([TxtTitleHeightConstraint!])
        
        addConstraints([NSLayoutConstraint(item: TxtSubtitle, attribute: .top, relatedBy: .equal, toItem: TxtTitle, attribute: .bottom, multiplier: 1, constant: 4)])
        addConstraints([NSLayoutConstraint(item: TxtSubtitle, attribute: .left, relatedBy: .equal, toItem: ProfileImage, attribute: .right, multiplier: 1, constant: 8)])
        addConstraints([NSLayoutConstraint(item: TxtSubtitle, attribute: .right, relatedBy: .equal, toItem: ImgThumbnail, attribute: .right, multiplier: 1, constant: 0)])
        addConstraints([NSLayoutConstraint(item: TxtSubtitle, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30)])
        
    }
}
