/********************************************************************
 文件名称 :  requestEngine.m 文件
 作   者 : WuQiaoqiao
 创建时间 :15/4/29.
 文件描述 : 类
 ********************************************************************/

#import "RequestEngine.h"
#import "Parameter.h"
#import "TaskSack.h"
#import "ResponseUtil.h"
#import "RequestUtil.h"
#import "RequestResultBlock.h"

#import "HttpResult.h"

#import "AFHTTPRequestOperationManager.h"

#import "AFNetworking.h"

#import "NetworkRequest.h"

//#import "NSString+MD5.h"
//#import "GTMBase64.h"

@interface RequestEngine ()
{
    AFHTTPRequestOperationManager *manager;
    
    AFHTTPRequestOperationManager *managerRestful;
}
@end

@implementation RequestEngine

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer.timeoutInterval = ERRAND_TIMEOUT_INTERVAL;
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];//设置返回数据为NSData
        manager.operationQueue.maxConcurrentOperationCount = ERRAND_MAX_OPERATION_COUNT;//最大并发数
        
        managerRestful = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:nil];
        managerRestful.requestSerializer.timeoutInterval = ERRAND_TIMEOUT_INTERVAL;//设置超时
        managerRestful.operationQueue.maxConcurrentOperationCount = ERRAND_MAX_OPERATION_COUNT;//最大并发数
        //申明返回的结果是json类型
        managerRestful.responseSerializer = [AFJSONResponseSerializer serializer];
        //申明请求的数据是json类型
    }
    return self;
}

+ (id)sharedInstance {

    static RequestEngine *sharedInstance = nil;

    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (NSArray *)operationsArray
{
    return manager.operationQueue.operations;
}

- (void)cancelOperation:(NSOperation *)operation
{
    //判断线程是否在线程数组中，存在才取消，有可能传过来的operation异常
    NSArray *operationsArray = manager.operationQueue.operations;
    
    if ([operationsArray indexOfObject:operation] != NSNotFound)
    {
        [operation cancel];
    }
}

- (void)cancelAllOperations
{
    NSOperationQueue *operationQueue = manager.operationQueue;
    [operationQueue cancelAllOperations];
}

#pragma mark ---------------------发送任务--------------------

- (void)GetMethodToServiceOfService:(TaskSack *)taskSack
{
    /*
     要使用常规的AFN网络访问
     
     1. AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
     
     所有的网络请求,均有manager发起
     
     2. 需要注意的是,默认提交请求的数据是二进制的,返回格式是JSON
     
     1> 如果提交数据是JSON的,需要将请求格式设置为AFJSONRequestSerializer
     2> 如果返回格式不是JSON的,
     
     3. 请求格式
     
     AFHTTPRequestSerializer            二进制格式
     AFJSONRequestSerializer            JSON
     AFPropertyListRequestSerializer    PList(是一种特殊的XML,解析起来相对容易)
     
     4. 返回格式
     
     AFHTTPResponseSerializer           二进制格式
     AFJSONResponseSerializer           JSON
     AFXMLParserResponseSerializer      XML,只能返回XMLParser,还需要自己通过代理方法解析
     AFXMLDocumentResponseSerializer (Mac OS X)
     AFPropertyListResponseSerializer   PList
     AFImageResponseSerializer          Image
     AFCompoundResponseSerializer       组合
     */
    
    if (taskSack.cancelTask)
    {
        return;
    }

    //分发给Get请求类型
    
    [self MethodToServiceOfservice:taskSack withRequestType:REQUEST_HTTP_GET];

}

- (void)PostMethodToServiceOfService:(TaskSack *)taskSack
{
    if (taskSack.cancelTask)
    {
        return;
    }
    
    //分发给POST 请求类型。
    [self MethodToServiceOfservice:taskSack withRequestType:REQUEST_HTTP_POST];
}


- (void)MethodToServiceOfservice:(TaskSack *)taskSack withRequestType:(REQUEST_TYPE )requestType {
 
 NSString *url = [[NSString alloc]initWithFormat:@"%@",taskSack.requestUtil.ipUrl];
//
 NSString *parameters = taskSack.requestUtil.parameters;
//
//    NSString *dateString = [NSDate nowTimeStamp];
//
//    NSString *ip = [[NSUserDefaults standardUserDefaults] objectForKey:kDeviceTokenKey];
//
//    NSString *params = [NSString stringWithFormat:@"%@%@%@%@",kMd5Key,kVersion,dateString,kPlatform];
//
//    NSData *data = [params dataUsingEncoding:NSUTF8StringEncoding];
//
//    /**
//     *  Base64编码
//     */
//    data = [GTMBase64 encodeData:data];
//
//    NSString *codestr=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//
//    /**
//     *  MD5校验
//     */
//    NSString *sign = [NSString md5ForLowercaseString:codestr];
    
    NSMutableURLRequest *request = nil;
    
    if (requestType == REQUEST_HTTP_POST) {
        
        request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
        
        NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc]init];
        
        NSArray *array = [parameters componentsSeparatedByString:@"&"];
        
        if (array.count > 0)
        {
            
            for (NSInteger i =0,len=array.count; i<len; i++)
            {
                NSString *str = [array objectAtIndex:i];
                NSRange range = [str rangeOfString:@"="];
                
                if (range.length == 1)
                {
                    NSString *name = [str substringToIndex:range.location];
                    NSString *value = [str substringFromIndex:range.location+1];
                    
                    [mutableDic setValue:value forKey:name];
                }else
                {
                    NSData *data = [parameters dataUsingEncoding:NSUTF8StringEncoding];
                    
                    mutableDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];;
                }
            }
        }
        
        NSError *error = nil;
        NSData *bodyData =  mutableDic.count == 0 ? [NSData data] : [NSJSONSerialization dataWithJSONObject:mutableDic
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        [request setHTTPMethod:@"POST"];
        
        [request setHTTPBody:bodyData];
        
    }else if(requestType == REQUEST_HTTP_GET)
    {
        NSURL *requestUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",url,parameters]];
        request = [NSMutableURLRequest requestWithURL:requestUrl];
    
        [request setHTTPMethod:@"GET"];
    }else
    {
        DLog(@"请求类型未知，连接已断开");
        return;
    }
    
    
    /********************* 给Header添加一些信息 *************************/
    /**
     *  给Header 添加Version
     */
    //[request setValue:kVersion forHTTPHeaderField:@"version"];
    
    /**
     *  给Header 添加sign
     */
    //[request setValue:sign forHTTPHeaderField:@"client-key"];
    
    /**
     *  给Header 添加channel
     */
    //[request setValue:kPlatform forHTTPHeaderField:@"platform"];
    
    /**
     *  给Header 添加timeStamp
     */
    //[request setValue:dateString forHTTPHeaderField:@"time-stamp"];
    
    /**
     *  给Header 添加ip
     */
    //[request setValue:ip forHTTPHeaderField:@"ip"];
    
    /**
     *  给Header 添加Token
     */
    
    //NSString *token = [RFMemberCenterDataManager sharedManager].loginMember.token;
    
//    if ([taskSack.identifier rangeOfString:@"noToken"].location != NSNotFound) {
//
//        token = @"";
//    }else
//    {
//
//    }
    
  //  [request setValue:token forHTTPHeaderField:@"token"];
    
    DLog(@"Header = %@",request.allHTTPHeaderFields);
    
    [request setTimeoutInterval:kTimeoutInterval];
    
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-type"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            HttpResult *httpResult = [[HttpResult alloc] init];
            
            [httpResult resultOfTaskSack:taskSack
                          responseObject:data
                                   error:error];
            
            httpResult = nil;
        });
    }];
    
    [task resume];
}


- (void)PostRestfulMethodToServiceOfService:(TaskSack *)taskSack
{
    if (taskSack.requestUtil.ipUrl) {
        
        [managerRestful POST:taskSack.requestUtil.ipUrl
                  parameters:taskSack.requestUtil.paramenterDic
                     success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSLog(@"JSON: %@", responseObject);
            
            HttpResult *httpResult = [[HttpResult alloc] init];
            
            [httpResult resultOfTaskSack:taskSack responseObject:responseObject error:nil];
            
            httpResult = nil;
            
        }
                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"Error: %@", error);
            
            HttpResult *httpResult = [[HttpResult alloc] init];
            
            [httpResult resultOfTaskSack:taskSack responseObject:nil error:error];
            
            httpResult = nil;
            
        }];
    }
    else{
        NSLog(@"传入参数错误，，，警告，，，，无法请求网络");
    }
    
}


@end
