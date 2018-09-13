/********************************************************************
 文件名称 :  Errand.m 文件
 作   者 : WuQiaoqiao
 创建时间 :15/4/29.
 文件描述 : 类
 ********************************************************************/

#import "Errand.h"
#import "RequestEngine.h"

@implementation Errand

+ (void)errand:(TaskSack *)taskSack {
  
    if (taskSack.requestUtil.requestType == REQUEST_HTTP_GET)
    {
        RequestEngine *requestEngine = [RequestEngine sharedInstance];
        [requestEngine GetMethodToServiceOfService:taskSack];
    }
    else if (taskSack.requestUtil.requestType == REQUEST_HTTP_POST)
    {
        RequestEngine *requestEngine = [RequestEngine sharedInstance];
        [requestEngine PostMethodToServiceOfService:taskSack];
    }
    else if (taskSack.requestUtil.requestType == REQUEST_RESTFUL_POST)
    {
        RequestEngine *requestEngine = [RequestEngine sharedInstance];
        [requestEngine PostRestfulMethodToServiceOfService:taskSack];
    }

}
+ (void)cancelErrand:(TaskSack *)taskSack {

    RequestEngine *requestEngine = [RequestEngine sharedInstance];
    [requestEngine cancelOperation:taskSack.operation];
}
+ (void)cancelAllErrands {
    RequestEngine *requestEngine = [RequestEngine sharedInstance];
    [requestEngine cancelAllOperations];
}
@end
