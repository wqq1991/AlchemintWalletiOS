//
//  ResponseHandle.swift
//  AlchemintProject
//
//  Created by WuQiaoqiao on 2018/9/12.
//  Copyright © 2018年 com.alchemintTeam.wuqiaoqiao. All rights reserved.
//

import Foundation

func responseOfData(data:Data) -> Any {
 
    do {
        let resultStr = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
        
        return resultStr
        
    } catch {
        
        return error
    }
}

func responseOfMessage(response:ResponseUtil, dic:Dictionary<String, Any>) {
    
}

func responseOfResult(dic:Dictionary<String, Any>) -> Bool {
    
    let result:String = dic["code"] as! String
    
    if result.elementsEqual(kResponseSuccessfulCode){
        
        return true
    }
     return false
}

func arrayWithPropertiesOfdictionary(propertiesOfdictionary:NSDictionary,listKey:String,modelClass:AnyClass) -> NSMutableArray {
    
    if (listKey.isEmpty) {
        
        let result = propertiesOfdictionary.object(forKey: listKey)
        
        if(result == nil){
            
            return NSMutableArray()
        }
    }
    
    let dicKeyCount = propertiesOfdictionary.count
    
    var resultArray = NSMutableArray.init()
    
    if(modelClass != nil && !listKey.isEmpty && dicKeyCount > 0){
        
        let array:NSArray = propertiesOfdictionary.object(forKey: listKey) as! NSArray
        
        let arrayCount = array.count
        
        if(arrayCount > 0){
            
//            for(let i = 0, len = arrayCount; i < len)
            
            
        }
        
        
        
        
    }
    
    return NSMutableArray()
}
