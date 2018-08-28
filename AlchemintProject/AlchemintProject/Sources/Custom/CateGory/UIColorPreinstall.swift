//
//  UIColorPreinstall.swift
//  HelloSwift
//
//  Created by Joe on 16/3/7.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit

extension UIColor {

    /**
     16进制颜色 转 UIColor
     
     - parameter rgbValue: 16进制颜色值
     - parameter a:        alpha
     
     - returns: UIColor
     */
    class func colorFromeRGB(_ rgbValue: NSInteger, A a:CGFloat) -> UIColor {
        
          return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0 , blue: ((CGFloat)(rgbValue & 0xFF))/255.0, alpha: a)
    }
    
    /**
     16进制颜色 转 UIColor
     
     - parameter rgbValue: 16进制颜色值
     - parameter a:        1.0
     
     - returns: UIColor
     */
    class func colorFromeRGB(_ rgbValue: NSInteger) -> UIColor {
     
      return UIColor.colorFromeRGB(rgbValue, A: 1.0)
    }
    
    
    /**
     RGBA颜色 转 UIColor
     
     - parameter r: red
     - parameter g: green
     - parameter b: blue
     
     - returns: UIColor
     */
    class func colorWithRGB(R r: CGFloat, G g: CGFloat, B b: CGFloat) -> UIColor {
        
        return UIColor.colorWithRGBA(R: r, G: g, B: b, A: 1.0)
    }
    
    /**
     RGBA颜色 转 UIColor
     
     - parameter r: red
     - parameter g: green
     - parameter b: blue
     - parameter a: alpha
     
     - returns: UIColor
     */
    class func colorWithRGBA(R r: CGFloat, G g: CGFloat, B b: CGFloat, A a: CGFloat) -> UIColor {
    
        return UIColor(red: r / 255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
   
}
