//
//  ErrandCommon.swift
//  AlchemintProject
//
//  Created by WuQiaoqiao on 2018/9/12.
//  Copyright © 2018年 com.alchemintTeam.wuqiaoqiao. All rights reserved.
//

import Foundation

/// 超时时间
let ERRAND_TIMEOUT_INTERVAL = 15

/// 最大并发数
let ERRAND_MAX_OPERATION_COUNT = 4

/**
 *  请求服务状态
 */
enum REQUEST_TYPE: Int {
     case REQUEST_HTTP_GET        = 0//HTTP的get请求
     case REQUEST_HTTP_POST       = 1//HTTP的get请求,
     case REQUEST_RESTFUL_POST    = 2//Restful的post请求,
}

/**
 服务执行结果: 0 等待 1 成功 2 失败 3 取消
 */
enum RESPONSE_STATE: Int{
   case RESPONSE_STATE_WAITEXE      = 0//等待执行
   case RESPONSE_STATE_SUCCESS      = 1//成功
   case RESPONSE_STATE_FAIL         = 2//失败
   case RESPONSE_STATE_CANCEL       = 3//取消
}

/**
 *  获取服务错误类型
 */
enum __ENUM_COMM_ERRAND_ERROR_STYPE: Int{
  case ERRAND_ERROR_DATA_VERIFY_FAIL = -10000//数据校验失败
}

