//
//  StartViewController.swift
//  HelloSwift
//
//  Created by Joe on 16/3/10.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit
import Foundation



class StartViewController: JWBaseViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var iconLb: UILabel!
    
    typealias FinishBlock = (_ finish: Bool) -> ()
    
    var finishBlock:FinishBlock?
    
    class func addStartViewToView(_ view: UIView,finishBlock: (_ finish: Bool) -> Void) {
     
        let startVC = StartViewController()
        
        view .addSubview(startVC.view)
        
    }
    
    override func viewDidLoad() {
        
//        ///随机生成 欢迎页图片
        let imageNames = ["IMG_0979.JPG","IMG_0980.JPG","IMG_0958.JPG","IMG_0961.JPG","IMG_0967.JPG","IMG_0968.JPG","IMG_0988.JPG"]
        
        let count = imageNames.count
        
        let imageName = imageNames[Int(arc4random_uniform(UInt32(count)))];
    
        imageView.image = UIImage(named: imageName)
        
        /**
        *  @author qiaoqiao.wu, 16-03-10 20:03:39
        *
        *  开始播放动画之前延时
        */
        dispatch_after_delay(0.5) {
      
                //这里返回主线程，写需要主线程执行的代码

                /**
                *  @author qiaoqiao.wu, 16-03-10 20:03:21
                *
                *  开始播放渐变动画
                */
                UIView.animate(withDuration: 3.0, animations: { () -> Void in
                    
                    self.imageView.alpha = 1.0
                    self.iconLb.alpha = 0.0
                    
                    } , completion: { (isFinish: Bool) -> Void in
                        
                        
                        /**
                        *  @author qiaoqiao.wu, 16-03-10 20:03:02
                        *
                        *  动画播放完成延时
                        */
                        dispatch_after_delay(1) {
                        
                            /**
                            *  @author qiaoqiao.wu, 16-03-10 21:03:01
                            *
                            *  移除欢迎页面动画
                            */
                            UIView.animate(withDuration: 1.2, animations: { () -> Void in
                                
                                var rect = self.view.frame
                                rect.origin.y = -UIScreen.main.bounds.size.height
                                self.view.frame = rect
                                
                                }, completion: { (Bool) -> Void in
                                    
                                    self.view .removeFromSuperview()
                                    
                                    if self.finishBlock != nil {
                                        
                                        self.finishBlock!(isFinish)
                                    }
                            })
                        }
                        
                    })
                }
        
            }
}
