/********************************************************************
 文件名称 : ModelDictUtil.h 文件
 作   者 : neo
 创建时间 : 2015-5-11
 文件描述 : 模型表单转换处理类
 *********************************************************************/

#import "ModelDictUtil.h"
#import <objc/runtime.h>

@implementation ModelDictUtil


#pragma mark ---------------------退出清空--------------------
#pragma mark ---------------------初始化----------------------
#pragma mark ---------------------System---------------------
#pragma mark ---------------------功能函数--------------------
#pragma mark ---------------------手势事件--------------------
#pragma mark ---------------------按钮事件--------------------
#pragma mark ---------------------代理方法--------------------
#pragma mark ---------------------属性相关--------------------
#pragma mark ---------------------接口API--------------------
+ (ResultBaseModel *)convertDictonaryToModel:(NSDictionary *)dict
{
    ResultBaseModel *model = [[ResultBaseModel alloc] init];
    
    for(NSString *key in [dict allKeys])
    {
        @try {
            [model setValue:[dict objectForKey:key] forKey:key];
        }
        @catch (NSException *exception) {
            NSLog(@"试图添加不存在的key: %@到ResultFatherModel实例中.",key);
        }
    }
    
    return model;
}

@end
