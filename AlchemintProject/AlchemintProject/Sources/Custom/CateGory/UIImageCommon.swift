//
//  UIImageCommon.swift
//  HelloSwift
//
//  Created by Joe on 16/3/7.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit

extension UIImage {

    /**
     把UIColor 转换成一个纯色图片
     
     - parameter aColor: Color
     - returns: Image
     */
  class func  imageWithColor(_ aColor: UIColor) -> UIImage {
     
        return imageWithColor(aColor, withFrame: CGRect(x: 0, y: 0, width: 1, height: 1))
    }

    
    /**
     把UIColor 转换成一个纯色图片
     
     - parameter aColor: Color
     - parameter aFrame: Frame
     
     - returns: Image
     */
  class  func imageWithColor(_ aColor: UIColor ,withFrame aFrame: CGRect) -> UIImage {
    
        UIGraphicsBeginImageContext(aFrame.size)
    
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(aColor.cgColor)
        
        context?.fill(aFrame)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return img!;
    }
    
    /**
     对图片尺寸进行压缩
     
     - parameter targetSize: 压缩之后的图片尺寸
     
     - returns: 压缩之后的图片
     */
    func scaledToSize(_ targetSize :CGSize) -> UIImage {
        var targetSize = targetSize
    
        let sourceImage = self
        
        var newImage :UIImage?
        
        let imageSize = sourceImage.size
        
        var scaleFactor: CGFloat = 0.0
        
        if imageSize.equalTo(targetSize) == false {
        
            let widthFactor = targetSize.width / imageSize.width
        
            let heightFactor = targetSize.height / imageSize.height
        
            if widthFactor < heightFactor {
            
                scaleFactor = heightFactor
            }else{
            
            scaleFactor = widthFactor
            }
        }
        
        scaleFactor = min(scaleFactor, 1.0)
        let targetWidth = imageSize.width * scaleFactor
        let targetHeight = imageSize.height * scaleFactor
        
        targetSize = CGSize(width: floor(targetWidth), height: floor(targetHeight))
        UIGraphicsBeginImageContext(targetSize)
        
        sourceImage.draw(in: CGRect(x: 0, y: 0, width: ceil(targetWidth), height: ceil(targetHeight)))
        
        if newImage == nil {
        
            newImage = sourceImage
        }
        
        UIGraphicsEndImageContext()
        
        return newImage!;
    }
    
    
    func scaledToSize(_ targetSize: CGSize, highQuality ahighQuality :Bool) -> UIImage{
        var targetSize = targetSize
    
        if ahighQuality {
        
            targetSize = CGSize(width: 2 * targetSize.width, height: 2 * targetSize.height)
        }
        
        return self.scaledToSize(targetSize);
    } 
   
}
