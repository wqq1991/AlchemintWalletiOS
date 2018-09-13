/********************************************************************
 文件名称 : ResponseHandle.h 文件
 作   者 : WuQiaoqiao
 创建时间 : 15/3/18
 文件描述 : 类
 *********************************************************************/

#import <Foundation/Foundation.h>
#import "ResponseUtil.h"


@interface ResponseHandle : NSObject

/**
 *去掉被包的JSON字串
 */
+ (id)responseOfData:(NSData *)data;
 
+ (void)responseOfMessage:(ResponseUtil *)response dic:(NSDictionary *)dic;

+ (BOOL)responseOfResult:(NSDictionary *)dic;

+ (NSMutableArray *)arrayWithPropertiesOfdictionary:(NSDictionary *)propertiesOfdictionary listKey:(NSString *)key class:(Class)modelClass;

+ (id)objectWithPropertiesOfdictionary:(NSDictionary *)propertiesOfdictionary
                                 class:(Class)modelClass;
@end
