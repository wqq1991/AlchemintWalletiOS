//
//  JWNavigationController.swift
//  HelloSwift
//
//  Created by WuQiaoqiao on 16/2/29.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit

class JWCustomNavigationController:UINavigationController,UIGestureRecognizerDelegate,UINavigationControllerDelegate {
    
    enum LoginType: Int {
        
        case canceled
        case logined
        case registered
    }
   
    typealias DismissBlock = (_ loginType: LoginType, _ finished: Bool) -> ()
    
    var dismissAction : DismissBlock
    
//    init() {
//        super.init(nibName: nil, bundle: nil)
//    }
  
    convenience override init(rootViewController: UIViewController) {
     
        //super.init(rootViewController: rootViewController)
    }
    
//    required init?(coder aDecoder: NSCoder) {
//
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        
        interactivePopGestureRecognizer?.delegate = self
        self.delegate = self
        
    }
    
    
    func dismissActionBlock(_ actionBlock: DismissBlock) {
        
//        dismissAction = actionBlock
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
