/********************************************************************
 文件名称 : RequestUtil.h 文件
 作   者 : WuQiaoqiao
 创建时间 : 15/4/14
 文件描述 : 类
 *********************************************************************/

#import <Foundation/Foundation.h>
#import "ErrandCommon.h"

@interface RequestUtil : NSObject

@property (nonatomic, strong) NSString *ipUrl;
@property (nonatomic, strong) NSString *parameters;
@property (nonatomic, strong) NSDictionary *paramenterDic;
@property (nonatomic, strong) NSString *identifer;
@property (nonatomic, assign) REQUEST_TYPE requestType;
@property (nonatomic, strong) id info;

@end
