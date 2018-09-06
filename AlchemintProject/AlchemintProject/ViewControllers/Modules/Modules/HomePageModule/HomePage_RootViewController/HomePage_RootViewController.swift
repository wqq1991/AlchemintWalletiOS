//
//  HomePage_RootViewController.swift
//  HelloSwift
//
//  Created by Joe on 16/2/29.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit
import Foundation
import pop

class HomePage_RootViewController : JWBaseViewController {
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mScrollview: UIScrollView!
    
    var a: CGFloat = 0
    
    override func viewDidLoad() {
        
        self.navigationItem.title = "首页推荐"
        setLeftNaviItemWithTitle("登录", imageName: "")
        setRightNaviItemWithTitle("刷新", imageName: "")
//      let timer =  NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("drawRect"), userInfo: nil, repeats: true)
//        
//        timer.fire()
        
        DLog("测试");
        
//        JWLoadingView.showLoadingView(self.view, forGifWithName: "loading10", timeSlot: 0.05)
        
//        dispatch_after_delay(1.5) {
//            
//            JWLoadingView.hiddenViewInView(self.view)
//        }
        
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
//        mView.layer.masksToBounds = true
//        
//        UIView.animateWithDuration(3.5) { () -> Void in
//            
//            self.mView.layer.cornerRadius = 50
//            
//        } 
        
//        if let animation = POPBasicAnimation(propertyNamed: kPOPLayerCornerRadius) {
//
//            animation.toValue = 5
//            animation.name = "animacijaCircle";
//            animation.delegate = self
//            animation.duration = 1.5
//            mView.layer.pop_add(animation, forKey: "animation")
//        }
        
        
         
//        let anim = POPBasicAnimation(propertyNamed: kPOPViewScaleXY)
//        anim?.toValue = NSValue.init(cgRect: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
//        anim?.toValue = NSValue(cgSize: CGSize(width: 0.8, height: 0.8))
//        anim?.duration = 1.5
//
//        mView.pop_add(anim, forKey: "anim")
    }
    
    
    func drawRect() {
    
        let x = CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.size.width)))
        
        let y = CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.size.height - 128)))
    
        let mView = JWView(frame: CGRect(x: x,y: y,width: 40,height: 40))
        
        mView.backgroundColor = UIColor.red
        mView.overForTime(0)
        
        view.insertSubview(mView, at: 0)
        
    }
    
//    override func leftItemTapped() {
//
//        NotificationCenter.default.post(name: Notification.Name(rawValue: kLoginViewViewNotification), object: nil)
//    }
    
    override func rightItemTapped() {
        
//        JWLoadingView.show(self.view, forGifWithName: "loading10", timeSlot: 0.05)
        
//        dispatch_after_delay(2.5) {
//            
//            JWLoadingView.hiddenView(in: self.view)
//        }
    }
    
}
