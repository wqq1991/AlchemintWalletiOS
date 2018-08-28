//
//  AutoLayoutAssist.swift
//  HelloSwift
//
//  Created by Joe on 16/3/7.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit

extension UIView {

    /**
     upDate AutoLayout
     
     - parameter attribute: attribute description
     - parameter value:     value description
     */
    func updateConstraint(_ attribute: NSLayoutAttribute,firstItem: AnyObject, constantValue value: CGFloat) {
    
        for constraint: NSLayoutConstraint in (superview?.constraints)! {
        
            if constraint.firstAttribute == attribute && constraint.firstItem.isEqual(firstItem) {
                
                constraint.constant = value
            
            }
          
        }
    
         layoutIfNeeded()
    }

    /**
     upDate SelfAutoLayout
     
     - parameter attribute: attribute description
     - parameter value:     value description
     */
    func updateSelfConstraint(_ attribute: NSLayoutAttribute, constantValue value: CGFloat) {
        
        if !translatesAutoresizingMaskIntoConstraints {
        
        for constraint: NSLayoutConstraint in constraints {
            
            if constraint.firstAttribute == attribute {
                
                constraint.constant = value
                
            }
            
        }
            layoutIfNeeded()
        }
        
    }
    
}
