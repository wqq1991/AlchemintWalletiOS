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
    @IBAction func mButtonAction(_ sender: UIButton) {
        
        animals()
    }
    
    var a: CGFloat = 0
    
    override func viewDidLoad() {
        
        self.navigationItem.title = "首页推荐"
        setLeftNaviItemWithTitle("登录", imageName: "")
        setRightNaviItemWithTitle("刷新", imageName: "")
//      let timer =  NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("drawRect"), userInfo: nil, repeats: true)
//        
//        timer.fire()
        
        DLog("测试");
        
        JWLoadingView.show(self.view, forGifWithName: "loading10", timeSlot: 0.05)
        
        DLog("等待5秒？")
        _ = dispatch_after_delay(5) {
            
            DLog("时间到了")
            JWLoadingView.hiddenView(in:self.view)
        }
        
//        cancel { (finished) in
//
//            DLog("取消算了")
//            task!(true)
//        }
        
//        NeoTest()
        
        let vc = ViewController()
        vc.jsonToObject()
        vc.objectToJson()
    }
    
    func NeoTest() {
        
        let account = Account(wif: "L1Uxyf13HcniShRuxonMeZ34Es91zu1kTkqBpSFRsTQGcxpaZfDZ")
//        account?.getBalance(completion: { (ass, err) in
//
//            DLog("ass = \(ass),err = \(err)")
//        })

        let assetID = AssetId.gasAssetId
        
        
//        account?.sendAssetTransaction(asset: assetID, amount: 100000000, toAddress: "Aeto8Loxsh7nXWoVS4FzBkUrFuiCB3Qidn", completion: { (suc, err) in
//
//            DLog("suc = \(suc)")
//
//        })
        
        let model:GetUtxoModel = GetUtxoModel()
        model.address = "Aeto8Loxsh7nXWoVS4FzBkUrFuiCB3Qidn";
        
        let json = makeRpcUrl(url: BASE_URL,method: "getutxo",params: model)
        
//        DLog("json = \(json)")
        
        asyncGetResquest(api: BASE_URL, method: "getutxo", params: model, fail: { (error) in
            
            DLog("error = \(error)")
        }) { (dic) in
            
            DLog("dic = \(dic)")
        }
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
        
        
         

    }
    
    
    func drawRect() {
    
        let x = CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.size.width)))
        
        let y = CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.size.height - 128)))
    
        let mView = JWView(frame: CGRect(x: x,y: y,width: 40,height: 40))
        
        mView.backgroundColor = UIColor.red
//        mView.overForTime(0)
        
        view.insertSubview(mView, at: 0)
        
    }
    
//    override func leftItemTapped() {
//
//        NotificationCenter.default.post(name: Notification.Name(rawValue: kLoginViewViewNotification), object: nil)
//    }
    
    override func rightItemTapped() {
        
        //JWLoadingView.show(self.view, forGifWithName: "loading10", timeSlot: 0.05)
        
        NeoTest()
        
        _ = dispatch_after_delay(2.5) {
            
//            JWLoadingView.hiddenView(in: self.view)
        }
    }
    
    func animals() {
        
        let anim = POPBasicAnimation(propertyNamed: kPOPViewScaleXY)
        anim?.toValue = NSValue(cgSize: CGSize(width: 0.99, height: 0.99))
        anim?.toValue = NSValue(cgSize: CGSize(width: 0.8, height: 0.8))
        anim?.duration = 0.35

        mView.pop_add(anim, forKey: "anim")
        
        weak var weakView = mView!
        _ = dispatch_after_delay(0.25, task: {
            
            let anim = POPBasicAnimation(propertyNamed: kPOPViewScaleXY)
            anim?.toValue = NSValue(cgSize: CGSize(width: 0.8, height: 0.8))
            anim?.toValue = NSValue(cgSize: CGSize(width: 0.99, height: 0.99))
            anim?.duration = 0.25
            weakView?.pop_add(anim, forKey: "anim")
        })
        
    }
    
}
