//
//  Helper.swift
//  AlchemintProject
//
//  Created by WuQiaoqiao on 2018/9/12.
//  Copyright © 2018年 com.alchemintTeam.wuqiaoqiao. All rights reserved.
//

import Foundation

func makeRpcUrl(url: String, method: String, params: RequestBaseModel) -> String {
    
    var _url = url
    
    var string = String()
    
    if (_url.last != "/"){
        
       _url = _url + "/"
    }
    
    let dic:NSDictionary = ModelsHandle.convertChildModel(toDictionary: params)! as NSDictionary
    
    var paramsStr = ""
    
    var index = 0
    
    for value in dic.allValues {
        
        DLog("value = \(value)")
        
        let str = value as! String
        
        var temp = ","
        
        if(index == 0)
        {
            temp = ""
        }
        
        paramsStr = paramsStr + temp + "\"" + str + "\""
        
        index += 1
    }
    
    string.append(url + "?jsonrpc=2.0&id=1&method=" + method + "&params=[" + paramsStr + "]")
    
    string = string.replacingOccurrences(of: "\\", with: "")
    
    return string;
}

func converObjectToJson(model:ReqBaseModel) -> Any {

    let encoder = JSONEncoder()

    let data = try! encoder.encode(model)

    //let dic = String(data: data, encoding: .utf8)

    let dic = try! JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
    
    return dic
}

//func converJsonToObject(jsonString:String) -> ResultBaseModel {
//
//    let jsonData = jsonString.data(using: .utf8)!
//
//    let decoder = JSONDecoder()
//
//    let obj = try! decoder.decode(ResultBaseModel.self, from: jsonData)
//
//    return obj
//}




