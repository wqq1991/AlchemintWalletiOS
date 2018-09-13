//
//  RequestHandle.m
//  NOAHWM
//
//  Created by WuQiaoqiao on 15/1/7.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "RequestHandle.h"
#import "ModelsHandle.h"
#import "Parameter.h"

//#define limitKey @"limit"

static NSString *const limitKey = @"limit";
static NSString *const startKey = @"start";

static NSString *const currentKey = @"current";
static NSString *const sizeKey = @"size";

@implementation RequestHandle

+ (NSString *)getUrl:(NSString *)url par:(NSString *)paramer
{
    NSString *FullUrl = [url stringByAppendingString:paramer];

    NSString *postUrl = [[FullUrl componentsSeparatedByString:@"?"] firstObject];
    
    return postUrl;
}
+ (NSString *)getPostParamerOfUrl:(NSString *)url par:(NSString *)paramer
{
    NSString *FullUrl = [url stringByAppendingString:paramer];
    
    NSString *postUrl = [[FullUrl componentsSeparatedByString:@"?"] lastObject];
    
    return postUrl;
}

+ (NSString *)parameterFormMode:(id)model withParameterCode:(NSString *)parameterCode {

    NSMutableDictionary *dict = [NSMutableDictionary dictionary];;
    
    if (parameterCode && ![parameterCode isEqualToString:@""]) {
         NSDictionary *childDict  = [ModelsHandle convertChildModelToDictionary:model];
        [dict setObject:childDict forKey:parameterCode];
    }
    
    if (model) {
        NSDictionary *fatherDict = [ModelsHandle convertFatherModelToDictionary:model];
        [dict setObject:fatherDict forKey:@"requestTrans"];
    }else
    {
        DLog(@"model = %@",model);
    }
    
    NSData *json = [NSJSONSerialization dataWithJSONObject:dict
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:nil];
    
    NSString *string = [[NSString alloc] initWithData:json
                                             encoding:NSUTF8StringEncoding];
    
    NSString *parameterStr = [NSString stringWithFormat:@"channel=ios&sign=ac1912c9e60a5457faa2f0cf665a5170&data=%@",string];
    
    return parameterStr;
}

+ (NSString *)parameterFormMode  :(id)model {
 
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];;
    
    if (model) {
        
        NSMutableDictionary *childDict  = [[ModelsHandle convertChildModelToDictionary:model] mutableCopy];
        
        
        NSMutableDictionary *fatherDict = [[ModelsHandle convertFatherModelToDictionary:model] mutableCopy];
        
        [dict addEntriesFromDictionary:childDict];
        [dict addEntriesFromDictionary:fatherDict];
        
    }else
    {
        DLog(@"model = %@",model);
    }
    
    NSData *json = [NSJSONSerialization dataWithJSONObject:dict
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:nil];
    
    NSString *string = [[NSString alloc] initWithData:json
                                             encoding:NSUTF8StringEncoding];
    
    NSString *parameterStr = [NSString stringWithFormat:@"%@",string];
    
    return parameterStr;
}

+(NSString *)parameterFormModelOfGet:(id)model {

    NSMutableDictionary *dict = [NSMutableDictionary dictionary];;
    
    if (model) {
        NSDictionary *childDict  = [ModelsHandle convertChildModelToDictionary:model];
        [dict addEntriesFromDictionary:childDict];
        
        NSDictionary *fatherDict = [ModelsHandle convertFatherModelToDictionary:model];
        [dict addEntriesFromDictionary:fatherDict];
    }else
    {
        DLog(@"model = %@",model);
    }
    
    NSData *json = [NSJSONSerialization dataWithJSONObject:dict
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:nil];
    
    NSString *string = [[NSString alloc] initWithData:json
                                             encoding:NSUTF8StringEncoding];
    
    NSString *parameterStr = [NSString stringWithFormat:@"%@",string];
    
    return parameterStr;
}

@end
