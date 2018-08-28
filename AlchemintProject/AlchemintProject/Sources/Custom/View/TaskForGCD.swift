//
//  TaskForGCD.swift
//  HelloSwift
//
//  Created by Joe on 16/3/16.
//  Copyright © 2016年 Joe. All rights reserved.
//

import Foundation

typealias Task = (_ cancel : Bool) -> Void

/**
 GCD 延时
 
 :param: timeInterval 延时时长
 :param: task         延时执行的代码块
 
 :returns: Task
 */
func dispatch_after_delay(_ timeInterval : TimeInterval, task:@escaping () -> ()) -> Task? {

    
    func dispatch_later(_ block:@escaping () -> ()) {
    
        let time = DispatchTime.now() + timeInterval;
        
        DispatchQueue.main.asyncAfter(deadline: time, execute: block)
    
    }

    var closure: (()->Void)? = task

    var result: Task?
    
    let delayedClosure: Task = {
    
        cancel in
        
        if let internalClosure = closure {
        
            if(cancel == false) {
            
              DispatchQueue.main.async(execute: internalClosure);
            }
        }
        
        closure = nil
        result = nil
    
    }
    
    result = delayedClosure

    dispatch_later {
        
        if let delayedClosure = result {
        
            delayedClosure(false)
        }
        
    }
    
    return result;
}


func cancel(_ task : Task?) {

    task?(true)
}

 
