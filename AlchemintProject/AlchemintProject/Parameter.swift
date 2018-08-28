//
//  Parameter.swift
//  AlchemintProject
//
//  Created by BABAIHOLDINGS on 2018/8/28.
//  Copyright © 2018年 com.alchemintTeam.wuqiaoqiao. All rights reserved.
//

import Foundation
import UIKit

/**
 *全局常量配置
 *
 *通知名称
 */
let kLoginViewViewNotification = "kLoginViewViewNotificationKey"



/**
 *全局常量配置
 *
 *文件名称
 */

/**
 * 返回按钮图片名称
 */
let kBackBtnImageName = "backImage"

let kAnimationTimeInterval = 0.35

let kNavThemeColor = UIColor.colorFromeRGB(0x1BBEF1)
let kNavThemeColor2 = UIColor.colorFromeRGB(0xFFFFFF)

let kTabThemeColor3 = UIColor.colorFromeRGB(0xC973E4)

let kThemeColor = UIColor.colorFromeRGB(0x1BBEF1)
let kThemeColor2 = UIColor.colorFromeRGB(0x57585A)
let kThemeColor3 = UIColor.colorFromeRGB(0x9c9c9c)

//----------------------系统---------------------------

let kVersion = (Bundle.main.infoDictionary)!["CFBundleShortVersionString"] as! String

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

//----------------------一些封装方法---------------------------

/**
 debugPrint
 
 :param: message printMessage
 :param: file    printFile
 :param: method  printMethod
 :param: line    printLine
 */
func DLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) {
    
    #if DEBUG
    print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}
