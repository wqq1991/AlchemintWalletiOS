/********************************************************************
 文件名称 :  TaskSack.m 文件
 作   者 : WuQiaoqiao
 创建时间 :15/4/28.
 文件描述 : 类
 ********************************************************************/

#import "TaskSack.h"


@implementation TaskSack

+ (TaskSack *)taskOfIpUrl:(NSString *)ipUrl
            IpParam:(NSString *)ipParam
       ResultBlock:(ResultBlock )resultBlock
       SuccessBlock:(FinishBlock )successBlock
          FailBlock:(FailBlock )failBlock
         Identifier:(NSString *)identifier
        RequestType:(REQUEST_TYPE )requestType {

    RequestResultBlock *requestResultBlock = [[RequestResultBlock alloc] init];
  
    requestResultBlock.resultBlock = resultBlock;
    requestResultBlock.successBlock = successBlock;
    requestResultBlock.failBlock = failBlock;
    
    RequestUtil *requestUtil = [[RequestUtil alloc] init];
    requestUtil.ipUrl = ipUrl;
    requestUtil.identifer = identifier;
    requestUtil.parameters = ipParam;
    requestUtil.requestType = requestType;
    
    TaskSack *task = [[TaskSack alloc] init];
    task.identifier = identifier;
    task.requestUtil = requestUtil;
    task.identifier = identifier;
    task.requestResultBlock = requestResultBlock;
    
    return task;
}

@end
