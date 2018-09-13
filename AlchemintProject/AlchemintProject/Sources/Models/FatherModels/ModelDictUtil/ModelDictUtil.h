/********************************************************************
 文件名称 : ModelDictUtil.h 文件
 作   者 : neo
 创建时间 : 2015-5-11
 文件描述 : 表单对模型转换处理类
 *********************************************************************/

#import <Foundation/Foundation.h>
#import "ResultBaseModel.h"
#import "RequestBaseModel.h"

@interface ModelDictUtil : NSObject

#pragma mark ---------------------退出清空--------------------
#pragma mark ---------------------初始化----------------------
#pragma mark ---------------------System---------------------
#pragma mark ---------------------功能函数--------------------
#pragma mark ---------------------手势事件--------------------
#pragma mark ---------------------按钮事件--------------------
#pragma mark ---------------------代理方法--------------------
#pragma mark ---------------------属性相关--------------------
#pragma mark ---------------------接口API--------------------
/*
 代入字段返回模型
 */
+ (ResultBaseModel *)convertDictonaryToModel:(NSDictionary *)dict;


@end
