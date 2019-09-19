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

extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}

let imagechache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var imgurl: String?
    
    func loadImageFromURL(urlstring: String) {
        imgurl = urlstring
        let url = NSURL(string: urlstring)
        
        if let imgfromchache = imagechache.object(forKey: urlstring as AnyObject) as? UIImage {
            self.image = imgfromchache
            return
        }
        
        URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async{
                let imagetochache = UIImage(data: data!)                
                if self.imgurl == urlstring {
                    self.image = imagetochache
                }
                imagechache.setObject(imagetochache!, forKey: urlstring as AnyObject)
            }
        }.resume()
    }
    func loadProfFromURL(urlstring: String) {
        let url = NSURL(string: urlstring)
        
        URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async{
                self.image = UIImage(data: data!)
            }
        }.resume()
    }
}
