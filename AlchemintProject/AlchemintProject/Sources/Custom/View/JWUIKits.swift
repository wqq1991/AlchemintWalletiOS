//
//  JWUIKits.swift
//  HelloSwift
//
//  Created by Joe on 16/3/1.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit

@IBDesignable
class JWView: UIView {
    
    func overForTime(_ time: TimeInterval ) {
      
                UIView.animate(withDuration: 2, animations: { () -> Void in
                    
                    self.alpha = 0.0
                    
                    }, completion: { (Bool) -> Void in
                        
                        self .removeFromSuperview()
                })
        
        
    }
   
   @IBInspectable var borderColor: UIColor? {
 
        didSet {
        
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        
        didSet {
        
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
      
        didSet {
        
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
}

@IBDesignable
class JWButton: UIButton {
    
    @IBInspectable var borderColor: UIColor? {
        
        didSet {
            
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        
        didSet {
            
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        
        didSet {
            
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
}

@IBDesignable
class JWLabel: UILabel {
    
    @IBInspectable var borderColor: UIColor? {
        
        didSet {
            
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        
        didSet {
            
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        
        didSet {
            
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
}

@IBDesignable
class JWTextField: UITextField {

    
//    @IBInspectable var borderColor: UIColor? {
//        
//        didSet {
//            
//            layer.borderColor = borderColor?.cgColor
//        }
//    }
//    
//    @IBInspectable var borderWidth: CGFloat = 0 {
//        
//        didSet {
//            
//            layer.borderWidth = borderWidth
//        }
//    }
//    
//    @IBInspectable var cornerRadius: CGFloat = 0 {
//        
//        didSet {
//            
//            layer.cornerRadius = cornerRadius
//            layer.masksToBounds = true
//        }
//    }
    
    override var isEditing: Bool {
    
        get {
        
            if super.isEditing {
                
            self.borderColor = UIColor.white

        }else
        {
            self.borderColor = UIColor.colorFromeRGB(0xC8C8C8)
        }
            
          return super.isEditing
        }
        
        set {


        }
     
        }
    
}

@IBDesignable
class JWImageView: UIImageView {
    
    @IBInspectable var borderColor: UIColor? {
        
        didSet {
            
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        
        didSet {
            
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        
        didSet {
            
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
}

