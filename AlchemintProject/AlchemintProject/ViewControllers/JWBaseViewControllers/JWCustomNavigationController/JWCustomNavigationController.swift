//
//  CustomNavigationController.swift
//  AlchemintProject
//
//  Created by BABAIHOLDINGS on 2018/8/30.
//  Copyright © 2018年 com.alchemintTeam.wuqiaoqiao. All rights reserved.
//

import Foundation
import UIKit

class JWCustomNavigationController: UINavigationController,UIGestureRecognizerDelegate,UINavigationControllerDelegate  {
    
    enum LoginType: Int {
        
        case canceled
        case logined
        case registered
    }
    
    typealias DismissBlock = (_ loginType: LoginType, _ finished: Bool) -> ()
    
    //var dismissAction : DismissBlock
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)!
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if  self.responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) {
            
            self.interactivePopGestureRecognizer?.isEnabled = false
            
            super.pushViewController(viewController, animated: animated)
        }
        
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        if navigationController.viewControllers.count == 1 {
            
            navigationController.interactivePopGestureRecognizer?.isEnabled = false
        }else
        {
            navigationController.interactivePopGestureRecognizer?.isEnabled = true
        }
    }
 
}
