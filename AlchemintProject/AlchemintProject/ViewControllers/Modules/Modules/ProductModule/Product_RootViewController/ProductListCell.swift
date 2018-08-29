//
//  ProductListCell.swift
//  HelloSwift
//
//  Created by Joe on 16/4/8.
//  Copyright © 2016年 Joe. All rights reserved.
//

import Foundation
import UIKit

class ProductListCell: UITableViewCell {

    /*
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        
        super.setHighlighted(highlighted, animated: animated)
        
        if highlighted {
         
            let anim = POPBasicAnimation(propertyNamed: kPOPViewScaleXY)
            anim?.toValue = NSValue(cgSize: CGSize(width: 1.1, height: 1.1))
            anim?.duration = 0.35
            self.textLabel!.pop_add(anim, forKey: "anim")
            
        }else
        {
            let anim = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
            anim?.toValue = NSValue(cgSize: CGSize(width: 1.0, height: 1.0))
            anim?.springBounciness = 20.0
            anim?.springSpeed = 20.0
            self.textLabel!.pop_add(anim, forKey: "anim")
        }
        
        DLog("setHighlighted")
    }
 
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        self.contentView.frame = CGRect(x: 0, y: 40, width: SCREEN_WIDTH, height: 40)
        
        UIView .animate(withDuration: 1.0, delay: 0.23, usingSpringWithDamping: 20, initialSpringVelocity: 20, options: UIViewAnimationOptions(), animations: { () -> Void in
            
            self.contentView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 40)
            
            }, completion: nil)
        
    }
    */
}
