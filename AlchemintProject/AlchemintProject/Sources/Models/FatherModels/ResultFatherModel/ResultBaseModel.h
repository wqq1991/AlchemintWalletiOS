/********************************************************************
 文件名称 : ResultFatherModel.h 文件
 作   者 : neo
 创建时间 : 2015-5-11
 文件描述 : 返回数据父模型
 *********************************************************************/


#import <Foundation/Foundation.h>

@interface ResultBaseModel : NSObject
/*字段	中文名称	类型	可空	含义
responseCode	响应码	String(8)	否	见响应代码表
transId	请求流水号	String(16)	否
msg	响应消息	String(50)	是*/

@property (nonatomic, strong) NSString *responseCode;
@property (nonatomic, strong) NSString *transId;
@property (nonatomic, strong) NSString *msg;
 

@end
