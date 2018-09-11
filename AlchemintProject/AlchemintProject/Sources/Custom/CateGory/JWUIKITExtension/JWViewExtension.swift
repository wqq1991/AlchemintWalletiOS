//
//  JWViewExtension.swift
//  HelloSwift
//
//  Created by Joe on 16/3/4.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit

private var _borderColor: UIColor?; var _borderWidth: CGFloat = 0.0; var _cornerRadius: CGFloat = 0.0;

@IBDesignable
extension UITextField {

    @IBInspectable var borderColor: UIColor? {
 
        get {
        
            _borderColor = UIColor.init(cgColor: layer.borderColor!)
            return _borderColor
        }
        
        set {
            _borderColor = newValue
            layer.borderColor = _borderColor?.cgColor
        }
        
    }
    
    @IBInspectable var borderWidth: CGFloat {
    
        get {
            _borderWidth = layer.borderWidth
            return _borderWidth
        }
    
        set {
            _borderWidth = newValue
            layer.borderWidth = _borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
    
    
        get {
        
            _cornerRadius = layer.cornerRadius
            return _cornerRadius
        }
    
        set {
            
            _cornerRadius = newValue
            
            layer.cornerRadius = _cornerRadius
            layer.masksToBounds = true
        }
    }
    
}
