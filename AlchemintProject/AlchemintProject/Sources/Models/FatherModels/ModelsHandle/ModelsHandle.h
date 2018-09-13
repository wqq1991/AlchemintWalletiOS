/********************************************************************
 文件名称 : ModelsHandle.h 文件
 作   者 : WuQiaoqiao
 创建时间 : 15/5/21
 文件描述 : 类
 *********************************************************************/

#import <Foundation/Foundation.h>

@interface ModelsHandle : NSObject

+ (NSDictionary *)convertChildModelToDictionary:(id )mClass;
+ (NSDictionary *)convertFatherModelToDictionary:(id )mClass;
@end
