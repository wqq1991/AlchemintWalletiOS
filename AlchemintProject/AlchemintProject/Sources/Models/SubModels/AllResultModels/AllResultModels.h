//
//  AllResultModels.h
//  800Bank
//
//  Created by BABAIHOLDINGS on 16/5/12.
//  Copyright © 2016年 Joe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResultBaseModel.h"

@interface AllResultModels : ResultBaseModel

@end




/**
 *  产品列表返回model
 */
@interface ProductResModel : ResultBaseModel
@property (nonatomic, strong) NSString *accountAvailable;                       //可投金额
@property (nonatomic, strong) NSString *expirationTime;                         //购买结束时间
@property (nonatomic, strong) NSString *fixedTime;                              //购买开始时间
@property (nonatomic, strong) NSString *highestRefundRate;                      //最高预期收益
@property (nonatomic, strong) NSString *id;                                     //产品主键ID
@property (nonatomic, strong) NSString *interestRate;                           //平台加息比例（2016-12-24目前弃用）
@property (nonatomic, strong) NSString *lowestRefundRate;                       //最低预期收益
@property (nonatomic, strong) NSString *materialOne;                            //素材1
@property (nonatomic, strong) NSString *materialThree;                          //素材3
@property (nonatomic, strong) NSString *materialTwo;                            //素材2
//@property (nonatomic, strong) NSString *materialFour;                           //素材4
@property (nonatomic, strong) NSString *materialFive;                           //素材5
@property (nonatomic, strong) NSString *materialSix;                            //素材6
@property (nonatomic, strong) NSString *materialSeven;                          //素材7
//@property (nonatomic, strong) NSString *materialEight;                          //特性素材
@property (nonatomic, strong) NSString *productName;                            //产品名称
@property (nonatomic, strong) NSString *relatedId;                              //关联产品ID
@property (nonatomic, strong) NSString *scales;                                 //投资进度
@property (nonatomic, strong) NSString *systemTime;                             //系统时间
@property (nonatomic, strong) NSString *typeCategory;                           //产品类型属性
@property (nonatomic, strong) NSString *typeId;                                 //产品类型ID

@property (nonatomic, strong) NSString *timeLimit;                              //借贷周期
@property (nonatomic, strong) NSString *account;                                //募集规模
@property (nonatomic, strong) NSString *interestWay;                                //计息方式
@property (nonatomic, strong) NSString *lowestAccount;                                //单笔最小投资金额
@property (nonatomic, strong) NSString *mostAccount;                                //单笔最大投资金额
@property (nonatomic, strong) NSString *productTitle;                                //
@property (nonatomic, strong) NSString *isDay;                                //期限单位: 0 ：月标，1：天标
@property (nonatomic, strong) NSString *status;                                 //标的状态:1:已结束，2：已抢光，3：募集中，4：即将开始
@property (nonatomic, strong) NSString *paymentType;    //还款方式
@property (nonatomic, strong) NSString *flagId;    //标类型ID
@property (nonatomic, strong) NSString *icon;   //产品标签图片Url
@property (nonatomic, strong) NSString *nid;    //产品编码
@property (nonatomic, strong) NSString *financCouponRate; //融资方加息
@property (nonatomic, strong) NSString *interestExpectedTime;  //天天盈申购预计起息时间 (ppfund标专有)
@property (nonatomic, strong) NSString *shareTitle; //分享标题
@property (nonatomic, strong) NSString *shareDesc; //分享话术

@property (nonatomic, strong) NSString *unitAmount;
@property (nonatomic, strong) NSString *profitName;         //实物标 实物收益名称
@property (nonatomic, strong) NSString *revenueType;           //31:固定, 32:纯浮动 ,33 :收益浮动,41:区间浮动, 41:纯实物 , 42:实物 ,
@property (nonatomic, strong) NSString *materialNine;       //金交所协议路径;
@property (nonatomic, strong) NSString *riskSurveyStatus;       //风险问卷回答状态 0 未答 1 已答;
@end

/**
 *  我的首页返回model
 */
@interface MemberCenterResModel : ResultBaseModel
@property (nonatomic, strong) NSString *bankNo;                     //绑定卡号
@property (nonatomic, strong) NSString *headPic;                    //头像
@property (nonatomic, strong) NSString *insuredCount;               //已投项目数
@property (nonatomic, strong) NSString *netProfit;                  //累积收益
@property (nonatomic, strong) NSString *noUseMoney;                 //冻结金额
@property (nonatomic, strong) NSString *ppfundMoney;                //零钱包总额
@property (nonatomic, strong) NSString *realName;                   //真实姓名
@property (nonatomic, strong) NSString *total;                      //总资产
@property (nonatomic, strong) NSString *userMoney;                  //账户可用余额
@property (nonatomic, strong) NSString *yesterdayNetProfit;         //昨日收益
@property (nonatomic, strong) NSString *isNewMsg;                   //未读消息是否大于0
@property (nonatomic, strong) NSString *unusedCount;                //福袋可用个数
@property (nonatomic, strong) NSString *expectMoney;                //预期收益
@property (nonatomic, strong) NSString *isChinapnr;                 //是否实名  0：未实名，1：实名
@property (nonatomic, strong) NSString *labelNo;                    //非勋章用户，该值为null
@property (nonatomic, strong) NSString *vipLevel;                   //VIP等级
@property (nonatomic, strong) NSString *validScore;                 //有效积分
@property (nonatomic, strong) NSString *totalScore;                 //总积分
@property (nonatomic, strong) NSString *freezeScore;                //冻结积分
@property (nonatomic, strong) NSString *cleanScoreLimit;            //积分清除截止时间
@property (nonatomic, strong) NSString *cleanScoreYear;             //需要清理年份的积分
@property (nonatomic, strong) NSString *unUsedScore;                //清除之前未使用的积分

@property (nonatomic, strong) NSString *isPrompt;                   //是否VIP已提示用户(0否 1是)
@end

/**
 *  支持的银行卡返回model
 */
@interface SupportBankResModel : ResultBaseModel
@property (nonatomic, strong) NSString *androidRechargeKey;                 //Android端充值通道key
@property (nonatomic, strong) NSString *androidRechargeURL;                 //Android端充值通道URL
@property (nonatomic, strong) NSString *bankCode;                           //银行编号
@property (nonatomic, strong) NSString *bankName;                           //支持的银行名称
@property (nonatomic, strong) NSString *iosRechargeKey;                     //IOS端充值通道key
@property (nonatomic, strong) NSString *iosRechargeURL;                     //IOS端充值通道URL
@property (nonatomic, strong) NSString *wapRechargeKey;                     //微信端充值通道key
@property (nonatomic, strong) NSString *wapRechargeURL;                     //微信端充值通道URL
@property (nonatomic, strong) NSString *webRechargeKey;                     //web端充值通道key
@property (nonatomic, strong) NSString *webRechargeURL;                     //PC端充值通道URL
@end

/**
 *  零钱包中心返回model
 */
@interface WalletCenterResModel : ResultBaseModel
@property (nonatomic, strong) NSString *availableAmount;     //剩余可投金额
@property (nonatomic, strong) NSString *count;               //在投天天盈数
@property (nonatomic, strong) NSString *netProfit;           //累积收益
@property (nonatomic, strong) NSString *interest;            //当前在投收益
@property (nonatomic, strong) NSString *dayAmount;           //目前天天盈每日收益
@property (nonatomic, strong) NSString *topAmount;           //满额每日收益
@property (nonatomic, strong) NSString *rate;                //天天盈收益率
@property (nonatomic, strong) NSString *money;               //在投总金额
@property (nonatomic, strong) NSString *interestExpectedTime;//天天盈赎回预计到账时间
@end


/**
 *  在线充值返回model
 */
@interface OnLineRechargeOperResModel : ResultBaseModel
@property (nonatomic, strong) NSString *bgRetUrl;               //商户后台应答地址
@property (nonatomic, strong) NSString *charSet;                //编码集
@property (nonatomic, strong) NSString *chkValue;               //签名
@property (nonatomic, strong) NSString * cmdId;                 //消息类型
@property (nonatomic, strong) NSString * hfUrl;                 //汇付的请求地址
@property (nonatomic, strong) NSString * merCustId;             //商户客户号
@property (nonatomic, strong) NSString * merPriv;               //商户私有域
@property (nonatomic, strong) NSString * openAcctId;            //银行卡号
@property (nonatomic, strong) NSString * ordId;                 //订单号
@property (nonatomic, strong) NSString * ordDate;               //订单日期
@property (nonatomic, strong) NSString * pageType;              //页面类型
@property (nonatomic, strong) NSString * remark;                //备注
@property (nonatomic, strong) NSString * reqExt;                //入参扩展
@property (nonatomic, strong) NSString * retUrl;                //页面返回地址
@property (nonatomic, strong) NSString * servFee;               //商户收取服务费金 额
@property (nonatomic, strong) NSString * servFeeAcctId;         //商户子账户号
@property (nonatomic, strong) NSString * transAmt;              //交易金额
@property (nonatomic, strong) NSString * usrCustId;             //用户客户号
@property (nonatomic, strong) NSString * version;               //接口版本号
@property (nonatomic, strong) NSString * gateBusiId;
@property (nonatomic, strong) NSString * openBankId;
@property (nonatomic, strong) NSString * dcFlag;
@property (nonatomic, strong) NSString * certId;

@end


/**
 *  已投项目列表返回model
 */
@interface InvestResModel : ResultBaseModel
@property (nonatomic, strong) NSString *borrowId;    //标ID
@property (nonatomic, strong) NSString *expireTime;              //预期还款时间
@property (nonatomic, strong) NSString *addTime;              //预期还款时间
@property (nonatomic, strong) NSString *money;          //投资金额
@property (nonatomic, strong) NSString *productName;          //产品名称
@property (nonatomic, strong) NSString *type;          //产品类别
@property (nonatomic, strong) NSString *typeIcon;       	//产品素材
@property (nonatomic, strong) NSString *relatedId;    //标ID
@end

/**
 *  已投项目列表返回model
 */
@interface OffLineRechargePageResModel : ResultBaseModel
@property (nonatomic, strong) NSString *cardId;                 //身份证号
@property (nonatomic, strong) NSString *minRechargeMoney;       //线下充值最小金额
@property (nonatomic, strong) NSString *realName;               //真实姓名
@property (nonatomic, strong) NSString *systemTime;             //系统时间
@end

/**
 *  银行卡返回model
 */
@interface BankResModel : ResultBaseModel
@property (nonatomic, strong) NSString *bankNo;                 //卡号
@property (nonatomic, strong) NSString *bankName;               //银行名称
@property (nonatomic, strong) NSString *bankCode;               //银行Code
@end

/**
 *  线上提现/线上充值页面返回model
 */
@interface OnLineRechargePageResModel : ResultBaseModel
@property (nonatomic, strong) BankResModel *bankModel;                  //用户已绑卡的信息，未绑卡为null
@property (nonatomic, strong) NSString *useMoney;
@property (nonatomic, strong) NSString *minCashMoney;                   //线上提现最小金额
@property (nonatomic, strong) NSString *systemTime;
@property (nonatomic, strong) NSString *cashExpectedTime;               //
@property (nonatomic, strong) NSString *publicFee;                      //普通提现手续费
@property (nonatomic, strong) NSString *holidayCount;                   //节假日天数
@property (nonatomic, strong) NSString *isWeekday;                      // 是否工作日 1：是 0：否
@property (nonatomic, strong) NSString *cashFeeObj;                     //手续费承担方
@property (nonatomic, strong) NSString *minRechargeMoney;               //最小充值金额
@property (nonatomic, strong) NSString *cashNum;                        //普通提现的次数限制
@property (nonatomic, strong) NSString *publicCashNum;                  //紧急提现次数限制
@property (nonatomic, strong) NSString *deductScore;                    //抵扣手续费需要的积分
@property (nonatomic, strong) NSString *currentScore;                   //用户当前有效积分
@end

/**
 *汇付 绑卡接口返回的Model
 */
@interface HFBindCardResModel : ResultBaseModel
@property (nonatomic, strong) NSString *bgRetUrl;            //后台回调地址
@property (nonatomic, strong) NSString *chkValue;            //资金
@property (nonatomic, strong) NSString *cmdId;               //请求接口名称
@property (nonatomic, strong) NSString *hfUrl;               //汇付的请求地址
@property (nonatomic, strong) NSString *merCustId;           //商户号
@property (nonatomic, strong) NSString *merPriv;             //
@property (nonatomic, strong) NSString *pageType;            //页面类型
@property (nonatomic, strong) NSString *usrCustId;           //用户客户号
@property (nonatomic, strong) NSString *version;             //版本号
@end

/**
 *  资金记录返回model
 */
@interface AccountLogResModel : ResultBaseModel
@property (nonatomic, strong) NSString *addTime;            //时间
@property (nonatomic, strong) NSString *money;              //资金
@property (nonatomic, strong) NSString *remark;             //说明
@property (nonatomic, strong) NSString *type;               //类别
@property (nonatomic, strong) NSString *typeName;           //类型(中文)
@end


/**
 *  加息券列表返回model
 */
@interface UserCouponListResModel : ResultBaseModel
@property (nonatomic, strong) NSString *id;                     //加息券ID
@property (nonatomic, strong) NSString *investLimit;            //最低可使用此券的起投金额
@property (nonatomic, strong) NSString *name;                   //加息券名称
@property (nonatomic, strong) NSString *productTypeOne;         //产品限制1
@property (nonatomic, strong) NSString *productTypeThree;       //产品限制3
@property (nonatomic, strong) NSString *productTypeTwo;         //产品限制2
@property (nonatomic, strong) NSString *toRate;                 //加息比例
@property (nonatomic, strong) NSString *valideTo;               //加息券有效期

#pragma mark - 加息券改版新增字段 -
@property (nonatomic, strong) NSString *canTransfer;        //0 不支持 1 支持
@property (nonatomic, strong) NSString *extendRule;         //后期扩展的规则信息，暂时无用
@property (nonatomic, strong) NSString *investAmount;       //红包限制的起投金额
@property (nonatomic, strong) NSString *proPeriodMax;       //红包限制使用的产品的期限最大值，0表示不限
@property (nonatomic, strong) NSString *proPeriodMin;       //红包限制使用的产品的期限最小值，0表示不限
@property (nonatomic, strong) NSString *useProInclude;      //支持的产品类型（如：800精选，企业专享），与不支持的只会出现一个
@property (nonatomic, strong) NSString *useTypeExclude;     //不支持的产品类型（如：800精选，企业专享），与支持的只会出现一个
@property (nonatomic, strong) NSString *type;               //1：现金红包，2：虚拟红包
@property (nonatomic, strong) NSString *state;              //加息券状态
@property (nonatomic, strong) NSString *effectiveDays;      //加息天数
@property (nonatomic, strong) NSString *effectiveMoney;     //加息金额上限
@end

/**
 *  红包列表返回model
 */
@interface RedPacketResModel : ResultBaseModel
@property (nonatomic, strong) NSString *amount;        //红包金额
@property (nonatomic, strong) NSString *donateTime;    //转赠时间
@property (nonatomic, strong) NSString *exchangeTime;  //兑换时间
@property (nonatomic, strong) NSString *expiredTime;   //过期时间
@property (nonatomic, strong) NSString *fromMobile;    //赠送人手机号码
@property (nonatomic, strong) NSString *id;            //新手产品收益总额

@property (nonatomic, strong) NSString *lastDays;      //剩余天数
@property (nonatomic, strong) NSString *name;          //红包类型名称
@property (nonatomic, strong) NSString *realName;      //用户真实姓名
@property (nonatomic, strong) NSString *serviceName;   //红包名称
@property (nonatomic, strong) NSString *serviceType;   //红包英文名称
@property (nonatomic, strong) NSString *status;        //状态

@property (nonatomic, strong) NSString *toMobile;      //被赠送人手机号码
@property (nonatomic, strong) NSString *useTime;       //使用时间
@property (nonatomic, strong) NSString *userName;      //用户名

#pragma mark - 红包改版新增字段 -
@property (nonatomic, strong) NSString *canTransfer;      //0 不支持 1 支持
@property (nonatomic, strong) NSString *extendRule;         //后期扩展的规则信息，暂时无用
@property (nonatomic, strong) NSString *investAmount;      //红包限制的起投金额
@property (nonatomic, strong) NSString *proPeriodMax;      //红包限制使用的产品的期限最大值，0表示不限
@property (nonatomic, strong) NSString *proPeriodMin;      //红包限制使用的产品的期限最小值，0表示不限
@property (nonatomic, strong) NSString *useProInclude;      //支持的产品类型（如：800精选，企业专享），与不支持的只会出现一个
@property (nonatomic, strong) NSString *useTypeExclude;      //不支持的产品类型（如：800精选，企业专享），与支持的只会出现一个
@property (nonatomic, strong) NSString *type;               //1：现金红包，2：虚拟红包
@end

/**
 *  现金券/特权本金列表返回model
 */
@interface PrivilegeMoneyListResModel : ResultBaseModel
@property (nonatomic, strong) NSString *addTime;                //添加时间
@property (nonatomic, strong) NSString *amount;                 //金额
@property (nonatomic, strong) NSString *benefitId;              //关联的福利id
@property (nonatomic, strong) NSString *benefitType;            //类型 1 返现券 2 特权本金券
@property (nonatomic, strong) NSString *canTransfer;            //是否支持转赠 0 不可 1 可以

@property (nonatomic, strong) NSString *canUse;                 //是否可使用 useStatus使用状态 存在时方才有值
@property (nonatomic, strong) NSString *expiredTime;            //过期时间
@property (nonatomic, strong) NSString *extendRule;             //扩展规则
@property (nonatomic, strong) NSString *id;                     //主键
@property (nonatomic, strong) NSString *investAmount;           //起投金额

@property (nonatomic, strong) NSString *isHandle;               //是否转出 0 未转出 1 已转出
@property (nonatomic, strong) NSString *isInvite;               //扩展规则值之一，送参 type为2 方才有值
@property (nonatomic, strong) NSString *isRemind;               //是否提醒
@property (nonatomic, strong) NSString *isUsed;                 //是否已使用 0 未使用 1 已使用
@property (nonatomic, strong) NSString *joinStrategy;           //扩展规则值之一，送参 type为2 方才有值

@property (nonatomic, strong) NSString *mobileNumber;           //手机号
@property (nonatomic, strong) NSString *ppfundInId;             //现金标ID
@property (nonatomic, strong) NSString *proPeriodMax;           //产品期限最大值
@property (nonatomic, strong) NSString *proPeriodMin;           //产品期限最小值
@property (nonatomic, strong) NSString *registerActivityCode;   //扩展规则值之一，送参 type为2 方才有值

@property (nonatomic, strong) NSString *relationNo;             //关联订单号
@property (nonatomic, strong) NSString *status;                 //状态
@property (nonatomic, strong) NSString *tenderId;               //投标ID
@property (nonatomic, strong) NSString *type;                   //获取途径 1 原生的 2 转赠
@property (nonatomic, strong) NSString *updateTime;             //修改时间

@property (nonatomic, strong) NSString *useProInclude;          //支持的产品类型，ids串
@property (nonatomic, strong) NSString *useProIncludeName;      //支持的产品类型
@property (nonatomic, strong) NSString *useTypeExclude;         //不支持的产品类型，ids串
@property (nonatomic, strong) NSString *useTypeExcludeName;     //不支持的产品类型
@property (nonatomic, strong) NSString *usedTime;               //使用时间

@property (nonatomic, strong) NSString *userId;                 //支持的产品类型，ids串
@property (nonatomic, strong) NSString *userRegEndTime;         //扩展规则值之一，送参 type为2 方才有值
@property (nonatomic, strong) NSString *userRegStartTime;       //扩展规则值之一，送参 type为2 方才有值
@property (nonatomic, strong) NSString *expectMoney;            //预期收益
@property (nonatomic, strong) NSString *specialRate;            //特权本金利率
@property (nonatomic, strong) NSString *specialPeriod;          //特权本金期限
@end

/**
 * 我的可用红包列表返回model (新接口)
 */
@interface NewUserRedPackeResModel : ResultBaseModel
@property (nonatomic, strong) NSString *amount;                 //红包金额
@property (nonatomic, strong) NSString *exchangeTime;           //兑换时间
@property (nonatomic, strong) NSString *expiredTime;            //过期时间
@property (nonatomic, strong) NSString *id;                     //记录ID
@property (nonatomic, strong) NSString *name;                   //红包类型名称

@property (nonatomic, strong) NSString *canTransfer;              //是否支持转赠：0 不支持 1 支持 为空时为老红包，则可以转赠
@property (nonatomic, strong) NSString *canUse;                   //是否可用
@property (nonatomic, strong) NSString *extendRule;              //扩展字段
@property (nonatomic, strong) NSString *investAmount;            //起投金额

@property (nonatomic, strong) NSString *proPeriodMax;            //最大期限的限制
@property (nonatomic, strong) NSString *proPeriodMin;            //最小期限的限制
@property (nonatomic, strong) NSString *useProInclude;           //可用的产品类型
@property (nonatomic, strong) NSString *useTypeExclude;          //不可用的产品类型

@end

/**
 *  我的可用加息券列表返回model (新接口)
 */
@interface NewCouponListResModel : ResultBaseModel

@property (nonatomic, strong) NSString *canTransfer;             //是否支持转赠：0 不支持 1 支持 为空时为老红包，则可以转赠
@property (nonatomic, strong) NSString *canUse;                  //是否可用
@property (nonatomic, strong) NSString *effectiveDays;           //加息天数
@property (nonatomic, strong) NSString *extendRule;              //扩展字段
@property (nonatomic, strong) NSString *id;                      //记录ID

@property (nonatomic, strong) NSString *investAmount;            //起投金额
@property (nonatomic, strong) NSString *investLimit;             //起投金额
@property (nonatomic, strong) NSString *name;                    //类型名称
@property (nonatomic, strong) NSString *proPeriodMax;            //最大期限的限制
@property (nonatomic, strong) NSString *proPeriodMin;            //最小期限的限制

@property (nonatomic, strong) NSString *ruleId;                  //扩展字段
@property (nonatomic, strong) NSString *toRate;                  //加息比率

@property (nonatomic, strong) NSString *useProInclude;           //可用的产品类型
@property (nonatomic, strong) NSString *useTypeExclude;          //不可用的产品类型
@property (nonatomic, strong) NSString *valideTo;                //有效期
@property (nonatomic, strong) NSString *effectiveMoney;          //加息金额限制
@property (nonatomic, strong) NSArray *titles;
@end


/**
 *  消息公告列表返回model
 */
@interface UserMessagesResModel : ResultBaseModel
@property (nonatomic, strong) NSString *add_time;               //推送时间
@property (nonatomic, strong) NSString *content;                //消息内容
@property (nonatomic, strong) NSString *id;                     //主键ID
@property (nonatomic, strong) NSString *status;                 //消息状态 0： 未读，1：已读
@property (nonatomic, strong) NSString *title;                  //消息标题
@property (nonatomic, strong) NSString *type;                   //消息类型
@property (nonatomic, strong) NSString *synopsis;               //概要
@end

/**
 *  摇一摇藏金阁返回model
 */
@interface MoneyBoxResModel : ResultBaseModel
@property (nonatomic, strong) NSString *money;                  //金额
@property (nonatomic, strong) NSString *prizeId;                //抽到的奖品id
@property (nonatomic, strong) NSString *prizeName;              //奖品名称
@property (nonatomic, strong) NSString *displayName;              //弹框标题
@property (nonatomic, strong) NSString *tips;                    //奖品弹框话术
@property (nonatomic, strong) NSString *prizeType;              //奖品类型(1：红包，2：加息劵,3:其他,4：返现卷，5：特权本金)
@property (nonatomic, strong) NSString *prizeTypeId;            //抽到的奖品类别
@property (nonatomic, strong) NSString *subtypes;               //子类型（对应奖项类型的子类型1:现金红包，2，虚拟红包，3...）
@end

/**
 *  获取藏金阁分享图片返回model
 */
@interface SharePictureResModel : ResultBaseModel
@property (nonatomic, strong) NSString *result;                  //该用户当日的分享图片URL
@end

/**
 *  获取勋章分享图片返回model
 */
@interface MedalPictureResModel : ResultBaseModel
@property (nonatomic, strong) NSString *result;                  //该用户当日的分享图片URL
@end

/**
 *  摇一摇奖品列表返回model
 */
@interface PriceListResModel : ResultBaseModel
@property (nonatomic, strong) NSString *page;                 //分页
@property (nonatomic, strong) NSString *currentPage;          //当前页
@property (nonatomic, strong) NSString *end;                  //结束页
@property (nonatomic, strong) NSString *pages;                 //总页数
@property (nonatomic, strong) NSString *pernum;                //每页数据
@property (nonatomic, strong) NSString *start;                 //开始页
@property (nonatomic, strong) NSString *total;                 //数据总条数
@property (nonatomic, strong) NSArray *prizeList;             //（ prizeList|0-10）奖品列表
@end

/**
 *  摇一摇奖品记录详情列表返回model
 */
@interface PriceListDetailResModel : ResultBaseModel
@property (nonatomic, strong) NSString *icon;                  //图标
@property (nonatomic, strong) NSString *prizeGetTime;          //奖品获取的时间
@property (nonatomic, strong) NSString *prizeId;               //抽到的奖品id
@property (nonatomic, strong) NSString *prizeName;             //奖品名称
@property (nonatomic, strong) NSString *prizeTypeId;           //抽到的奖品类别
@property (nonatomic, strong) NSString *prizeDate;          //奖品获取的日期
@end


/**
 *  摇一摇奖品记录分段列表返回model
 */
@interface PriceListDateResModel : ResultBaseModel
@property (nonatomic, strong) NSString *date;                  //日期
@property (nonatomic, strong) NSMutableArray *dateItems;       //奖品记录（PriceListDetailResModel）
@end

/**
 *  剩余摇奖次数返回model
 */
@interface RestPriceAccountResModel : ResultBaseModel
@property (nonatomic, strong) NSString *num;               //剩余抽奖机会
@property (nonatomic, strong) NSString *needScore;         //兑换抽奖次数需要的积分
@property (nonatomic, strong) NSString *currentScore;        //当前积分
@property (nonatomic, strong) NSString *isShare;           //是否分享
@end

/**
 *  邀请记录列表返回model
 */
@interface UserInviteResModel : ResultBaseModel
@property (nonatomic, strong) NSString *inviteTime;                //邀请时间
@property (nonatomic, strong) NSString *isUse;                     //被邀请人投资状态
@property (nonatomic, strong) NSString *id;                        //主键ID
@property (nonatomic, strong) NSString *realName;                  //被邀请人真实姓名
@property (nonatomic, strong) NSString *realNameStatus;            //	被邀请人实名状态
@property (nonatomic, strong) NSString *realNameVerifyTime;        //被邀请人实名时间
@property (nonatomic, strong) NSString *regTime;                   //被邀请人注册时间
@property (nonatomic, strong) NSString *userName;                  //被邀请人用户名
@end

/**
 *  红包记录列表返回model
 */
@interface UserRedPackeResModel : ResultBaseModel
@property (nonatomic, strong) NSString *amount;                 //红包金额
@property (nonatomic, strong) NSString *exchangeTime;           //兑换时间
@property (nonatomic, strong) NSString *expiredTime;            //过期时间
@property (nonatomic, strong) NSString *id;                     //记录ID
@property (nonatomic, strong) NSString *name;                   //红包类型名称
@end

/**
 *  资产详情返回model
 */
@interface AssetDetailsResModel : ResultBaseModel
@property (nonatomic, strong) NSString *cashMoney;                          //提现冻结金额
@property (nonatomic, strong) NSString *ppfundOutMoney;                          //提现冻结金额
@property (nonatomic, strong) NSString *enterpriseEarnMoney;                //企业专享收益总额
@property (nonatomic, strong) NSString *enterpriseMoney;                    //企业专享总额
@property (nonatomic, strong) NSString *featuredEarnMoney;                  //800精选收益总额
@property (nonatomic, strong) NSString *featuredMoney;                      //800精选总额
@property (nonatomic, strong) NSString *holdMoney;                          //持有本金
@property (nonatomic, strong) NSString *investMoney;                        //投资冻结金额
@property (nonatomic, strong) NSString *netProfit;                          //累积收益
@property (nonatomic, strong) NSString *noUseMoney;                          //冻结总金额
@property (nonatomic, strong) NSString *noviceEarnMoney;                    //新手产品收益总额
@property (nonatomic, strong) NSString *noviceMoney;                        //新手产品总额
@property (nonatomic, strong) NSString *ppfundEarnMoney;                    //零钱包收益总额
@property (nonatomic, strong) NSString *ppfundMoney;                        //零钱包总额
@property (nonatomic, strong) NSString *total;                              //总资产
@property (nonatomic, strong) NSString *userMoney;                          //账户可用余额
@end

/**
 *  零钱包在投列表返回model
 */
@interface PpfundResModel : ResultBaseModel
@property (nonatomic, strong) NSString *buyTime;        //购买时间
@property (nonatomic, strong) NSString *money;          //投资金额
@property (nonatomic, strong) NSString *ppfundId;       //ID
@property (nonatomic, strong) NSString *interestState;  //起息状态 0未起息，1起息
@end

/**
 *  天天盈资金记录列表返回model
 */
@interface ProfitListResModel : ResultBaseModel
@property (nonatomic, strong) NSString *addTime;        //时间
@property (nonatomic, strong) NSString *money;          //资金
@end

/**
 *  已投项目详情返回model
 */
@interface InvestDetailResModel : ResultBaseModel
@property (nonatomic, strong) NSString *account;            //投资金额
@property (nonatomic, strong) NSString *addTime;            //投资时间
@property (nonatomic, strong) NSString *apr;                //收益率
@property (nonatomic, strong) NSString *expireTime;         //到期时间
@property (nonatomic, strong) NSString *interest;           //到期收益
@property (nonatomic, strong) NSString *interestRateValue;  //加息券
@property (nonatomic, strong) NSString *isDay;              //是否天标
@property (nonatomic, strong) NSString *money;              //持有金额
@property (nonatomic, strong) NSString *paymentType;        //还款方式
@property (nonatomic, strong) NSString *productName;        //项目名称
@property (nonatomic, strong) NSString *relatedId;          //标id
@property (nonatomic, strong) NSString *repaymentAccount;   //待回款金额
@property (nonatomic, strong) NSString *reviewTime;         //计息时间
@property (nonatomic, strong) NSString *timeLimit;          //借款期限
@property (nonatomic, strong) NSString *type;               //标类型
@property (nonatomic, strong) NSString *typeIcon;           //图标
@property (nonatomic, strong) NSString *pId;                //合同ID
@property (nonatomic, strong) NSString *financCouponRate;   //融资方加息

@property (nonatomic, strong) NSString *unitAmount;
@property (nonatomic, strong) NSString *profitName;         //实物标 实物收益名称
@property (nonatomic, strong) NSString *revenueType;           //31:固定, 32:纯浮动 ,33 :收益浮动,41:区间浮动, 41:纯实物 , 42:实物+收益 ,
@end


/**
 *  获取银行卡额度返回model
 */
@interface SupportBankMoneyResModel : ResultBaseModel
@property (nonatomic, strong) NSString *bank_code;          //银行编码
@property (nonatomic, strong) NSString *bank_name;          //银行名称
@property (nonatomic, strong) NSString *bank_status;        //银行卡状态
@property (nonatomic, strong) NSString *card_type;          //银行卡类型
@property (nonatomic, strong) NSString *day_amt;            //单日额度
@property (nonatomic, strong) NSString *month_amt;          //单月额度
@property (nonatomic, strong) NSString *single_amt;         //单笔额度
@end

/**
 *  推荐收益返回model
 */
@interface InviteEarningsResModel : ResultBaseModel
@property (nonatomic, strong) NSString *addTime;
@property (nonatomic, strong) NSString *money;
@property (nonatomic, strong) NSString *userName;
@end

/*
 *  检测更新返回model
 */
@interface CheckVersionResModel : ResultBaseModel
@property (nonatomic, strong) NSString *isUpdate;   //是否强制更新
@property (nonatomic, strong) NSString *version;    //版本号
@end

/*
 *  获取广告图
 */
@interface AdvertisementResModel : ResultBaseModel
@property (nonatomic, strong) NSString *bannerLinkUrl;      //
@property (nonatomic, strong) NSString *bannerName;         //
@property (nonatomic, strong) NSString *bannerPicUrl;       //

@property (nonatomic, strong) NSString *basicId;       //
@property (nonatomic, strong) NSString *id;       //

@property (nonatomic, strong) NSString *shareContent;       //
@property (nonatomic, strong) NSString *shareLinkUrl;       //
@property (nonatomic, strong) NSString *sharePicUrl;       //
@property (nonatomic, strong) NSString *shareTitle;       //
@property (nonatomic, strong) NSString *typeCategory;       //
@end


/*
 *  实名认证
 */
@interface CertificationResModel : ResultBaseModel
@property (nonatomic, strong) NSString *bgRetUrl;           //后台返回地址
@property (nonatomic, strong) NSString *chkValue;           //汇付需要的串
@property (nonatomic, strong) NSString *cmdId;              //汇付的界面名

@property (nonatomic, strong) NSString *hfUrl;              //请求汇付的地址
@property (nonatomic, strong) NSString *idNo;               //身份证号

@property (nonatomic, strong) NSString *idType;             //身份证类型
@property (nonatomic, strong) NSString *merCustId;          //商户号
@property (nonatomic, strong) NSString *merPriv;            //自定义的参数
@property (nonatomic, strong) NSString *retUrl;             //页面返回地址
@property (nonatomic, strong) NSString *usrEmail;           //用户email
@property (nonatomic, strong) NSString *usrId;              //用户号
@property (nonatomic, strong) NSString *usrMp;              //手机号
@property (nonatomic, strong) NSString *usrName;            //用户名
@property (nonatomic, strong) NSString *version;            //版本
@property (nonatomic, strong) NSString *pageType;           //页面类型
@end

/*
 *  汇付登录
 */
@interface LoginChinapnrResModel : ResultBaseModel
@property (nonatomic, strong) NSString *hfUrl;
@property (nonatomic, strong) NSString *chkValue;           //加密串
@property (nonatomic, strong) NSString *cmdId;              //接口名
@property (nonatomic, strong) NSString *merCustId;          //商户号
@property (nonatomic, strong) NSString *usrCustId;          //客户号
@property (nonatomic, strong) NSString *version;            //版本号pageType
@property (nonatomic, strong) NSString *pageType;            //页面类型（手机版还是电脑版）
@end

/*
 *  银行卡ResModel
 */
@interface BankCardResModel : ResultBaseModel
@property (nonatomic, strong) NSString *bankName;           //银行名称
@property (nonatomic, strong) NSString *bankNo;             //银行卡号
@property (nonatomic, strong) NSString *bankCode;           //银行代码
@property (nonatomic, strong) NSString *bankType;           //卡片类型
@end

/*
 *  汇付提现ResModel
 */
@interface HFMoveOutResModel : ResultBaseModel
@property (nonatomic, strong) NSString *bgRetUrl;           //后台回调地址
@property (nonatomic, strong) NSString *charSet;            //编码集
@property (nonatomic, strong) NSString *chkValue;           //加密串
@property (nonatomic, strong) NSString *cmdId;              //接口名
@property (nonatomic, strong) NSString *hfUrl;              //汇付请求地址
@property (nonatomic, strong) NSString *merCustId;              //商户号
@property (nonatomic, strong) NSString *merPriv;              //自定义参数
@property (nonatomic, strong) NSString *openAcctId;              //开户的银行账号
@property (nonatomic, strong) NSString *ordId;              //订单编号
@property (nonatomic, strong) NSString *pageType;              //页面类型
@property (nonatomic, strong) NSString *remark;              //备注
@property (nonatomic, strong) NSString *reqExt;              //请求参数扩展域
@property (nonatomic, strong) NSString *retUrl;              //页面返回地址
@property (nonatomic, strong) NSString *servFee;              //服务费
@property (nonatomic, strong) NSString *servFeeAcctId;              //服务费账号
@property (nonatomic, strong) NSString *transAmt;              //交易金额
@property (nonatomic, strong) NSString *usrCustId;              //客户号
@property (nonatomic, strong) NSString *version;              //版本
@end

/*
 *  汇付提交订单ResModel
 */
@interface HFSubmitOrdertResModel : ResultBaseModel
@property (nonatomic, strong) NSString *bgRetUrl;           //后台回调地址
@property (nonatomic, strong) NSString *borrowerDetails;            //编码集
@property (nonatomic, strong) NSString *chkValue;           //加密串
@property (nonatomic, strong) NSString *cmdId;              //接口名
@property (nonatomic, strong) NSString *hfUrl;              //汇付请求地址

@property (nonatomic, strong) NSString *isFreeze;              //
@property (nonatomic, strong) NSString *maxTenderRate;              //
@property (nonatomic, strong) NSString *merCustId;              //商户号
@property (nonatomic, strong) NSString *merPriv;              //自定义参数
@property (nonatomic, strong) NSString *ordDate;              //订单日期

@property (nonatomic, strong) NSString *ordId;              //订单编号
@property (nonatomic, strong) NSString *pageType;              //页面类型
@property (nonatomic, strong) NSString *respExt;              //
@property (nonatomic, strong) NSString *respCode;              //
@property (nonatomic, strong) NSString *respDesc;              //

@property (nonatomic, strong) NSString *reqExt;              //请求参数扩展域
@property (nonatomic, strong) NSString *retUrl;              //页面返回地址
@property (nonatomic, strong) NSString *transAmt;              //交易金额
@property (nonatomic, strong) NSString *trxId;              //
@property (nonatomic, strong) NSString *usrCustId;              //客户号

@property (nonatomic, strong) NSString *version;              //版本
@property (nonatomic, strong) NSString *freezeOrdId;
@property (nonatomic, strong) NSString *freezeTrxId;
@end

/*
 *  用户可用红包、加息券、返现券、特权本金数量查询ResModel
 */
@interface LuckBagCountResModel : ResultBaseModel
@property (nonatomic, strong) NSString *redPacketNum;          //红包数量
@property (nonatomic, strong) NSString *couponNum;             //加息券数量
@property (nonatomic, strong) NSString *privilegeCashNum;      //特权本金数量
@property (nonatomic, strong) NSString *backCashNum;           //返现券数量
@end

/*
 *  勋章权益ResModel
 */
@interface MedalRightResModel : ResultBaseModel
@property (nonatomic, strong) NSArray *rules;          // 规则信息列表
@end


/*
 *
 */
@interface GoodsCategoryIdModel : ResultBaseModel
@property (nonatomic, strong) NSString *iconCls;                    //图标
@property (nonatomic, strong) NSString *id;                         //商品类别编号
@property (nonatomic, strong) NSString *name;                       // 规则信息列表
@property (nonatomic, strong) NSString *parentId;                   // 规则信息列表
@property (nonatomic, strong) NSString *remark;                     // 规则信息列表
@property (nonatomic, strong) NSString *sort;                       // 规则信息列表
@end
/*
 *  产品列表ResModel
 */
@interface GoodsResModel : ResultBaseModel
@property (nonatomic, strong) NSString *addTime;          //添加时间
@property (nonatomic, strong) NSString *attribute;        //商品属性信息

@property (nonatomic, strong) NSString *cost;                       //商品售价
@property (nonatomic, strong) NSString *goodsDescription;                //商品详情
@property (nonatomic, strong) NSString *errorDesc;                  //失败描述
@property (nonatomic, strong) NSString *freezeStore;                //冻结库存

@property (nonatomic, strong) NSString *id;                         //编号
@property (nonatomic, strong) NSString *managerRulesParam;          //管理规则私有欲
@property (nonatomic, strong) NSString *marketPrice;                //商场价
@property (nonatomic, strong) NSString *merprivParam;               //私有域参数
@property (nonatomic, strong) NSString *name;                       //商品名称

@property (nonatomic, strong) NSString *remark;                      //备注
@property (nonatomic, strong) NSString *score;                       //所需积分
@property (nonatomic, strong) NSString *sellAcount;                  //销售数量
@property (nonatomic, strong) NSString *shelvesTime;                 //上架时间
@property (nonatomic, strong) NSString *status;                      //商品状态

@property (nonatomic, strong) NSString *store;                       //商品库存
@property (nonatomic, strong) NSString *successDesc;                 //成功描述
@property (nonatomic, strong) NSString *type;                        //商品状态0待上架，1上架，-1下架
@property (nonatomic, strong) NSString *useScene;                    //使用
@property (nonatomic, strong) NSString *astrictNum;                  //每人限购件数
//@property (nonatomic, strong) NSString *headPic;
@property (nonatomic, strong) NSString *astrictDesc;
@property (nonatomic, strong) NSString *appHeadPic;     

@property (nonatomic, strong) NSArray *goodsPicModels;               //图片路径模型数组
@property (nonatomic, strong) GoodsCategoryIdModel *categoryIdModel;             //商品类别
@end



/*
 *  产品列表ResModel
 */
@interface GoodsPicModel : ResultBaseModel
@property (nonatomic, strong) NSString *addTime;                    //
@property (nonatomic, strong) NSString *goodsId;                   //商品类别编号
@property (nonatomic, strong) NSString *id;                       // 规则信息列表
@property (nonatomic, strong) NSString *picUrl;                   // 规则信息列表
@end


/**
 *   用户收件地址返回model
 */
@interface AddressResModel : ResultBaseModel
@property (nonatomic, copy) NSString *addTime;            // 添加时间
@property (nonatomic, copy) NSString *address;            // 寄件地址
@property (nonatomic, copy) NSString *courierName;        // 收件人姓名
@property (nonatomic, copy) NSString *id;                 // 编号
@property (nonatomic, copy) NSString *isDefault;          // 是否默认
@property (nonatomic, copy) NSString *postCode;           // 邮编
@property (nonatomic, copy) NSString *telphone;           // 收件号码
@property (nonatomic, copy) NSString *userId;             // 用户编号
@property (nonatomic, assign) float cellHeight;         // cell高度
@end
/*
 *  积分兑换列表ResModel
 */
@interface ScoreLogResModel : ResultBaseModel
@property (nonatomic, strong) NSString *addTime;                            //
@property (nonatomic, strong) NSString *paymentsType;                       //收支明细 0是不变 1是收入 2是支出
@property (nonatomic, strong) NSString *id;                                 //规则信息列表
@property (nonatomic, strong) NSString *score;                              //变动积分数值
@property (nonatomic, strong) NSString *scoreTypeName;                      //积分类型名称
@end

/*
 *  积分兑换记录列表ResModel
 */
@interface ScoreGoodsResModel : ResultBaseModel
@property (nonatomic, strong) NSString *addTime;
@property (nonatomic, strong) NSString *convertNum;
@property (nonatomic, strong) NSString *remark;
@property (nonatomic, strong) NSString *score;
@property (nonatomic, strong) NSString *goodsName;
@end

/*
 *  ResModel
 */
@interface CouponCountResModel : ResultBaseModel
@property (nonatomic, strong) NSString *turnAddCount;
@property (nonatomic, strong) NSString *noUsedCount;
@property (nonatomic, strong) NSString *useCount;
@property (nonatomic, strong) NSString *overdueCount;
@end

/*
 *  ResModel
 */
@interface BenefitCountResModel : ResultBaseModel
@property (nonatomic, strong) NSString *turnAddCount;
@property (nonatomic, strong) NSString *noUseCount;
@property (nonatomic, strong) NSString *useCount;
@property (nonatomic, strong) NSString *overdueCount;
@end

/*
 *  版本记录ResModel
 */
@interface VersionListResModel : ResultBaseModel
@property (nonatomic, strong) NSString *addIp;              // 添加ip
@property (nonatomic, strong) NSString *addTime;             // 上线时间
@property (nonatomic, strong) NSString *content;             // 版本内容(文本)
@property (nonatomic, strong) NSString *id;                  // 编号
@property (nonatomic, strong) NSString *number;              // 版本号
@property (nonatomic, strong) NSString *status;              // 状态
@property (nonatomic, strong) NSString *title;               // 标题
@property (nonatomic, strong) NSString *type;                // 上线平台
@property (nonatomic, strong) NSArray *contentList;             // 版本内容(数组)
@property (nonatomic, assign) float cellHeight;             // cell高度
@property (nonatomic, assign, getter=isClose) BOOL close;
@end

/*
 *  资讯列表ResModel
 */
@interface InfoListResModel : ResultBaseModel
@property (nonatomic, strong) NSString *addIp;               // 添加ip
@property (nonatomic, strong) NSString *addTime;              // 上线时间
@property (nonatomic, strong) NSString *author;               // 作者
@property (nonatomic, strong) NSString *classify;               // 分类
@property (nonatomic, strong) NSString *clicks;                // 浏览数
@property (nonatomic, strong) NSString *collectNum;            // 收藏数
@property (nonatomic, strong) NSString *content;               // 内容
@property (nonatomic, strong) NSString *id;                    // 主键
@property (nonatomic, strong) NSString *ifyName;                // 分类名称
@property (nonatomic, strong) NSString *introduction;             // 简介
@property (nonatomic, strong) NSString *isDelete;               // 是否删除
@property (nonatomic, strong) NSString *label;                   // 标签
@property (nonatomic, strong) NSString *likeNum;                 // 点赞数
@property (nonatomic, strong) NSString *picPath;                  // 头图
@property (nonatomic, strong) NSString *richTxtUrl;              //富文本嵌入链接
@property (nonatomic, strong) NSString *shareContent;            // 分享内容
@property (nonatomic, strong) NSString *shareLinkUrl;            // 分享链接
@property (nonatomic, strong) NSString *sharePicUrl;             // 分享头图
@property (nonatomic, strong) NSString *shareTitle;              // 分享标题
@property (nonatomic, strong) NSString *sort;                    // 排序
@property (nonatomic, strong) NSString *status;                  // 状态
@property (nonatomic, strong) NSString *title;                   // 标题
@end

/*
 *  资讯列表ResModel
 */
@interface ActivityResModel : ResultBaseModel
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *introduction;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *actLink;
@property (nonatomic, strong) NSString *signupCounts;
@property (nonatomic, strong) NSString *picPath;
@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, strong) NSString *stopTime;
@property (nonatomic, strong) NSString *addTime;
@property (nonatomic, strong) NSString *updateTime;
@property (nonatomic, strong) NSString *isDelete;
@property (nonatomic, strong) NSString *signup;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *shareTitle;
@property (nonatomic, strong) NSString *shareContent;
@property (nonatomic, strong) NSString *sharePicUrl;
@property (nonatomic, strong) NSString *shareLinkUrl;
@property (nonatomic, strong) NSString *richTxtUrl;
@property (nonatomic, strong) NSString *isSignUp;
@end


