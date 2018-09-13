/********************************************************************
 文件名称 : ErrandCommon.h 文件
 作   者 : WuQiaoqiao
 创建时间 : 15/4/7
 文件描述 : 服务请求公共类
 *********************************************************************/


#ifndef InitObject_ErrandCommon_h
#define InitObject_ErrandCommon_h

#define ERRAND_TIMEOUT_INTERVAL 15    //超时时间
#define ERRAND_MAX_OPERATION_COUNT 4    //最大并发数

//Debug Log
#ifdef DEBUG
#define DBLog(fmt, ...) NSLog((@"\n%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DBLog(...)
#endif

/**
 *  请求服务状态
 */
typedef enum : NSUInteger {
    REQUEST_HTTP_GET        = 0,//HTTP的get请求
    REQUEST_HTTP_POST       = 1,//HTTP的get请求,
    REQUEST_RESTFUL_POST    = 2,//Restful的post请求,
}REQUEST_TYPE;

/**
 服务执行结果: 0 等待 1 成功 2 失败 3 取消
 */
typedef enum{
    RESPONSE_STATE_WAITEXE      = 0,//等待执行
    RESPONSE_STATE_SUCCESS      = 1,//成功
    RESPONSE_STATE_FAIL         = 2,//失败
    RESPONSE_STATE_CANCEL       = 3,//取消
}RESPONSE_STATE;

/**
 *  获取服务错误类型
 */
typedef enum {
    ERRAND_ERROR_DATA_VERIFY_FAIL = -10000,//数据校验失败
}__ENUM_COMM_ERRAND_ERROR_STYPE;


#endif
