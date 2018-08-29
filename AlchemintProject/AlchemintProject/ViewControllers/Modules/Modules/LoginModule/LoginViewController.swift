//
//  LoginViewController.swift
//  HelloSwift
//
//  Created by Joe on 16/3/1.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit
import LocalAuthentication

enum LoginType: Int {
    
    case canceled
    case logined
    case registered
}

class LoginViewController: JWBaseViewController,UITextFieldDelegate {
    
    @IBOutlet weak var logoImageView: JWImageView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var usernameTf: AccountTextField!
    @IBOutlet weak var passwordTf: AccountTextField!
    
    @IBAction func loginBtnAction(_ sender: JWButton) {
        
       mDismissViewController(logintype: LoginType.logined)
        

    }
    
    /**
     业务完成封装.
     
     - parameter type: type description
     */
    func mDismissViewController(logintype type: LoginType) {
    
//        let customViewController = navigationController as! JWCustomNavigationController
//
//        dismiss(animated: true) { () -> Void in
//
//            if customViewController.dismissBlock != nil {
//            customViewController.dismissBlock!(loginType: type, finished: true)
//            }
//        }
//
//        if customViewController.dismissBlock != nil {
//            customViewController.dismissBlock!(loginType: type, finished: false)
//        }
    
    }
    
    override func viewDidLoad() {
        
        navigationItem.title = "登录"
     
        setLeftNaviItemWithTitle("", imageName: kBackBtnImageName)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(UIColor.clear), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        
    }
    
    override func leftItemTapped() {
     
        mDismissViewController(logintype: LoginType.canceled)
     
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: kAnimationTimeInterval, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
            
            var frame = self.logoImageView.frame
            frame.size.height = 80
            self.logoImageView.frame = frame
            
            var rect = self.loginView.frame
            rect.origin.y = 190
            self.loginView.frame = rect
            
            }, completion: nil)
     
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        
        UIView.animate(withDuration: kAnimationTimeInterval, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
            
            var frame = self.logoImageView.frame
            frame.size.height = 132
            self.logoImageView.frame = frame
            
            var rect = self.loginView.frame
            rect.origin.y = 250
            self.loginView.frame = rect
            
        }, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField .isEqual(usernameTf) {
        
            passwordTf.becomeFirstResponder()
        }
        
        if textField.isEqual(passwordTf) {
        
            passwordTf.resignFirstResponder()
        }
        
        return true
    }
    
    
}
