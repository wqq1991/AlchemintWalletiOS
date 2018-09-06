//
//  JWButtonExtion.swift
//  HelloSwift
//
//  Created by Joe on 16/3/29.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit

let disabledBackgroundColorKey: String = "disabledBackgroundColorKey"
let enabledBackgroundColorKey: String = "enabledBackgroundColorKey"
let jwEnabledKey: String = "jwEnabledKey"

@IBDesignable
extension UIButton  {
    /*
    @IBInspectable var jwEnabled : Bool {
    
        get {
        
            if objc_getAssociatedObject(self, jwEnabledKey) != nil {
             
                return objc_getAssociatedObject(self, jwEnabledKey) as! Bool;
            }
            
            return  false;
        }
        
        set {
        
            objc_setAssociatedObject(self, jwEnabledKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        
            self.isEnabled = jwEnabled
            
            if (jwEnabled == false) {
            
                UIView.animate(withDuration: 0.35, animations: { () -> Void in
                    
                    self.backgroundColor = self.disabledBackgroundColor
                })
                
            }else
            {
                UIView.animate(withDuration: 0.35, animations: { () -> Void in
                    
                    self.backgroundColor = self.enabledBackgroundColor
                })
            }
 
        }
 
    }
    */
    
   @IBInspectable  var disabledBackgroundColor : UIColor {
    
        get {
        
            let any = objc_getAssociatedObject(self, disabledBackgroundColorKey)
            
            if any == nil {
            
                return UIColor.clear;
            }
            
            return  any as! UIColor;
        }
    
        set {
         
            objc_setAssociatedObject(self, disabledBackgroundColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            if !self.isEnabled {
            
                UIView.animate(withDuration: 0.35, animations: { () -> Void in
                    
                    self.backgroundColor = self.disabledBackgroundColor
                })
            }
        }
    }
    
   @IBInspectable var enabledBackgroundColor : UIColor {
    
        get {
            
            let any = objc_getAssociatedObject(self, enabledBackgroundColorKey)
            
            if any == nil {
            
                return UIColor.clear;
            }
            
            return any as! UIColor;
        }
        
        set {
           
           objc_setAssociatedObject(self, enabledBackgroundColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            if self.isEnabled {
            
                UIView.animate(withDuration: 0.35, animations: { () -> Void in
                    
                    self.backgroundColor = self.enabledBackgroundColor
                })
            }
            
        }
    
    }
    
}
