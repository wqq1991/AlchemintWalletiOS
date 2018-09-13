/********************************************************************
 文件名称 :  AsyncHandles.h 文件
 作   者 : WuQiaoqiao
 创建时间 :15/4/29.
 文件描述 : 类
********************************************************************/

#import <Foundation/Foundation.h>
#import "RequestResultBlock.h"
#import "ResponseUtil.h"
#import "RequestBaseModel.h"

typedef ResponseUtil* (^HandleBlock)(ResponseUtil *responseUtil,NSDictionary *dic);

typedef enum {

    ProductRequestTypeHomeProduct,
    ProductRequestTypeProductList
}ProductRequestType;

@interface AsyncRequestHandles : NSObject

/**
 *  示例
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getDataStockNo:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  手机号验证
 *
 *  @param phone       phone description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getLoginBeforeData:(NSString *)phone identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  用户登录
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getLoginData:(RequestBaseModel *)model dentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  发送验证码
 *
 *  @param phone       phone description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getVerifyCode:(NSString *)phone identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  用户注册
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getRegisterData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  检测邀请人是否存在
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getExitsInvCodeData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  忘记登录密码
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getForgetPwd:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  首页banner
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getBannerData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  启动广告页
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getAdData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  首页列表产品数据（热销榜）
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getHotProductsData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;


/**
 *  产品列表
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getProductListData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  产品详情
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getProductDetailData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  我的信息
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getMemberCenterData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  资金记录
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getAccountLogData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;


/**
 *  已投项目(已投和已还款)
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getInvestDetailData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  零钱包账户中心
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getMemberPpfundData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  零钱包在投记录
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getUserSearchData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  在线充值
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getOnLineRechargeOperData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  汇付在线充值页面
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getOnLineRechargePageData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  绑卡操作
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getChinapnrBindCardOper:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  线下充值
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
//+ (void)getOffLineRechargeOperData:(RequestFatherModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  线下充值页面
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
//+ (void)getOffLineRechargePageData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  获取短信验证码（绑定银行卡）
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getAddBankCode:(NSString *)mobilePhone identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;


/**
 *  获取银行卡信息
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getBankInfo:(NSString *)bankNo identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;
    
/**
 *  获取支持银行列表
 *
 *  @param bankNo      bankNo description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
//+ (void)getSupportBankList:(NSString *)bankNo identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  在线提现
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getOnLineCashOperData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  在线提现页面
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getOnLineCashPageData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  提现手机验证码
 *
 *  @param phone                      phone description
 *  @param identifier                 identifier description
 *  @param cancelRequestForIdentifier cancelRequestForIdentifier description
 *  @param identifier                 identifier description
 */
+ (void)getCashMsg:(NSString *)phone identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  零钱包赎回
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getPpfundOutData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  天天盈资金记录
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getProfitListData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  购买产品发送验证码
 *
 *  @param phone       phone description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getBuyVerifyCode:(NSString *)phone identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  现金类投资/订单提交
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getInvestOper:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  加息券列表
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getUserCouponListData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  现金券列表
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getUserRedPacketListData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  我的可用红包列表
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getMyRedPacketListData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  我的可用加息券列表(新接口)
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getMyCouponListData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  消息公告列表
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getUserMessagesListData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  @author qiaoqiao.wu, 16-06-24 23:06:28
 *
 *  修改登录密码
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)changedLoginPwd:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  @author qiaoqiao.wu, 16-06-24 23:06:17
 *
 *  修改交易密码
 *
 *  @param model                      model description
 *  @param identifier                 identifier description
 *  @param cancelRequestForIdentifier cancelRequestForIdentifier description
 *  @param identifier                 identifier description
 */
+ (void)changedPayPwd:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  邀请记录列表
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getUserInviteListData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  红包记录列表
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getUserRedPacketData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  意见反馈
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)UpdateMemberAddNoteData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  资产详情
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getAssetDetailsData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  加息券转赠
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getDonateUserCouponData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  红包转赠
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getDonateUserRedPacketData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  更新DeviceToken
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)updateDeviceTokenData:(NSString *)token identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  可用加息券
 *
 *  @param flagId      flagId description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getCouponList:(NSString *)flagId identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *   可用红包
 *
 *  @param flagId      flagId description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getRedPacketList:(NSString *)flagId identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  @author qiaoqiao.wu, 16-06-30 22:06:34
 *
 *  已投项目详情
 *
 *  @param relatedId   relatedId description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getSubInvestDetai:(NSString *)relatedId identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  @author qiaoqiao.wu, 16-07-01 00:07:13
 *
 *  邀请页面(邀请好友个数等)
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getUserInvitePage:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  产品详情图片(项目介绍)
 *
 *  @param basicId     basicId description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getProductContent:(NSString *)basicId identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  合同详情
 *
 *  @param model       model description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getProtocolContent:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  获取银行卡额度
 *
 *  @param bankCode    bankCode description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getQuerySupportBank:(NSString *)bankCode identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *   推荐收益
 *
 *  @param basicId     basicId description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getInviteEarnings:(NSString *)basicId identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  获取银行卡信息
 *
 *  @param mobilePhone mobilePhone description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getBankNameData:(NSString *)mobilePhone identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *   红包兑换
 *
 *  @param modelId     modelId description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getExchangeRedPacketData:(NSString *)modelId identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  发送验证码（注册）
 *
 *  @param phone       phone description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getVerifyCodeForRegister:(NSString *)phone identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  检测升级
 *
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getVersionDataWithIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;


/**
 *  消息状态更新
 *
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getUpdateStatusById:(NSString *)ids withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;


/**
 *  登录App记录
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)updateAddOperRecordData:(NSString *)token identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  首页最新公告
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getNewMessage:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  首页最新公告用户相关
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getUserNewMessage:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  获取机器人分享数据
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getBannerRobot:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;


/**
 *  汇付实名认证
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getChinapnr:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;


/**
 *  汇付登录
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getLoginChinapnr:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;


/**
 *  摇一摇藏金阁数据
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getMoneyBox:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  获取我的奖品列表
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getPriceList:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  获取剩余摇奖次数
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getRestPriceAccount:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  获取藏金阁分享图片
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getSharePicture:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  发送分享数据
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)sendShareMessage:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  获取勋章分享图片
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getMedalPicture:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  特权本金/现金券列表
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getUserLuckMoneyListData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  可用红包/加息券/特权本金/返现券 数量查询
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getUserLuckBagCountData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  商城列表
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getIntegralMallListData:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 * 获取用户地址信息列表
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getUserAddress:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 * 设置为默认地址
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)setDefaultAddress:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 * 删除用户地址
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)deleteUserAddress:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 * 添加用户地址
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)addUserAddress:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 * 编辑用户地址
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)editUserAddress:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 * 获得版本记录
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getVersionListData:(NSString *)type withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  商品详情
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getGoodsInfoData:(NSString *)goodsId withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  积分兑换抽奖次数
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)sendScoreTimeData:(NSString *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  更改VIP已提示
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)sendVipTipData:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  积分兑换明细列表
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getScoreLogListData:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 *  积分兑换记录列表
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getScoreGoodsListData:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 * 兑换接口
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getGoodsConvertData:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 * 分享回调获得积分
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getGeneratorScoreData:(NSString *)nid withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 * 获得加息券数量统计
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getCouponCount:(NSString *)type withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;
    
/**
 * 获得红包数量统计
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getUserRedPacketCount:(NSString *)type withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 * 获得红包数量统计
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getBenefitBenefitCount:(NSString *)type withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 * 获得活动列表
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getActivityListData:(RequestBaseModel *)type withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;
/**
 * 获得上，深，创，指数
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getStockIndexData:(NSString *)type withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;
/**
 * 资讯列表
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getInfoListData:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 * 资讯详情列表
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getInfoDetailData:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 * 资讯推荐列表
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getInfoRecommendData:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 * 活动详情
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getActivityDetailData:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/**
 * 活动报名
 *
 *  @param token       token description
 *  @param identifier  identifier description
 *  @param resultBlock resultBlock description
 */
+ (void)getSignUpData:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

#pragma mark ----- 转赠返现券/特权本金 -----
+ (void)getDonateData:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

#pragma mark ----- 勋章专属权益 -----
+ (void)getMedalRightData:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock;

/***************************************************************************/
#pragma mark --- 取消单个网络请求 ----
+ (void)cancelRequestForIdentifier:(NSString *)identifier;

#pragma mark --- 取消所有网络请求 ----
+ (void)cancelAllRequest;

@end
