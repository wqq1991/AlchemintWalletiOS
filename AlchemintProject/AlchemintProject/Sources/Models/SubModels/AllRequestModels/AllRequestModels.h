//
//  AllRequestModels.h
//  800Bank
//
//  Created by BABAIHOLDINGS on 16/5/12.
//  Copyright © 2016年 Joe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestBaseModel.h"

@interface AllRequestModels : RequestBaseModel

@end

/**
 *  model
 */
@interface GetUtxoModel : RequestBaseModel
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *name;
@end

/**
 *  登录请求model
 */
@interface LoginReqModel : RequestBaseModel

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *platform;

@end

/**
 *  注册请求model
 */
@interface RegisterReqModel : RequestBaseModel

@property (nonatomic, strong) NSString *confirmPwd;     //确认密码
@property (nonatomic, strong) NSString *password;       //密码
@property (nonatomic, strong) NSString *phone;          //手机号
@property (nonatomic, strong) NSString *validCode;      //手机验证码
@property (nonatomic, strong) NSString *invCode;        //邀请码
@property (nonatomic, strong) NSString *activityCode;   //活动标识码
@property (nonatomic, strong) NSString *platform;       //平台标识
@property (nonatomic, strong) NSString *needImgCode;    //是否需要图形验证码
@property (nonatomic, strong) NSString *needInviteCode; //是否需要邀请码
@property (nonatomic, strong) NSString *imgCode;
@end

/**
 *  忘记密码请求model
 */
@interface ForgetPwdReqModel : RequestBaseModel

@property (nonatomic, strong) NSString *confirmPwd;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *validCode;
@end

/**
 *  热销产品请求model
 */
@interface HotProductReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *typeCategory;      //产品类型(随投随享(ppfund)、800精选(featured)，APP端写800精选)
@property (nonatomic, strong) NSString *limit;      //显示数量（默认10条数据）
@property (nonatomic, strong) NSString *start;      //页数
@end

/**
 *  资金记录请求model
 */
@interface AccountLogReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *type;       //类别：''(全部) 转入(online_recharge) 转出(cash_frost)
@property (nonatomic, strong) NSString *limit;      //每条页数
@property (nonatomic, strong) NSString *start;      //页码
@end

/**
 *  已投项目请求model
 */
@interface InvestDetailReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *flag;       //已投和已还(1,0)
@property (nonatomic, strong) NSString *limit;      //每条页数
@property (nonatomic, strong) NSString *start;      //页码
@end

/**
 *  汇付绑卡请求model
 */
@interface OnLineReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *platform;       //平台标识
@property (nonatomic, strong) NSString *money;          //充值金额
@end

/**
 *  汇付在线充值请求model
 */
@interface HFMoveInReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *money;          //充值金额
@end

/**
 *  汇付在线提现请求model
 */
@interface HFMoveOutReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *money;          //充值金额
@property (nonatomic, strong) NSString *cashType;       //提现类型 0 普通取现 1 紧急取现
@property (nonatomic, strong) NSString *isDeductScore;  //是否需要积分抵扣手续费  0 不需要 1 需要
@end

/**
 *  线上提现页面请求model
 */
@interface OnLineCashOperReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *branch;                 //支行名称
@property (nonatomic, strong) NSString *city;                   //市
@property (nonatomic, strong) NSString *code;                   //验证码
@property (nonatomic, strong) NSString *money;                  //提现金额
@property (nonatomic, strong) NSString *province;               //省
@end


/**
 *  产品列表请求model
 */
@interface ProductListReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *exclusiveCode;     //企业专享产品专用，其他产品列表传空即可
@property (nonatomic, strong) NSString *typeCategory;      //全部为空
@property (nonatomic, strong) NSString *investLimitMax;    //中文，参考表nb_product_type
@property (nonatomic, strong) NSString *investLimitMin;    //全部为空
@property (nonatomic, strong) NSString *projectState;      //0表示全部，1表示募集中，-1表示回款
@property (nonatomic, strong) NSString *limit;      //显示数量（默认10条数据）
@property (nonatomic, strong) NSString *start;      //页数
@end

/**
 *  产品详情请求model
 */
@interface ProductDetailReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *basicId;            //产品ID
@property (nonatomic, strong) NSString *typeCategory;       //产品类型属性
@property (nonatomic, strong) NSString *exclusiveCode;      //企业专享码
@end

/**
 *  零钱包赎回请求model
 */
@interface PpfundOutReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *id;             //标ID
@property (nonatomic, strong) NSString *redeemMoney;    //赎回金额
@end

/**
 *  天天盈资金记录请求model
 */
@interface ProfitListReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *limit;             //每页条数
@property (nonatomic, strong) NSString *start;             //页码
@end

/**
 *  现金类投资请求model
 */
@interface InvestOperReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *code;               //验证码
@property (nonatomic, strong) NSString *money;              //投资金额
@property (nonatomic, strong) NSString *productBasicId;     //产品id
@property (nonatomic, strong) NSString *pwd;                //企业专享ID
@property (nonatomic, strong) NSString *cids;               //加息券ID
@property (nonatomic, strong) NSString *ids;                //红包ID
@property (nonatomic, strong) NSString *sendedUserPhone;    //红包受赠手机号
@property (nonatomic, strong) NSString *cbIds;              //红包受赠手机号
@property (nonatomic, strong) NSString *pIds;               //特权本金ID
@end

/**
 *  加息券列表请求model
 */
@interface UserCouponListReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *type;     //请求类型ID
@property (nonatomic, strong) NSString *limit;     //显示数量默认10条
@property (nonatomic, strong) NSString *start;     //页数
@end

/**
 *  红包请求列表请求model
 */
@interface RedPacketListReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *type;     //请求类型ID
@property (nonatomic, strong) NSString *limit;     //显示数量默认10条
@property (nonatomic, strong) NSString *start;     //页数
@end

/**
 *  加息券列表请求model （新增接口）
 */
@interface MyRedPacketListReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *productBasicId;     //投资标的ID
@property (nonatomic, strong) NSString *investAmount;     //投资标的ID
@property (nonatomic, strong) NSString *code;     //投资标的ID
@end


/**
 *  修改登录密码请求model
 */
@interface ChangeLoginPwdReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *confirmPwd;     //确认密码
@property (nonatomic, strong) NSString *oldPwd;         //旧密码
@property (nonatomic, strong) NSString *password;       //新密码
@end

/**
 *  意见反馈请求model
 */
@interface AddNoteReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *content;     //反馈内容
@end

/**
 *  转赠加息券请求model
 */
@interface DonateCouponReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *donateMobile;     //转赠手机号
@property (nonatomic, strong) NSString *id;              //加息券ID
@end

/**
 *  转赠红包请求model
 */
@interface DonateRedPacketReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *toMobile;       //转赠手机号
@property (nonatomic, strong) NSString *id;            //加息券ID
@end

/**
 *  转赠特权本金/返现券请求model
 */
@interface PrivilegeMoneyGiveReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *toMobile;     //转赠手机号
@property (nonatomic, strong) NSString *id;           //加息券ID
@property (nonatomic, strong) NSString *type;         //转赠类型
@end

/**
 *  合同详情请求model
 */
@interface ProtocolContentReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *type;           //合同类型
@property (nonatomic, strong) NSString *id;            //投资协议ID
@end

/**
 * 消息公告
 */
@interface MsgListReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *type;       //已投和已还(1,0)
@property (nonatomic, strong) NSString *limit;      //每条页数
@property (nonatomic, strong) NSString *start;      //页码
@end

/**
 * 绑卡操作
 */
@interface BindCardReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *platform;       //已投和已还(1,0)
@property (nonatomic, strong) NSString *token;      //每条页数
@end

/**
 * 邀请记录
 */
@interface UserInviteListReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *token;      //每条页数
@property (nonatomic, strong) NSString *limit;      //每条页数
@property (nonatomic, strong) NSString *start;      //页码
@end

/**
 * 我的奖品列表
 */
@interface PriceListReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *isCache;      //是否是缓存数据(0非缓存，1缓存)
@property (nonatomic, strong) NSString *strategyCode;      //活动策略类型,必须填(机器人（AV-ROBOT），摇一摇（AV-SHAKE）)
@property (nonatomic, strong) NSString *limit;      //结束行（显示数量）
@property (nonatomic, strong) NSString *start;      //起始行
@end

/**
 * 剩余抽奖机会
 */
@interface RestPriceAccountReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *strategyCode;      //活动策略类型（机器人（AV-ROBOT），摇一摇（AV-SHAKE））
@end

/**
 * 分享接口
 */
@interface ShareImageReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *shareImgUrl;      //分享图片地址
@property (nonatomic, strong) NSString *shareState;      //分享状态（默认成功）
@property (nonatomic, strong) NSString *shareType;      //分享平台
@end

/**
 * 返现券/特权本金列表请求
 */
@interface PrivilegeMoneyReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *start;        //页码
@property (nonatomic, strong) NSString *limit;           //每页大小
@property (nonatomic, strong) NSString *investAmount;   //投资金额
@property (nonatomic, strong) NSString *proId;          //产品ID
@property (nonatomic, strong) NSString *type;           //列表类型
@property (nonatomic, strong) NSString *useStatus;      //使用状态
@end

/**
 * 用户可用红包、加息券、返现券、特权本金数量查询
 */
@interface LuckBagCountReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *investAmount;      //投资金额
@property (nonatomic, strong) NSString *proId;             //产品ID
@property (nonatomic, strong) NSString *code;             //
@end

/**
 *  商场列表请求model
 */
@interface MallListReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *limit;     //显示数量默认10条
@property (nonatomic, strong) NSString *start;     //页数
@end

/**
 *  积分兑换请求请求model
 */
@interface ScoreLogReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *limit;     //显示数量默认10条
@property (nonatomic, strong) NSString *start;     //页数
@property (nonatomic, strong) NSString *paymentsType;  //0是不变 1是收入 2是支出 不传默认查询1,2
@end

/**
 *  添加用户地址信息请求model
 */
@interface AddUserAddressReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *limit;     //显示数量默认10条
@property (nonatomic, strong) NSString *start;     //页数
@property (nonatomic, strong) NSString *address;  //用户地址
@property (nonatomic, strong) NSString *courierName;  //收件名称
@property (nonatomic, strong) NSString *isDefault;  //是否为默认地址
@property (nonatomic, strong) NSString *postCode;  //邮编
@property (nonatomic, strong) NSString *telphone;  //手机号码
@end

/**
 *  编辑用户地址信息请求model
 */
@interface EditUserAddressReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *limit;     //显示数量默认10条
@property (nonatomic, strong) NSString *start;     //页数
@property (nonatomic, strong) NSString *address;    //用户地址
@property (nonatomic, strong) NSString *courierName;  //收件名称
@property (nonatomic, strong) NSString *id;           //编号
@property (nonatomic, strong) NSString *isDefault;  //是否为默认地址
@property (nonatomic, strong) NSString *postCode;  //邮编
@property (nonatomic, strong) NSString *telphone;  //手机号码
@end

/**
 *  获取用户地址信息请求model
 */
@interface GetUserAddressReqModel : RequestBaseModel
@end

/**
 *  积分兑换明细请求请求model
 */
@interface ScoreGoodsReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *limit;     //显示数量默认10条
@property (nonatomic, strong) NSString *start;     //页数
@end

/**
 *  积分兑换请求请求model
 */
@interface GoodsConvertReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *convertNum;     //兑换数量
@property (nonatomic, strong) NSString *id;             //请求的ID
@end
/**
 *  活动列表请求请求model
 */
@interface ActivityListReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *current;     //兑换数量
@property (nonatomic, strong) NSString *size;             //请求的ID
@end

/**
 *  咨询列表请求请求model
 */
@interface InfoListReqModel : RequestBaseModel
@property (nonatomic, strong) NSString *current;     //显示数量默认100条
@property (nonatomic, strong) NSString *size;     //页数
@property (nonatomic, strong) NSString *classify;  //xbj：新八君，rzh：仁智汇，qkl：区块链。空值默认全部
@end
