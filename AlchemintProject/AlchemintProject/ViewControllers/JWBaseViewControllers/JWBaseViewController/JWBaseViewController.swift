//
//  JWBaseViewController.swift
//  HelloSwift
//
//  Created by WuQiaoqiao on 16/2/29.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit

let kNavItemFontSize: CGFloat = 15.0
let kNavItemFontColor: UIColor = kNavThemeColor2

class JWBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        
        edgesForExtendedLayout = UIRectEdge() 
    }
    
    /**
     离开当前页面自动收起键盘
     
     - parameter animated: animated description
     */
    override func viewWillDisappear(_ animated: Bool) {
        
        view.endEditing(true)
    }
    
    /**
     点击空白处完成编辑.
     
     - parameter touches: touches description
     - parameter event:   event description
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    
    func setNavigationBarBackgroundImage(_ backgroundImage: UIImage) {
        
        self.navigationController?.navigationBar.setBackgroundImage(backgroundImage, for: UIBarMetrics.default)
    }
    
   @objc func leftItemTapped() {
        
        popViewControllerAnimated(true)
        
    }
    
    
    @objc func rightItemTapped() {
        
        
        
    }
    
    /**
     *  @author qiaoqiao.wu
     *
     *  修改leftItem字体大小和颜色
     */
    func setLeftNaviItemWithTitle(_ title:String , imageName:String) {
        
        if(!title.isEmpty) {
            
            let leftItem = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(leftItemTapped))
            
            self.navigationItem.leftBarButtonItem = leftItem
            
            let textAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: kNavItemFontSize),NSAttributedStringKey.foregroundColor:kNavItemFontColor]
            
            leftItem.setTitleTextAttributes(textAttributes, for: UIControlState())
            leftItem.setTitleTextAttributes(textAttributes, for: UIControlState.highlighted)
            
            return
            
        }else if(!imageName.isEmpty) {
            
            let leftImage = UIImage(named: imageName)
            
            let leftButton = UIButton(type: UIButtonType.custom)
            
            leftButton.setImage(leftImage, for: UIControlState())
            leftButton.frame = CGRect(x: 0, y: 0, width: leftImage!.size.width, height: leftImage!.size.height)
            
            leftButton.addTarget(self, action: #selector(leftItemTapped), for: UIControlEvents.touchUpInside)
            
            let leftItem = UIBarButtonItem(customView: leftButton)
            
            self.navigationItem.leftBarButtonItem = leftItem
        }
    }
    /**
     *  设置右边按钮；title和图片目前只能二选一，title优先级高于图片
     *
     *  @param title     title description
     *  @param imageName imageName description
     */
    func setRightNaviItemWithTitle(_ title:String , imageName:String) {
        
        if(!title.isEmpty) {
            
            let rightItem = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.plain, target: self, action: #selector(rightItemTapped))
            
            self.navigationItem.rightBarButtonItem = rightItem
            
            let textAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: kNavItemFontSize),NSAttributedStringKey.foregroundColor:kNavItemFontColor]
            
            rightItem.setTitleTextAttributes(textAttributes, for: UIControlState())
            rightItem.setTitleTextAttributes(textAttributes, for: .highlighted)
            
            return
            
        }else if(!imageName.isEmpty) {
            
            let rightImage = UIImage(named: imageName)
            
            let rightButton = UIButton(type: UIButtonType.custom)
            
            rightButton.setImage(rightImage, for: UIControlState())
            rightButton.frame = CGRect(x: 0, y: 0, width: rightImage!.size.width, height: rightImage!.size.height)
            
            rightButton.addTarget(self, action: #selector(rightItemTapped), for: .touchUpInside)
            
            let rightItem = UIBarButtonItem(customView: rightButton)
            
            self.navigationItem.rightBarButtonItem = rightItem
        }
    }
    
    /**
     *  @author qiaoqiao.wu
     *
     *  自定义左边的按钮
     *
     *  @param leftButton leftButton description
     */
    func setLeftNaviItemWithButton(_ leftButton: UIButton) {
        
        leftButton.addTarget(self, action: #selector(leftItemTapped), for: .touchUpInside)
        
        let leftItem = UIBarButtonItem(customView: leftButton)
        
        self.navigationItem.leftBarButtonItem = leftItem;
    }
    
    /**
     *  @author qiaoqiao.wu
     *
     *  自定义右边的按钮
     *
     *  @param rightButton rightButton description
     */
    func setRightNaviItemWithButton(_ rightButton: UIButton) {
        
        rightButton.addTarget(self, action: #selector(JWBaseViewController.rightItemTapped), for:UIControlEvents.touchUpInside)
        
        let rightItem = UIBarButtonItem(customView: rightButton)
        
        self.navigationItem.rightBarButtonItem = rightItem
        
    }
    
    
    /**
     *  自定义Push 方法
     *
     *  @param viewController viewController description
     *  @param animated       animated description
     */
    
    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    
    /**
     *  自定义Pop 方法
     *
     *  @param animated animated description
     */
    func popViewControllerAnimated(_ animated: Bool) {
        
        self.navigationController?.popViewController(animated: animated)
    }
    
}
