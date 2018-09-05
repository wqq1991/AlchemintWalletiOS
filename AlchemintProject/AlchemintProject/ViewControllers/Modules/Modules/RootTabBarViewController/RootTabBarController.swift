//
//  RootTabBarViewController.swift
//  HelloSwift
//
//  Created by Joe on 16/2/29.
//  Copyright © 2016年 Joe. All rights reserved.
//

//        #if FREE_VERSION
//            // 弹出购买提示，导航至商店等
//        #else
//            // 实际功能
//        #endif

import UIKit

class RootTabBarController : UITabBarController {
    
 /// items 对应属性配置
    
    let itemNomalImages:[String] = ["home","product","my","more"]
    
    let itemTitles:[String] = ["首页推荐", "产品列表", "我的账户", "更多信息"]
    let normalTitleColor = UIColor.gray
    let selectedTitleColor = UIColor.white
    let titleFont = UIFont.systemFont(ofSize: 10)
    
    let kSliderViewHeight: CGFloat = 49
    var sliderBgView: UIView?
    
    var currentIndex = 0
    
   override func viewDidLoad() {
    
    self.tabBar.tintColor = selectedTitleColor
    
    /**
    初始化所有的通知
    */
    setupNotifications()
    
    /**
    * 加载视图控制器
    */
        setupViewControllers()
    
    /**
    *设置items 的属性.
    */
        setupItems()
    
    /**
    添加滑块
    */
        addSliderView()
    
    }
    
    /**
     初始化所有的通知
     */
    func setupNotifications() {
    
//        NotificationCenter.default.addObserver(self, selector: #selector(RootTabBarController.loginAction(_:)), name:NSNotification.Name(rawValue: kLoginViewViewNotification) , object: nil)
    
    }
    
    /**
     * 加载视图控制器
     */
    func  setupViewControllers() {
     
        let homeMeModuleNav : UIViewController? = UIStoryboard(name: "HomePageModule", bundle: nil).instantiateViewController(withIdentifier: "HomePageModuleNav")
        
        let productModuleNav : UIViewController? = UIStoryboard(name: "ProductModule", bundle: nil).instantiateViewController(withIdentifier: "ProductModuleNav")

        let myWealthModuleNav : UIViewController? = UIStoryboard(name: "MyWealthModule", bundle: nil).instantiateViewController(withIdentifier: "MyWealthModuleNav")

        let moreModuleNav : UIViewController? = UIStoryboard(name: "MoreModule", bundle: nil).instantiateViewController(withIdentifier: "MoreModuleNav")
        
        self .setViewControllers([homeMeModuleNav!,productModuleNav!,myWealthModuleNav!,moreModuleNav!], animated: true)
 
    }
    
    /**
     *设置items 的属性.
     */
    func setupItems() {
      
        let items = self.tabBar.items
        
        var index = 0
        
        /**
        *  循环设置item 属性
        */
        for item in items! as [UITabBarItem] {
         
            item.title = itemTitles[index]
            
            /**
            *  更改item Normal 时的颜色
            *
            *  @param UIColor.grayColor UIColor.grayColor description
            *
            *  @return return value description
            */  item.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:normalTitleColor,NSAttributedStringKey.font:titleFont], for: .normal)
            
            /**
            *  更改item Selected 时的颜色
            *
            *  @param UIColor.redColor UIColor.redColor description
            *
            *  @return return value description
            */   item.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:selectedTitleColor,NSAttributedStringKey.font:titleFont], for: .selected)
            
            /**
            *  设置item Normal 时的背景图片
            *
            *  @param itemNomalImages itemNomalImages description
            *
            *  @return return value description
            */
            let imageName = itemNomalImages[index]
            
            let itemImage:UIImage = UIImage.init(named: imageName)!
            
            item.image = itemImage
            
            item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
                
            index += 1
        }
    }
    
    func addSliderView() {
     
        let count  = self.tabBar.items?.count ?? 0
        var tabBarSize = self.tabBar.frame.size
        tabBarSize.height = kSliderViewHeight
        
        let sliderViewWidth = self.tabBar.frame.size.width / CGFloat(count)
        let sliderView = UIImageView(frame: CGRect(x: 0, y: self.tabBar.frame.size.height - kSliderViewHeight, width: sliderViewWidth, height: tabBarSize.height))
    
        sliderView.backgroundColor = kTabThemeColor3
        self.tabBar .insertSubview(sliderView, at: 0)
        
        sliderBgView = sliderView
        
        var tabBarFrame = self.tabBar.frame
        tabBarFrame.size.height = kSliderViewHeight
        tabBarFrame.origin.y = self.tabBar.frame.size.height - kSliderViewHeight
        
        let bgImageView = UIImageView(frame: tabBarFrame)
        
        self.tabBar .insertSubview(bgImageView, belowSubview: sliderView)
    }
    
    /**
     滑块动画处理方法
     
     - parameter currentIndex:  currentIndex description
     - parameter selectedIndex: selectedIndex description
     */
    func sliderViewAnimation(_ currentIndex :Int ,selectedIndex :Int) {
     
        if(currentIndex != selectedIndex && sliderBgView != nil) {
        
            var rect = sliderBgView?.frame
            
            rect?.size.height = kSliderViewHeight
        
            UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
                
                let colors = [UIColor.colorFromeRGB(0xf25f5c),UIColor.colorFromeRGB(0xffe066),UIColor.colorFromeRGB(0x247ba0),UIColor.colorFromeRGB(0x70c1b3)]
                
                self.sliderBgView!.frame = CGRect(x: rect!.size.width * CGFloat(selectedIndex), y: self.tabBar.frame.origin.x, width: rect!.size.width, height: rect!.size.height)
                self.sliderBgView?.backgroundColor = colors[selectedIndex]
                
                }, completion: nil)
            
        }
        
    }
    
    /// ITEM 切换的时候调用的代理方法
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        var tempIndex = 0
        
        let items = self.tabBar.items
        
        for tempItem in items! {
        
            if(item == tempItem) {
             
                self.selectedIndex = tempIndex
                
                self.currentIndex = tempIndex
            }
            
            tempIndex += 1
        }
    }
    
    
    /// 重载父类Set 方法
    override var selectedIndex: Int {
    
        didSet {
            super.selectedIndex = selectedIndex
            
            sliderViewAnimation(self.currentIndex, selectedIndex: selectedIndex)
        
            self.currentIndex = selectedIndex
        }
    }
    
   
    /**
     带回调的弹出方法
     
     - parameter flag:     是否需要动画
     - parameter loginType:    登录还是注册回调.
     - parameter finished: 动画是否完成标记
     */
    func showLoginModule(animated flag: Bool, completion block: ((_ loginType: LoginType , _ finished: Bool) -> Void)?) {
      
//        let LoginViewModuleNav: JWCustomNavigationController = UIStoryboard(name: "LoginModule", bundle: nil).instantiateViewController(withIdentifier: "LoginModule") as! JWCustomNavigationController
        
        /**
        *  登录完成/取消登录 回调.
        */
//        LoginViewModuleNav.dismissActionBlock { ( type, isFinish) -> Void in
//
//            block!(type , isFinish)
//        }
//
//        present(LoginViewModuleNav, animated: true, completion: nil)
        
    }
    
    /**
     不带回调的弹出方法
     
     - parameter notification: notification description
     */
    func loginAction(_ notification: Notification) {
    
//        let LoginViewModuleNav: JWCustomNavigationController = UIStoryboard(name: "LoginModule", bundle: nil).instantiateViewController(withIdentifier: "LoginModule") as! JWCustomNavigationController
//
//        present(LoginViewModuleNav, animated: true, completion: nil)
        
    }
    
}
