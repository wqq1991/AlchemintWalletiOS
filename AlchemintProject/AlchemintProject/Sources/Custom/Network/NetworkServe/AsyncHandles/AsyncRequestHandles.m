/********************************************************************
 文件名称 :  AsyncHandles.m 文件
 作   者 : WuQiaoqiao
 创建时间 :15/4/29.
 文件描述 : 类
 ********************************************************************/
#import "Parameter.h"
#import "AsyncRequestHandles.h"

#import "ResponseHandle.h"
#import "ErrandManager.h"
#import "TaskSack.h"

#import "ModelsHandle.h"
#import "RequestHandle.h"
//#import "RootTabBarViewController.h"
//#import "CustomNavigationController.h"
//Models
//#import "AllRequestModels.h"
//#import "AllResponseModel.h"

@interface AsyncRequestHandles ()
//<UIAlertViewDelegate>
{

}
@end

@implementation AsyncRequestHandles

#pragma mark ---- 举个栗子 -----
+ (void)getDataStockNo:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model
                      identifier:identifier
                       callBlock:resultBlock
                           chars:identifier
                          handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic)
     {
         NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
         
         NSString *responseStr = [[NSString alloc] initWithData:responseUtil.responseData encoding:enc];
         
         responseUtil.responseJson = responseStr;
         
         return responseUtil;
     }];
}

#pragma mark ----------------------------------------- 登录注册模块 ----------------------------------------------------

/*
#pragma mark ---- 手机号验证 -----
+ (void)getLoginBeforeData:(NSString *)phone identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
  
        [AsyncRequestHandles hanedle:phone identifier:identifier callBlock:resultBlock chars:@"user/exits/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
            
            return responseUtil;
        }];
}

#pragma mark ---- 用户登录 -----
+ (void)getLoginData:(RequestBaseModel *)model dentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {

    [AsyncRequestHandles hanedle:model
                      identifier:identifier
                       callBlock:resultBlock
                           chars:@"login/doLogin"
                          handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic)
     {
         
         return responseUtil;
     }];
}

#pragma mark ---- 发送验证码（注册） -----
+ (void)getVerifyCodeForRegister:(NSString *)phone identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:phone identifier:identifier callBlock:resultBlock chars:@"user/sms/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ---- 发送验证码（忘记密码） -----
+ (void)getVerifyCode:(NSString *)phone identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {

    [AsyncRequestHandles hanedle:phone identifier:identifier callBlock:resultBlock chars:@"user/forget/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ---- 用户注册 -----
+ (void)getRegisterData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model
                      identifier:identifier
                       callBlock:resultBlock
                           chars:@"user/doRegister"
                          handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ---- 检测邀请人是否存在 -----
+ (void)getExitsInvCodeData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model
                      identifier:identifier
                       callBlock:resultBlock
                           chars:@"user/exitsInvCode/"
                          handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
                              
                              return responseUtil;
                          }];
}

#pragma mark ---- 忘记密码 -----
+ (void)getForgetPwd:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"user/forget/LoginPwd" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ---- 修改登录密码 -----
+ (void)changedLoginPwd:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"user/doChangeLoginPwd" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ---- 修改交易密码 -----
+ (void)changedPayPwd:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"user/doChangePayPwd" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ---- 更新DeviceToken -----
+ (void)updateDeviceTokenData:(NSString *)token identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:token identifier:identifier callBlock:resultBlock chars:@"user/updateDeviceId/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ----------------------------------------- 首页和产品列表 ----------------------------------------------------

#pragma mark ---- 首页Banner -----
+ (void)getBannerData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"banner/showBanners/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
            responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:nil class:[ADBannerResModel class]];
    
        return responseUtil;
    }];
}

#pragma mark ---- 启动广告页 -----
+ (void)getAdData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"banner/showBanners/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
            responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:responseUtil.responseJson listKey:@"result" class:[AdvertisementResModel class]];
   
        return responseUtil;
    }];
}

#pragma mark ---- 首页列表产品数据（热销榜） -----
+ (void)getHotProductsData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"product/showHotProducts" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"rows" class:[ProductResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 产品列表 -----
+ (void)getProductListData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"product/showProducts" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"rows" class:[ProductResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 产品详情 -----
+ (void)getProductDetailData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"product/showProductDetail" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[ProductResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 购买产品发送验证码 -----
+ (void)getBuyVerifyCode:(NSString *)phone identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:phone identifier:identifier callBlock:resultBlock chars:@"invest/sms/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ---- 现金类投资/订单提交 -----
+ (void)getInvestOper:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"invest/investOper" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[HFSubmitOrdertResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 可用加息券 -----
+ (void)getCouponList:(NSString *)flagId identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:flagId identifier:identifier callBlock:resultBlock chars:@"coupon/couponList/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:nil class:[UserCouponListResModel class]];
        
        return responseUtil;
    }];
}

#pragma mark ---- 可用红包 -----
+ (void)getRedPacketList:(NSString *)flagId identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:flagId identifier:identifier callBlock:resultBlock chars:@"redPacket/redPacketList" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        NSArray *tempArr1 = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"notRecommendRedPacket" class:[UserRedPackeResModel class]];
        NSArray *tempArr2 = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"recommendRedPacket" class:[UserRedPackeResModel class]];
        
        responseUtil.responseResult = [tempArr1 arrayByAddingObjectsFromArray:tempArr2];
        
        return responseUtil;
    }];
}

#pragma mark ---- 合同详情 -----
+ (void)getProtocolContent:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"user/protocolContent" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ---- 产品详情图片(项目介绍) -----
+ (void)getProductContent:(NSString *)basicId identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:basicId identifier:identifier callBlock:resultBlock chars:@"product/productContent/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ---- 推荐收益 -----
+ (void)getInviteEarnings:(RequestBaseModel *)basicId identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:basicId identifier:identifier callBlock:resultBlock chars:@"user/inviteEarnings" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:nil class:[InviteEarningsResModel class]];
        return responseUtil;
    }];
}

#pragma mark ----------------------------------------- 用户中心模块 ----------------------------------------------------

#pragma mark ---- 我的信息 -----
+ (void)getMemberCenterData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {

    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"member/center" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
             responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[MemberCenterResModel class]];
       
        return responseUtil;
    }];
}

#pragma mark ---- 资金记录 -----
+ (void)getAccountLogData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"member/accountLog" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"rows" class:[AccountLogResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 已投项目(已投和已还款) -----
+ (void)getInvestDetailData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"member/investDetail" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"rows" class:[InvestResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 零钱包账户中心 -----
+ (void)getMemberPpfundData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"member/ppfund" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[WalletCenterResModel class]];
        
        return responseUtil;
    }];
}

#pragma mark ---- 零钱包在投记录 -----
+ (void)getUserSearchData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"member/ppfund/detail/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"rows" class:[PpfundResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 天天盈资金记录 -----
+ (void)getProfitListData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"ppfund/pfundEarnings/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"rows" class:[ProfitListResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 零钱包赎回 -----
+ (void)getPpfundOutData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"ppfund/ppfundOut" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ----  加息券列表 -----
+ (void)getUserCouponListData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"coupon/showUserCouponList" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"rows" class:[UserCouponListResModel class]];
        return responseUtil;
    }];
}

#pragma mark ----  现金券列表 -----
+ (void)getUserRedPacketListData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"redPacket/showUserRedPacketList" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"rows" class:[RedPacketResModel class]];
        return responseUtil;
    }];
}

#pragma mark ----  特权本金/现金券列表 -----
+ (void)getUserLuckMoneyListData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"benefit/benefitList" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"list" class:[PrivilegeMoneyListResModel class]];
        return responseUtil;
    }];
}

#pragma mark ----  可用红包/加息券/特权本金/返现券 数量查询 -----
+ (void)getUserLuckBagCountData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"benefit/countData" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[LuckBagCountResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 我的可用红包列表(新接口) -----
+ (void)getMyRedPacketListData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock{

    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"redPacket/redPacketListNew" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"recommendRedPacket" class:[NewUserRedPackeResModel class]];
        
        return responseUtil;
    }];
}

#pragma mark ---- 我的可用加息券列表(新接口) -----
+ (void)getMyCouponListData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock{
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"coupon/couponListNew" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"" class:[NewCouponListResModel class]];
        
        return responseUtil;
    }];
}

#pragma mark ----  加息券转赠 -----
+ (void)getDonateUserCouponData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"coupon/donateUserCoupon" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ----  红包转赠 -----
+ (void)getDonateUserRedPacketData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"redPacket/donateUserRedPacket" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
         
        return responseUtil;
    }];
}

#pragma mark ----  红包兑换 -----
+ (void)getExchangeRedPacketData:(NSString *)modelId identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:modelId identifier:identifier callBlock:resultBlock chars:@"redPacket/exchangeRedPacket/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ----  消息公告列表 -----
+ (void)getUserMessagesListData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"user/showUserMessages/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"rows" class:[UserMessagesResModel class]];
        return responseUtil;
    }];
}

#pragma mark ----  邀请记录列表 -----
+ (void)getUserInviteListData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"user/userInviteList" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"rows" class:[UserInviteResModel class]];
        return responseUtil;
    }];
}

#pragma mark ----  红包记录列表 -----
+ (void)getUserRedPacketData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"user/userRedPacketList" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:nil class:[UserRedPackeResModel class]];
        return responseUtil;
    }];
}

#pragma mark ----  意见反馈 -----
+ (void)UpdateMemberAddNoteData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"member/addNote" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ----  资产详情 -----
+ (void)getAssetDetailsData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"member/assetDetails" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[AssetDetailsResModel class]];
        return responseUtil;
    }];
}

#pragma mark ----  邀请页面(邀请好友个数等) -----
+ (void)getUserInvitePage:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"user/userInvitePage" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ---- 获取银行卡额度 -----
+ (void)getQuerySupportBank:(NSString *)bankCode identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:bankCode identifier:identifier callBlock:resultBlock chars:@"recharge/querySupportBank/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
//        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[SupportBankMoneyResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 获取用户地址信息列表 -----
+ (void)getUserAddress:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"userAddress/queryUserAddress" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:nil class:[AddressResModel class]];
        
        return responseUtil;
    }];
}

#pragma mark ----设置为默认地址 -----
+ (void)setDefaultAddress:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"userAddress/setDeafultAddress/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        return responseUtil;
    }];
}

#pragma mark ----删除用户地址 -----
+ (void)deleteUserAddress:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"userAddress/deleteUserAddress/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        return responseUtil;
    }];
}

#pragma mark ----添加用户地址 -----
+ (void)addUserAddress:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"userAddress/saveUserAddress" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        return responseUtil;
    }];
}

#pragma mark ----编辑用户地址 -----
+ (void)editUserAddress:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"userAddress/editUserAddress" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        return responseUtil;
    }];
}


#pragma mark -----------------------------------------  支付模块   ----------------------------------------------------

#pragma mark ---- 在线充值 -----
+ (void)getOnLineRechargeOperData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"recharge/onLineRechargeOper" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        if ([[responseUtil.responseJson objectForKey:@"code"] integerValue] == [kResponseSuccessfulCode integerValue] && [dic isKindOfClass:[NSDictionary class]]) {
            
           responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[OnLineRechargeOperResModel class]];
        }
        
        return responseUtil;
    }];
}

#pragma mark ---- 汇付在线充值页面 -----
+ (void)getOnLineRechargePageData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"recharge/onLineRechargePage" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        OnLineRechargePageResModel *model = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[OnLineRechargePageResModel class]];
        model.bankModel = [ResponseHandle objectWithPropertiesOfdictionary:[dic objectForKey:@"bankModel"] class:[BankResModel class]];
        responseUtil.responseResult = model;

        return responseUtil;
    }];
}

#pragma mark ---- 绑卡操作 -----
+ (void)getChinapnrBindCardOper:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"bank/chinapnrBindCardOper" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[HFBindCardResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 获取短信验证码（绑定银行卡） -----
+ (void)getAddBankCode:(NSString *)mobilePhone identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:mobilePhone identifier:identifier callBlock:resultBlock chars:@"recharge/getAddBankCode/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ---- 获取银行卡信息 -----
+ (void)getBankNameData:(NSString *)mobilePhone identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:mobilePhone identifier:identifier callBlock:resultBlock chars:@"recharge/getBankInfo/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:nil class:[BankCardResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 获取银行卡信息 -----
+ (void)getBankInfo:(NSString *)bankNo identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:bankNo identifier:identifier callBlock:resultBlock chars:@"recharge/bankInfo/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:nil class:[BankCardResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 在线提现 -----
+ (void)getOnLineCashOperData:(RequestBaseModel *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"cash/onLineCashOper" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[HFMoveOutResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 在线提现页面 -----
+ (void)getOnLineCashPageData:(NSString *)model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"cash/onLineCashPage" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        OnLineRechargePageResModel *model = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[OnLineRechargePageResModel class]];
        model.bankModel = [ResponseHandle objectWithPropertiesOfdictionary:[dic objectForKey:@"bankModel"] class:[BankResModel class]];
        responseUtil.responseResult = model;
        return responseUtil;
    }];
}

#pragma mark ---- 提现手机验证码 -----
+ (void)getCashMsg:(NSString *)phone identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:phone identifier:identifier callBlock:resultBlock chars:@"cash/sms/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}


#pragma mark ---- 已投项目详情 -----
+ (void)getSubInvestDetai:(NSString *)relatedId identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:relatedId identifier:identifier callBlock:resultBlock chars:@"member/subInvestDetail/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[InvestDetailResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 检测升级 -----
+ (void)getVersionDataWithIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:@"" identifier:identifier callBlock:resultBlock chars:@"res/getIsUpdate" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[CheckVersionResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 消息状态更新 -----
+ (void)getUpdateStatusById:(NSString *)ids withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:ids identifier:identifier callBlock:resultBlock chars:@"user/updateStatusById/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
         
        return responseUtil;
    }];
}

#pragma mark ---- 登录App记录 -----
+ (void)updateAddOperRecordData:(NSString *)token identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:token identifier:identifier callBlock:resultBlock chars:@"login/addOperRecord" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ---- 首页最新公告 -----
+ (void)getNewMessage:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:msg identifier:identifier callBlock:resultBlock chars:@"res/getNewMessage" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
         responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[UserMessagesResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 首页最新公告用户相关 -----
+ (void)getUserNewMessage:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:msg identifier:identifier callBlock:resultBlock chars:@"user/getUserNewMessage" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[UserMessagesResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 获取机器人分享数据 -----
+ (void)getBannerRobot:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:msg identifier:identifier callBlock:resultBlock chars:@"banner/showBanners/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
            responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:responseUtil.responseJson listKey:@"result" class:[ADBannerResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 获取摇一摇藏金阁数据 -----
+ (void)getMoneyBox:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"api/prize/save" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[MoneyBoxResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 发送分享数据 -----
+ (void)sendShareMessage:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"api/prize/shareSave" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = dic;
        return responseUtil;
    }];
}

#pragma mark ---- 获取藏金阁分享图片 -----
+ (void)getSharePicture:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:msg identifier:identifier callBlock:resultBlock chars:@"api/prize/shareFile" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        SharePictureResModel *model = [[SharePictureResModel alloc] init];
        model.result = (NSString *)dic;
        responseUtil.responseResult = model;
//        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[SharePictureResModel class]];
        return responseUtil;
    }];
}

#pragma mark ----- 更改VIP已提示 -----
+ (void)sendVipTipData:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:msg identifier:identifier callBlock:resultBlock chars:@"user/updateVipPrompt" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ---- 获取勋章分享图片 -----
+ (void)getMedalPicture:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:msg identifier:identifier callBlock:resultBlock chars:@"user/exclusiveShareFile" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        MedalPictureResModel *model = [[MedalPictureResModel alloc] init];
        model.result = (NSString *)dic;
        responseUtil.responseResult = model;
        return responseUtil;
    }];
}

#pragma mark ---- 获取剩余摇奖次数 -----
+ (void)getRestPriceAccount:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"api/prize/count" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[RestPriceAccountResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 获取我的奖品列表 -----
+ (void)getPriceList:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"api/prize/myList" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        PriceListResModel *priceListResModel = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[PriceListResModel class]];

        priceListResModel.prizeList = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"prizeList" class:[PriceListDetailResModel class]];
        responseUtil.responseResult = priceListResModel;
        return responseUtil;
    }];
}

#pragma mark ---- 汇付实名认证 -----
+ (void)getChinapnr:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:msg identifier:identifier callBlock:resultBlock chars:@"user/chinapnr/doRegister" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[CertificationResModel class]];
        return responseUtil;
    }];
}

#pragma mark ---- 汇付登录 -----
+ (void)getLoginChinapnr:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:msg identifier:identifier callBlock:resultBlock chars:@"/user/chinapnr/doLogin" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[LoginChinapnrResModel class]];
        return responseUtil;
    }];
}

#pragma mark ----- 转赠返现券/特权本金 -----
+ (void)getDonateData:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"benefit/benefitDonate" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ----- 勋章专属权益 -----
+ (void)getMedalRightData:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:msg identifier:identifier callBlock:resultBlock chars:@"res/rules/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[MedalRightResModel class]];
        return responseUtil;
    }];
}

#pragma mark ----- 商城列表 -----
+ (void)getIntegralMallListData:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"goods/list" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        NSArray *rowsDicArray = [dic objectForKey:@"rows"];
        
        NSMutableArray *resModels = [NSMutableArray array];
        
        for (NSInteger i = 0; i < rowsDicArray.count; i++) {
            
            NSDictionary *goodsResDic = rowsDicArray[i];
            
            GoodsResModel *resModel = [ResponseHandle objectWithPropertiesOfdictionary:goodsResDic class:[GoodsResModel class]];
            
            resModel.categoryIdModel = [ResponseHandle objectWithPropertiesOfdictionary:[goodsResDic objectForKey:@"categoryId"] class:[GoodsCategoryIdModel class]];
            resModel.goodsPicModels = [ResponseHandle arrayWithPropertiesOfdictionary:goodsResDic listKey:@"goodsPic" class:[GoodsPicModel class]];
            
            [resModels addObject:resModel];
        }
        
        responseUtil.responseResult = resModels;
        
        return responseUtil;
    }];
}

#pragma mark ----- 商品详情 -----
+ (void)getGoodsInfoData:(NSString *)goodsId withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:goodsId identifier:identifier callBlock:resultBlock chars:@"goods/Info/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
            
            GoodsResModel *resModel = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[GoodsResModel class]];
            
            resModel.categoryIdModel = [ResponseHandle objectWithPropertiesOfdictionary:[dic objectForKey:@"categoryId"] class:[GoodsCategoryIdModel class]];
            resModel.goodsPicModels = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"goodsPic" class:[GoodsPicModel class]];
        
            responseUtil.responseResult = resModel;
        
        return responseUtil;
    }];
}

#pragma mark ----- 积分兑换抽奖次数-----
+ (void)sendScoreTimeData:(NSString *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"api/prize/convertPrizeNum" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ----- 积分兑换明细列表 -----
+ (void)getScoreLogListData:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"scoreLog/queryScoreLog" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"rows" class:[ScoreLogResModel class]];
        
        return responseUtil;
    }];
}

#pragma mark ----- 积分兑换记录列表 -----
+ (void)getScoreGoodsListData:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"goods/scoreGoodsList" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"rows" class:[ScoreGoodsResModel class]];
        
        return responseUtil;
    }];
}

#pragma mark ----- 兑换接口 -----
+ (void)getGoodsConvertData:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"goods/convert/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ----- 分享回调获得积分 -----
+ (void)getGeneratorScoreData:(NSString *)nid withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:nid identifier:identifier callBlock:resultBlock chars:@"share/generatorScore/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        return responseUtil;
    }];
}

#pragma mark ----- 获得加息券数量统计 -----
+ (void)getCouponCount:(NSString *)type withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:type identifier:identifier callBlock:resultBlock chars:@"coupon/getCouponCount/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[CouponCountResModel class]];
        
        return responseUtil;
    }];
}

#pragma mark ----- 获得红包数量统计 -----
+ (void)getUserRedPacketCount:(NSString *)type withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:type identifier:identifier callBlock:resultBlock chars:@"redPacket/getUserRedPacketCount/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[CouponCountResModel class]];
        
        return responseUtil;
    }];
}

#pragma mark ----- 获得返现券和特权本金数量统计 -----
+ (void)getBenefitBenefitCount:(NSString *)type withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:type identifier:identifier callBlock:resultBlock chars:@"benefit/getBenefitCount/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[BenefitCountResModel class]];
        
        return responseUtil;
    }];
}

#pragma mark ----- 获得版本记录 -----
+ (void)getVersionListData:(NSString *)type withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:type identifier:identifier callBlock:resultBlock chars:@"res/sysVersionList/2" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        if ([dic isKindOfClass:[NSArray class]]) {
            NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:dic.count];
            
            for (NSDictionary *dicModel in dic) {
                
                VersionListResModel *model = [ResponseHandle objectWithPropertiesOfdictionary:dicModel class:[VersionListResModel class]];
                
                [tempArray addObject:model];
            }
           responseUtil.responseResult = tempArray;
        }
 
        return responseUtil;
    }];
}

#pragma mark ----- 活动列表 -----
+ (void)getActivityListData:(RequestBaseModel *)type withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:type identifier:identifier callBlock:resultBlock chars:@"activity/list/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"list" class:[ActivityResModel class]];
        
        return responseUtil;
    }];
}

#pragma mark ----- 资讯列表 -----
+ (void)getInfoListData:(RequestBaseModel *)model withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:model identifier:identifier callBlock:resultBlock chars:@"cms/information/list" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle arrayWithPropertiesOfdictionary:dic listKey:@"list" class:[InfoListResModel class]];
        
        return responseUtil;
    }];
}

#pragma mark ----- 资讯详情列表 -----
+ (void)getInfoDetailData:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:msg identifier:identifier callBlock:resultBlock chars:@"cms/information/detail/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[InfoListResModel class]];
        
        return responseUtil;
    }];
}

#pragma mark ----- 资讯推荐列表 -----
+ (void)getInfoRecommendData:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:msg identifier:identifier callBlock:resultBlock chars:@"cms/information/recommend/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        if ([dic isKindOfClass:[NSArray class]]) {
            
            NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:dic.count];
            
            for (NSDictionary *dicModel in dic) {
                
                VersionListResModel *model = [ResponseHandle objectWithPropertiesOfdictionary:dicModel class:[InfoListResModel class]];
                
                [tempArray addObject:model];
            }
            responseUtil.responseResult = tempArray;
        }
        
        return responseUtil;
    }];
}

#pragma mark ----- 活动详情 -----
+ (void)getActivityDetailData:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:msg identifier:identifier callBlock:resultBlock chars:@"activity/queryById/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
        
        responseUtil.responseResult = [ResponseHandle objectWithPropertiesOfdictionary:dic class:[ActivityResModel class]];
        return responseUtil;
    }];
}

#pragma mark ----- 活动报名 -----
+ (void)getSignUpData:(NSString *)msg withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
    [AsyncRequestHandles hanedle:msg identifier:identifier callBlock:resultBlock chars:@"activity/signUp/" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
          
        return responseUtil;
    }];
}

#pragma mark ----- 获得上，深，创，指数 -----
+ (void)getStockIndexData:(NSString *)type withIdentifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock {
    
//    [AsyncRequestHandles hanedle:type identifier:identifier callBlock:resultBlock chars:@"http://hq.sinajs.cn/list=" handle:^ResponseUtil *(ResponseUtil *responseUtil, NSDictionary *dic) {
    
        
        FinishBlock successfulBlock = ^(ResponseUtil *responseUtil) {
            
            NSDictionary *dic = responseUtil.responseJson;
            
            [ResponseHandle responseOfMessage:responseUtil dic:dic];
            
            
            if ([ResponseHandle responseOfResult:dic]) {
                
                id value = [dic objectForKey:@"result"];
                
                // 判断是否为空串
                if ([value isEqual:[NSNull null]] || [value isKindOfClass:[NSNull class]] || value == nil) {
                    
                    value = nil;
                    
                }else
                {
                    
                }
                return YES;
            }else
            {
                return NO;
            }
        };
        
        FailBlock failBlock = ^(ResponseUtil *responseUtil) {
            
        };
        
        NSString *ipUrl = [@"http://hq.sinajs.cn/list=" stringByAppendingString:type];
        
        TaskSack *taskSack = [TaskSack taskOfIpUrl:ipUrl
                                           IpParam:type
                                       ResultBlock:resultBlock
                                      SuccessBlock:successfulBlock
                                         FailBlock:failBlock
                                        Identifier:identifier
                                       RequestType:REQUEST_HTTP_GET];
        
        [[ErrandManager shareInstance] addAsyncToQueue:taskSack];
    
}

#pragma mark ----------------------------------------- 用户中心模块 ----------------------------------------------------

#pragma mark ----------------------------------------- 用户中心模块 ----------------------------------------------------
*/
#pragma mark ----------------------------------------- 业务处理封装 ----------------------------------------------------

+ (void)hanedle:(id )model identifier:(NSString *)identifier callBlock:(ResultBlock )resultBlock chars:(NSString *)chars handle:(HandleBlock )block{

    FinishBlock successfulBlock = ^(ResponseUtil *responseUtil) {
        
        NSDictionary *dic = responseUtil.responseJson;
        
        [ResponseHandle responseOfMessage:responseUtil dic:dic];
        
        static NSUInteger tempMark = 0;
        
//        if ([responseUtil.respCode isEqualToString:@"430"]) {
//
//            [RFMemberCenterDataManager sharedManager].loginMember = nil;
//            [[RFMemberCenterDataManager sharedManager] saveLoginMemberData];
//        }
        
//        if ([responseUtil.respCode isEqualToString:@"430"] && [responseUtil.respDesc rangeOfString:@"已强制下线"].location != NSNotFound && tempMark == 0) {
//
//            tempMark++;
//
//            [RFMemberCenterDataManager sharedManager].loginMember = nil;
//            [[RFMemberCenterDataManager sharedManager] saveLoginMemberData];
//
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"安全提醒"
//                                                            message:responseUtil.respDesc
//                                                           delegate:self
//                                                  cancelButtonTitle:@"确定"
//                                                  otherButtonTitles:nil, nil];
//            [[UIView appearance] setTintColor:RGB(31, 32, 33)];
//            [alert show];
//            }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            tempMark = 0;
        });
        
        
        if ([ResponseHandle responseOfResult:dic]) {
            
            id value = [dic objectForKey:@"result"];
            
            // 判断是否为空串
            if ([value isEqual:[NSNull null]] || [value isKindOfClass:[NSNull class]] || value == nil) {
                
                value = nil;
                
                responseUtil = block(responseUtil,value);
            }else
            {
                responseUtil = block(responseUtil,[dic objectForKey:@"result"]);
            } 
            return YES;
        }else
        {
            return NO;
        }
    };
    
    FailBlock failBlock = ^(ResponseUtil *responseUtil) {
        
    };
    
    NSString *ipUrl = [kServerAddress stringByAppendingString:chars];
    
    NSString *parameters = nil;
    
    REQUEST_TYPE type;
    
    if ([model isKindOfClass:[RequestBaseModel class]]) {
        
        type = REQUEST_HTTP_POST;
        parameters = [RequestHandle parameterFormMode:model];
        
    }else if([model isKindOfClass:[NSString class]])
    {
        type = REQUEST_HTTP_GET;
        parameters = model;
    }
    
    DLog(@"\n\n******************************************\nIP:%@\n参数:%@\n******************************************\n\n",ipUrl,parameters);
    
    TaskSack *taskSack = [TaskSack taskOfIpUrl:ipUrl
                                       IpParam:parameters
                                   ResultBlock:resultBlock
                                  SuccessBlock:successfulBlock
                                     FailBlock:failBlock
                                    Identifier:identifier
                                   RequestType:type];
    
    [[ErrandManager shareInstance] addAsyncToQueue:taskSack];
}

/************************************************************************************************************/

#pragma mark --- 取消单个网络请求 ----
+ (void)cancelRequestForIdentifier:(NSString *)identifier {
  
    [[ErrandManager shareInstance] cancelRequestOfRequestId:identifier];
}

#pragma mark --- 取消所有网络请求 ----
+ (void)cancelAllRequest {

    [[ErrandManager shareInstance] cancelAllRequests];
}

 /*
+ (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    [[UIView appearance] setTintColor:nil];
    
    RootTabBarViewController *rootTbVC = (RootTabBarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    CustomNavigationController *custNvc = rootTbVC.viewControllers[rootTbVC.selectedIndex];
    
    [custNvc popToRootViewControllerAnimated:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        rootTbVC.selectedIndex = 3;
        
    });
    
}
*/

@end
