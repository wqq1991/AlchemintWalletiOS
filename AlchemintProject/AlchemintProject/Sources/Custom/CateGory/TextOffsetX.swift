//
//  o.swift
//  HelloSwift
//
//  Created by Joe on 16/3/4.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit

private var _textOffsetX: CGFloat = 0

@IBDesignable
extension UITextField {
  
 /// 设置textfield 文字偏移量
    
    @IBInspectable
    var textOffsetX: CGFloat {
    
        get {
        
            return _textOffsetX
        }
        
        set {
         
             _textOffsetX = newValue
            
            let view = UIView(frame: CGRect(x: 0,y: 0,width: _textOffsetX,height: 30))
            
            view.backgroundColor = UIColor.clear
            
            leftView = view
           
            leftViewMode = UITextFieldViewMode.always
            
        }
    
    }

}
