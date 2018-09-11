//
//  AccountTextField.swift
//  HelloSwift
//
//  Created by Joe on 16/3/1.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit

extension UITextField {

    
    
    

}

 
class AccountTextField: JWTextField  {
    
    var _maxLength: Int = 0
   @IBInspectable var maxLength: Int {

        get {

            return self._maxLength
        }
    
        set {
            
            
            self._maxLength = newValue
        }
    }
    
    var _minLength: Int = 0
    @IBInspectable var minLength: Int {
    
        get {
        
            return self.minLength
        }
        
        set {
        
            self.minLength = newValue
        }
    
    }
    
//    UITextFieldTextDidChangeNotification
    
}
