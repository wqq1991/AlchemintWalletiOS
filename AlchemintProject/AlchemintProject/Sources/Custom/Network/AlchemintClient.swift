//
//  AlchemintClient.swift
//  AlchemintProject
//
//  Created by BABAIHOLDINGS on 2018/8/28.
//  Copyright © 2018年 com.alchemintTeam.wuqiaoqiao. All rights reserved.
//

import Foundation
import Alamofire

typealias FailBlock = (_ error :Error) ->()
typealias SuccessBlock = (_ success :JSONDictionary) ->()

func asyncGetResquest(api:String, method:String,params:RequestBaseModel,fail:@escaping FailBlock,success:@escaping SuccessBlock)
{
    let url = makeRpcUrl(url: api, method: method, params: params)
    
    Alamofire.request(url).responseJSON {(response) in

        if let error = response.result.error
        {
            fail(error);

        }else if let jsonValue = response.result.value
        {
            success(jsonValue as! JSONDictionary);
        }
    }

}
