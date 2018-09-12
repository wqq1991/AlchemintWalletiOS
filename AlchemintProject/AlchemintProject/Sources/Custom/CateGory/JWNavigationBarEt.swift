//
//  JWNavigationBar.swift
//  HelloSwift
//
//  Created by Joe on 16/3/8.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit

let key: String = "coverViewKey"
private var _coverView:UIView?;

extension UINavigationBar {

    var coverView: UIView? {
        
        get {
            return _coverView;
        }
        
        set {
            _coverView = newValue;
        }
        
    }

    func setMyBackgroundColor(_ color: UIColor) {
    
        if self.coverView != nil {
        
            self.coverView?.backgroundColor = color
        
        }else {
        
            self.setBackgroundImage(UIImage(), for: .default)
            
            self.shadowImage = UIImage()
            
            let view = UIView()
            
            view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44)
            
            view.isUserInteractionEnabled = false
            
            view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            
            self.insertSubview(view, at: 0)
            
            view.backgroundColor = color

            self.coverView = view
        }
    
    }
    
}
