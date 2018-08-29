//
//  RegisterViewController.swift
//  HelloSwift
//
//  Created by Joe on 16/3/7.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit

class RegisterViewController: JWBaseViewController,UITextFieldDelegate {
    
    @IBOutlet weak var logoImageView: JWImageView!
    @IBOutlet weak var registerView: UIView!
    
    @IBOutlet weak var usernameTf: AccountTextField!
    @IBOutlet weak var passwordTf: AccountTextField!
    @IBOutlet weak var rePasswordTf: AccountTextField!
    
    @IBAction func registerBtnAction(_ sender: JWButton) {
        
//        let loginMember = UserModel()
//        loginMember.userAccount = "我哦哦"
//        loginMember.userId = usernameTf.text! as String
//        loginMember.password = "lalala"
//        
//        MemberDataManager.getSharedManager().loginData = loginMember
//        
//        MemberDataManager.getSharedManager().saveLoginMemberData()
        
        mDismissViewController(logintype: LoginType.registered)
    }
    
    override func viewDidLoad() {
        
        navigationItem.title = "注册"
        setLeftNaviItemWithTitle("", imageName: kBackBtnImageName)
        
    }
    
   
    func mDismissViewController(logintype type: LoginType) {
        /*
        let customViewController = navigationController as! JWCustomNavigationController
        
        dismiss(animated: true) { () -> Void in
            
            if customViewController.dismissBlock != nil {
                customViewController.dismissBlock!(loginType: type, finished: true)
            }
        }
        
        if customViewController.dismissBlock != nil {
            customViewController.dismissBlock!(loginType: type, finished: false)
        }
        */
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
      
        UIView.animate(withDuration: kAnimationTimeInterval, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
            
            var frame = self.logoImageView.frame
            frame.size.height = 80
            self.logoImageView.frame = frame
            
            var rect = self.registerView.frame
            rect.origin.y = 190
            self.registerView.frame = rect
            
            }, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: kAnimationTimeInterval, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
            
            var frame = self.logoImageView.frame
            frame.size.height = 132
            self.logoImageView.frame = frame
            
            var rect = self.registerView.frame
            rect.origin.y = 250
            self.registerView.frame = rect
            
            }, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.isEqual(passwordTf) {
        
            rePasswordTf.becomeFirstResponder()
        }
        
        if textField.isEqual(rePasswordTf) {
            
            let button = JWButton()
            
            registerBtnAction(button)
            
            rePasswordTf.resignFirstResponder()
        }
        
        return true
    }
}
