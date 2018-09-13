/********************************************************************
 文件名称 : AsyncQueue.h 文件
 作   者 : WuQiaoqiao
 创建时间 : 15/3/17
 文件描述 : 类
 *********************************************************************/

#import <Foundation/Foundation.h>
#import "TaskSack.h"

@interface ErrandManager : NSObject
{
    NSMutableArray * requestQueue;
    
    Boolean isMineCancel;
}

+ (instancetype)shareInstance;



- (void)addAsyncToQueue:(TaskSack *)networkRequest;
- (void)finishRequest:(TaskSack *)request;
- (void)cancelRequestOfRequestId:(NSString *)identifer;
- (void)cancelAllRequests;

@property (nonatomic, assign) NSUInteger networkActivityRetainCount;

@end
