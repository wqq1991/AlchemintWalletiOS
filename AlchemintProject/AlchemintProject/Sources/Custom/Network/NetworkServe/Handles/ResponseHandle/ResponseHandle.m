/********************************************************************
 文件名称 : ResponseHandle.m 文件
 作   者 : WuQiaoqiao
 创建时间 : 15/3/18
 文件描述 : 类
 *********************************************************************/

#import "ResponseHandle.h"
#import "ErrandCommon.h"
#include<objc/runtime.h>
#import "Parameter.h"

@implementation ResponseHandle

//去掉被包的JSON字串
+ (id)responseOfData:(NSData *)data
{

    id resultStr = [NSJSONSerialization JSONObjectWithData:data
                                                   options:NSJSONReadingMutableLeaves
                                                     error:nil];
    
    return resultStr;
}

+ (void)responseOfMessage:(ResponseUtil *)response dic:(NSDictionary *)dic
{
    NSString *title = @"服务器正在维护，请稍后再试。";//[[NSString alloc]initWithFormat:@"%@",[dic objectForKey:@"message"]];
    
    if (![[[dic objectForKey:@"code"] stringValue] isEqualToString:kResponseSuccessfulCode]) {
        
        if ([[dic objectForKey:@"result"] isKindOfClass:[NSString class]]) {
            
            title = [dic objectForKey:@"result"];
        }
        
        if ([[dic objectForKey:@"msg"] isKindOfClass:[NSString class]]) {
            
            title = [dic objectForKey:@"msg"];
        }
        
        if ([[dic objectForKey:@"result"] isKindOfClass:[NSDictionary class]] && [[dic objectForKey:@"result"] objectForKey:@"msg"]) {
            
            title = [[dic objectForKey:@"result"] objectForKey:@"msg"];
        }
        
        if ([title isEqual:[NSNull null]] || [title isKindOfClass:[NSNull class]] || title == nil) {
            
            title = @"系统维护中，请稍后重试。";
        }
    }
    
    //如果这个时候没有错误信息
    NSString *result = [[NSString alloc]initWithFormat:@"%@",[dic objectForKey:@"code"]];
    
    response.respCode = result;
    response.respDesc = title;
    
    if (![result isEqualToString:@"1"])
    {
        //如果返回错误但是没有错误信息，需要加上去
//        if ([NSString emptyOrNull:title]) {
//            title = @"网络不给力，请稍后再试";
//        }
    }
}

+ (BOOL)responseOfResult:(NSDictionary *)dic
{
    NSString *result = [[NSString alloc]initWithFormat:@"%@",[dic objectForKey:@"code"]];
 
    if ([result isEqualToString:kResponseSuccessfulCode])
    {
        return YES;
    }
    
    return NO;
}

+ (NSMutableArray *)arrayWithPropertiesOfdictionary:(NSDictionary *)propertiesOfdictionary
                                            listKey:(NSString *)key
                                              class:(Class)modelClass
{
    if (key && key.length > 0) {
        
    id result = [propertiesOfdictionary objectForKey:key];
    
    //如果待处理对象为空，返回空，不做任何处理。
    if ([result isEqual:[NSNull null]] || [result isKindOfClass:[NSNull class]] || result == nil) {
    
        DLog(@"error%@",propertiesOfdictionary);
        return nil;
    }
        
    }
    
    
    NSUInteger dicKeyCount = propertiesOfdictionary.count;
    
    NSMutableArray *resultArray = [NSMutableArray array];
    
    if (modelClass && key && key.length > 0 && propertiesOfdictionary  && dicKeyCount > 0)
    {
        NSArray *array = [propertiesOfdictionary objectForKey:key];
       
        NSUInteger arrayCount = array.count;
        
        if (array && arrayCount > 0)
        {
            for (NSInteger i = 0 ,len = arrayCount; i< len; i++)
            {
                NSDictionary *dic = [array objectAtIndex:i];
                
                if (dic)
                {
                    id model = [self objectWithPropertiesOfdictionary:dic
                                                                class:modelClass];
                    
                    if (model)
                    {
                        [resultArray addObject:model];
                    }
                }
            }
        }
    }else if(modelClass && key.length == 0 && propertiesOfdictionary && dicKeyCount > 0){
    
        NSArray *array = (NSArray *)propertiesOfdictionary;
        
        NSUInteger arrayCount = array.count;
        
        if (array && arrayCount > 0)
        {
            for (NSInteger i = 0 ,len = arrayCount; i< len; i++)
            {
                NSDictionary *dic = [array objectAtIndex:i];
                
                if (dic)
                {
                    id model = [self objectWithPropertiesOfdictionary:dic
                                                                class:modelClass];
                    
                    if (model)
                    {
                        [resultArray addObject:model];
                    }
                }
            }
        }
        
    }else
    {
        DLog(@"\n\n---------------   条件不成立  ---------------\nModelClass = %@ \n key = %@ \n key.length = %d\npropertiesOfdictionary.count = %d\ndicKeyCount = %d \n",modelClass,key,(int)key.length,(int)[propertiesOfdictionary count],(int)dicKeyCount);
    }
    
    return resultArray;
}

+ (id)objectWithPropertiesOfdictionary:(NSDictionary *)propertiesOfdictionary
                                 class:(Class)modelClass
{
    if ([propertiesOfdictionary isEqual:[NSNull null]] || [propertiesOfdictionary isKindOfClass:[NSNull class]] || propertiesOfdictionary == nil) {
        
        return nil;
    }
    
    NSUInteger dicKeyCount = propertiesOfdictionary.count;
    if (modelClass && propertiesOfdictionary && dicKeyCount > 0)
    {
        unsigned classPropertyCount;
        objc_property_t *properties = class_copyPropertyList(modelClass, &classPropertyCount);
        
        if (classPropertyCount > 0)
        {
            id classObject = [[modelClass alloc]init];
            
            if (classObject)
            {
                for (int i = 0; i < classPropertyCount; i++)
                {
                    objc_property_t property = properties[i];
                    NSString * propertyName = [[NSString alloc]initWithCString:property_getName(property)  encoding:NSUTF8StringEncoding];
                    
                    if (propertyName)
                    {
                        id value = [propertiesOfdictionary objectForKey:propertyName];
                        
                            // 判断是否为空串
                            if ([value isEqual:[NSNull null]] || [value isKindOfClass:[NSNull class]] || value == nil) {
                                
                                value = @"";
                            }
                        
                        //转换类型
                        if ([value isKindOfClass:[NSNumber class]]) {
                            
                            value = [value stringValue];
                        }
                        
                        [classObject setValue:value forKey:propertyName];
                    }
                }
                
                return classObject;
            }
            else
            {
                DBLog(@"%@model不存在",modelClass);
            }
            
        }
        else
        {
            DBLog(@"%@字段不匹配",modelClass);
        }
        
        free(properties);
    }
    
    DBLog(@"获取model失败");
    
    return nil;
}
@end
