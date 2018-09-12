//
//  Helper.swift
//  AlchemintProject
//
//  Created by WuQiaoqiao on 2018/9/12.
//  Copyright © 2018年 com.alchemintTeam.wuqiaoqiao. All rights reserved.
//

import Foundation

func makeRpcUrl(url: String, method: String, params: Any) -> String {
    
    var _url = url
    
    var string = String()
    
    if (_url.last != "/"){
        
       _url = _url + "/"
    }
    
    string.append(url + "?jsonrpc=2.0&id=1&method=" + method + "&params=[")
//    for(var i = 0; i < params)
    
    
    return "";
}
