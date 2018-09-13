/********************************************************************
 文件名称 : AsyncQueue.m 文件
 作   者 : WuQiaoqiao
 创建时间 : 15/3/17
 文件描述 : 类
 *********************************************************************/

#import "ErrandManager.h"
#import "Errand.h"
#import <UIKit/UIKit.h>
#import "Parameter.h"

@implementation ErrandManager

- (instancetype)init {
    
    self = [super init];
    if (self) {
        requestQueue = [NSMutableArray array];
        _networkActivityRetainCount = 0;
    }
    return self;
}

+ (instancetype)shareInstance {
    static ErrandManager *shareAsyncQueue = nil;
    
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^
    {
        shareAsyncQueue = [[self alloc] init];
    });
   
    return shareAsyncQueue;
}

- (void)addAsyncToQueue:(TaskSack *)taskSack {
    
    isMineCancel = YES;
    
    [self cancelRequestOfRequestId:taskSack.identifier];
    
    isMineCancel = NO;
    
    [requestQueue addObject:taskSack];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    _networkActivityRetainCount++;
    
    DLog(@"_networkActivityRetainCount = %ld",(unsigned long)_networkActivityRetainCount);
    
    [Errand errand:taskSack];
}

-(void)cancelRequestOfRequestId:(NSString *)identifer
{
    NSUInteger count =  requestQueue.count;
    
    for (NSUInteger i = count; i > 0 ; i -- )
    {
        TaskSack *taskSack = [requestQueue objectAtIndex:i -  1];
        
        if (taskSack.identifier == identifer)
        {
            taskSack.cancelTask = YES;
        
        [requestQueue removeObject:taskSack];
            
        [self hiddenNetworkActivity];
            
        }else if(!isMineCancel)
        {
            DBLog(@"取消的请求ID不存在!");
        }
    }
}

- (void)finishRequest:(TaskSack *)request
{
    [requestQueue removeObject:request];
    
    [self hiddenNetworkActivity];
}

-(void)hiddenNetworkActivity
{
    if (_networkActivityRetainCount > 0) {
        
        _networkActivityRetainCount--;
    }
    
    if (_networkActivityRetainCount==0)
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
    
    
    DLog(@"_networkActivityRetainCount = %ld",(unsigned long)_networkActivityRetainCount);
}

- (void)cancelAllRequests {
    
    NSUInteger len = requestQueue.count;
    
    for (NSInteger i = len ; i>0; i--)
    {
        TaskSack *taskSack = [requestQueue objectAtIndex:i-1];
        
        taskSack.cancelTask = YES;
    }
    [requestQueue removeAllObjects];
    
}

@end
