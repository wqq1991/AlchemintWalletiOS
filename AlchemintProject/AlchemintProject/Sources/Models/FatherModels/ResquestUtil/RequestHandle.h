//
//  RequestHandle.h
//  NOAHWM
//
//  Created by WuQiaoqiao on 15/1/7.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestHandle : NSObject


/**
 *  @author qiaoqiao.wu, 15-01-07 17:01:41
 *
 *  返回Post 请求的Url
 *
 *  @param url     kServerAddress
 *  @param paramer paramers
 *
 */
+ (NSString *)getUrl:(NSString *)url par:(NSString *)paramer;

/**
 *  @author qiaoqiao.wu, 15-01-07 18:01:52
 *
 *  返回Post 请求的参数
 *
 *  @param url     kServerAddress
 *  @param paramer paramers
 * 
 */

+ (NSString *)getPostParamerOfUrl:(NSString *)url par:(NSString *)paramer;

/**
 *  @author qiaoqiao.wu, 15-05-26 15:05:09
 *
 *  接口请求之前的参数处理
 *
 *  @param model         请求的model
 *  @param parameterCode 请求的接口KeyName
 *
 *  @return 请求接口的参数字符串.
 */
+ (NSString *)parameterFormMode:(id)model withParameterCode:(NSString *)parameterCode;

//接口请求之前的参数处理
+ (NSString *)parameterFormMode:(id)model;

+(NSString *)parameterFormModelOfGet:(id)model;

@end
