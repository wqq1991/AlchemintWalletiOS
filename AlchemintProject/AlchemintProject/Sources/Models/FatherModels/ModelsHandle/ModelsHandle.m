/********************************************************************
 文件名称 : ModelsHandle.m 文件
 作   者 : WuQiaoqiao
 创建时间 : 15/5/21
 文件描述 : 类
 *********************************************************************/

#import "ModelsHandle.h"
#import "Parameter.h"
#import <objc/runtime.h>

@implementation ModelsHandle
/**
 *  @author qiaoqiao.wu, 15-05-21 18:05:03
 *
 *  遍历子类的属性
 *
 *  @return 返回子类的所有属性的数组
 */
+ (NSArray*)childPropertyKeys:(Class )mClass

{
    unsigned int outCount, i;
    
    objc_property_t *properties = class_copyPropertyList(mClass, &outCount);
    
    NSMutableArray *keys = [[NSMutableArray alloc] initWithCapacity:outCount];
    
    for (i = 0; i < outCount; i++) {
        
        objc_property_t property = properties[i];
        
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property)
                                                          encoding:NSUTF8StringEncoding];
        
        if (propertyName) {
            
                 [keys addObject:propertyName];
           
        }else
        {
            DLog(@"%@属性为空.",propertyName);
        }
    }
    
    free(properties);
    
    return keys;
    
}

/**
 *  @author qiaoqiao.wu, 15-05-21 18:05:08
 *
 *  遍历父类的所有属性
 *
 *  @return 返回父类的所有属性的数组
 */
+ (NSArray*)fatherPropertyKeys:(Class )mClass

{
    unsigned int outCount, i;

    objc_property_t *properties;
    
    if(![NSStringFromClass(mClass) isEqualToString:@"RequestFatherModel"]) {
        
        properties = class_copyPropertyList([mClass superclass], &outCount);
        
    }else{
        
        properties = class_copyPropertyList([mClass class], &outCount);
    }
    
    NSMutableArray *keys = [[NSMutableArray alloc] initWithCapacity:outCount];
    
    for (i = 0; i < outCount; i++) {
        
        objc_property_t property = properties[i];
        
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property)
                                                          encoding:NSUTF8StringEncoding];
        
        if(propertyName){
           
            [keys addObject:propertyName];
            
    }else
    {
        DLog(@"%@属性为空.",propertyName);
    }
    
    }

    free(properties);
    
    return keys;
    
}

/**
 *  @author qiaoqiao.wu, 15-05-21 18:05:13
 *
 *  子类Model 转换成字典.
 *
 *  @return 子类Model字典
 */
+ (NSDictionary *)convertChildModelToDictionary:(id )mClass
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    for (NSString *key in [ModelsHandle childPropertyKeys:[mClass class]]) {
        
        //该值不为NSNULL，并且也不为nil
        id propertyValue = [mClass valueForKey:key];
        
        if (propertyValue) {
            
            [dic setObject:propertyValue forKey:key];
            
        }else{
            
            DLog(@"%@的值为空",key);
        }
    }
    
    return dic;
}

/**
 *  @author qiaoqiao.wu, 15-05-21 18:05:51
 *
 *  父类Model 转换成字典
 *
 *  @return 父类Model字典
 */
+ (NSDictionary *)convertFatherModelToDictionary:(id )mClass
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    for (NSString *key in [ModelsHandle fatherPropertyKeys:[mClass class]]) {
      
            //该值不为NSNULL，并且也不为nil
        id propertyValue = [mClass valueForKey:key];
     
        if (propertyValue) {
            
            [dic setObject:propertyValue forKey:key];
            
        }else{
            
            DLog(@"父类属性%@的值为空",key);
        }
    }
    
    return dic;
}

@end
