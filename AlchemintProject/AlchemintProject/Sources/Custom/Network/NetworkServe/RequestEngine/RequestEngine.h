/********************************************************************
 文件名称 :  requestEngine.h 文件
 作   者 : WuQiaoqiao
 创建时间 :15/4/29.
 文件描述 : 类
********************************************************************/

#import <Foundation/Foundation.h>

@class ResponseUtil,RequestUtil,TaskSack;

@interface RequestEngine : NSObject

+ (id)sharedInstance;
- (void)cancelAllOperations;
- (void)cancelOperation:(NSOperation *)operation;
- (void)GetMethodToServiceOfService:(TaskSack *)taskSack;
- (void)PostMethodToServiceOfService:(TaskSack *)taskSack;
- (void)PostRestfulMethodToServiceOfService:(TaskSack *)taskSack;
@end
