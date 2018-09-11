//
//  TextFidld.swift
//  HelloSwift
//
//  Created by Joe on 16/3/2.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit

@IBDesignable
extension UITextField {
 
    @IBInspectable
    var offsetX: CGFloat {
    
        get {
        
            return 10
        }
        
        set {

            let view = UIView(frame: CGRect(x: 0, y: 0, width: offsetX, height: 30))
            
            view.backgroundColor = UIColor.clear
            
            leftView = view
            
            leftViewMode = UITextFieldViewMode.always
        }
    }

}
