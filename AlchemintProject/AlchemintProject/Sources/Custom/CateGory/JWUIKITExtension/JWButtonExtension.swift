//
//  JWButtonExtion.swift
//  HelloSwift
//
//  Created by Joe on 16/3/29.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit

private var _disabledBackgroundColor: UIColor?; var _enabledBackgroundColor: UIColor?; var _jwEnabled: Bool?;

@IBDesignable
extension UIButton  {
    
    @IBInspectable var jwEnabled : Bool {
    
        get {
            return _jwEnabled!;
        }
        
        set {
         
            _jwEnabled = newValue
            self.isEnabled = _jwEnabled!
            
            if (_jwEnabled == false) {
            
                UIView.animate(withDuration: 0.35, animations: { () -> Void in
                    
                    self.backgroundColor = _disabledBackgroundColor
                })
                
            }else
            {
                UIView.animate(withDuration: 0.35, animations: { () -> Void in
                    
                    self.backgroundColor = _enabledBackgroundColor
                })
            }
 
        }
    }
    
   @IBInspectable var disabledBackgroundColor : UIColor {
    
        get {
         
            return  _disabledBackgroundColor!;
        }
    
        set {
          
            if !self.isEnabled {
            
                _disabledBackgroundColor = newValue
                
                UIView.animate(withDuration: 0.35, animations: { () -> Void in
                    self.backgroundColor = self.disabledBackgroundColor
                })
            }
        }
    }
    
   @IBInspectable var enabledBackgroundColor : UIColor {
    
        get {
            
            return _enabledBackgroundColor!
        }
        
        set {
            
            if self.isEnabled {
                
                _enabledBackgroundColor = newValue
                UIView.animate(withDuration: 0.35, animations: { () -> Void in
                    
                    self.backgroundColor = self.enabledBackgroundColor
                })
            }
        }
    
    } 
}
