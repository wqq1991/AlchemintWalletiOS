//
//  ResponseUtil.swift
//  AlchemintProject
//
//  Created by WuQiaoqiao on 2018/9/12.
//  Copyright © 2018年 com.alchemintTeam.wuqiaoqiao. All rights reserved.
//

import Foundation


public class ResponseUtil {
    
    let state:RESPONSE_STATE
    let responseJson:Any
    let responseResult:Any
    let error:Error
    let respDesc:String
    let respCode:String
    
    public init (){
        
        state = .RESPONSE_STATE_WAITEXE
        responseJson = Optional.none!
        responseResult = Optional.none!
        error = Optional.none!
        respCode = ""
        respDesc = ""
    }
    
}
