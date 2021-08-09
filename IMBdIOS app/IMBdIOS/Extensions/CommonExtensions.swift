//
//  CommonExtensions.swift
//  IMBdIOS
//
//  Created by ChethanBhandarkar on 03/08/21.
//

import Foundation
import UIKit

var imageCache = NSCache<AnyObject,AnyObject>()
extension UIImageView{
    
    func loadUrlImage(urlstring:String)
    {
        if let image = imageCache.object(forKey: urlstring as NSString) as? UIImage
        {
            self.image = image
            return
        }
        
        guard let url = URL(string:urlstring) else{
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler:{
           (data,response,error)  in
            DispatchQueue.main.async {
                if let data = data{
                    if let image = UIImage(data:data)
                    {   imageCache.setObject(image, forKey:urlstring as NSString)
                        self.image = image
                    }
                }
            }
        }).resume()
    }
}

