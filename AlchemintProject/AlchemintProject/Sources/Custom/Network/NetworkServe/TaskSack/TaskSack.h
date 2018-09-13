/********************************************************************
 文件名称 :  TaskSack.h 文件
 作   者 : WuQiaoqiao
 创建时间 :15/4/28.
 文件描述 : 类
********************************************************************/

#import <Foundation/Foundation.h>
#import "RequestResultBlock.h"
#import "RequestUtil.h"
#import "ResponseUtil.h"
#import "ErrandCommon.h"

@interface TaskSack : NSObject

@property (nonatomic, strong) ResultBlock resultBlock;
@property (nonatomic, strong) RequestUtil *requestUtil;
@property (nonatomic, strong) ResponseUtil *responseUtil;
@property (nonatomic, strong) RequestResultBlock *requestResultBlock;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, assign) Boolean cancelTask;
@property (nonatomic, strong) NSOperation *operation;

+ (TaskSack *)taskOfIpUrl:(NSString *)ipUrl
                  IpParam:(NSString *)ipParam
              ResultBlock:(ResultBlock )resultBlock
             SuccessBlock:(FinishBlock )successBlock
                FailBlock:(FailBlock )failBlock
               Identifier:(NSString *)identifier
              RequestType:(REQUEST_TYPE )requestType;

@end
