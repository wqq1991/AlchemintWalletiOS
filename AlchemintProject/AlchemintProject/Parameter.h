//
//  Parameter.h
//  800Bank
//
//  Created by Joe on 16/5/4.
//  Copyright © 2016年 Joe. All rights reserved.
//

#ifndef Parameter_h
#define Parameter_h

#import <Foundation/Foundation.h>

#define kServerAddress @""

//手势密码设置类型.
typedef NS_ENUM(NSUInteger, GesLockType) {
    setLockType = 0,
    unLockType,
//    unTouchIdLockType,
    cancelGesLockType,
//    cancelTouchIdLockType,
    resetGesLockType
};

//登录类型
typedef NS_ENUM(NSUInteger, LoginType) {
    
    NomalLoginType,
    ForgetGesPwdLoginType
};

typedef NS_ENUM(NSUInteger, HFFinishState) {

    FINISH_SUCCESSFUL,
    FINISH_FAIL,
    FINISH_OTHER,
};

// 特权福利VIP类型
typedef enum {
    kVIPTypeNormal,
    kVIPTypeGold,
    kVIPTypePlatinum,
    kVIPTypeDiamond
} VipType;

//----------------------Debug Log----------------------
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

//----------------------系统---------------------------
//系统识别
#define IsIos7      [[UIDevice currentDevice].systemVersion floatValue] >= 7.0 ? YES : NO

#define IsIos8      [[UIDevice currentDevice].systemVersion floatValue] >= 8.0 ? YES : NO

#define IsIos9      [[UIDevice currentDevice].systemVersion floatValue] >= 9.0 ? YES : NO

#define IsIos11      [[UIDevice currentDevice].systemVersion floatValue] >= 11.0 ? YES : NO

#define kVersion    [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]


//屏幕高和宽
#define ScreenHeight ([UIScreen mainScreen].applicationFrame.size.height)
#define ScreenWidth ([UIScreen mainScreen].applicationFrame.size.width)

//------------------------设备识别------------------------
#define iPhone4               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(640, 960), \
[[UIScreen mainScreen] currentMode].size) : \
NO)

#define iPhone5               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(640, 1136), \
[[UIScreen mainScreen] currentMode].size) : \
NO)

#define iPhone6               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(750, 1334), \
[[UIScreen mainScreen] currentMode].size) : \
NO)

#define iPhone6Plus           [[NSString getCurrentDeviceModel] isEqualToString:@"iPhone6Plus"] ? YES : NO

#define iPhoneX               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(1125, 2436), \
[[UIScreen mainScreen] currentMode].size) : \
NO)

#define zoomRate ([[UIScreen mainScreen] bounds].size.width / 375.0f)

#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)

//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//带有RGBA的颜色设置
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

//UI色调
#define __Color_Comm_Proj_Main UIColorFromRGB(0xAE8F48) //项目主色调

#define __Color_Comm_Label_Title UIColorFromRGB(0xCCCCCC) //页面背景公共颜色

#define __Color_Comm_BgView_Default UIColorFromRGB(0x808080) //label主要公共颜色1

#define __Color_Comm_DivisionLine RGB(199, 201, 204) //分割线公共颜色

//----------------------项目配置---------------------------
#define  kBackButtonFontSize 13.0f //返回按钮字体大小
#define  kNavTitleFontSize 18.0f   //导航栏标题字体大小
static NSString *const kBackItemImageName = @"backItemImage";
static NSString *const kBackItemImageName2 = @"backItemImage2";

#define vipLevelTitles @[@"普通",@"黄金",@"铂金",@"钻石"]

//----------------------通知----------------------
//Notification 
static NSString *const kLoginViewViewNotification = @"kLoginViewViewNotificationKey";
static NSString *const kShowPatterLockViewWithNotification = @"kShowPatterLockViewWithNotificationKey";
static NSString *const kDidUnLockGesNotification = @"kDidUnLockGesNotificationKey";
static NSString *const kGoBackWalletNotification = @"kGoBackWalletNotificationKey";
static NSString *const kLoginStateChangedNotification = @"kLoginStateChangedNotificationKey";
static NSString *const kReceivedNotification = @"kReceivedNotificationKey";
static NSString *const kAddBankCardViewNotification = @"kAddBankCardViewNotificationKey";
static NSString *const kHomeBannerRefreshNotification = @"kHomeBannerRefreshNotificationKey";
static NSString *const kIsLoginRefreshNotification = @"kIsLoginRefreshNotificationKey";
static NSString *const kHidePatternLockViewNotification = @"HidePatternLockViewNotificationKey";
static NSString *const KActivityExperienceGoldNotification = @"KActivityExperienceGoldNotificationKey";
static NSString *const kWillEnterBackgroundDismisAlertViewNotification = @"kWillEnterBackgroundDismisAlertViewNotificationKey";
static NSString *const kNavigationViewControllersChangedNotification = @"kNavigationViewControllersChangedNotificationKey";

//文件存储Key名
#define DOCUMENTS_FOLDER [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/"]
static NSString *const kProductImagesDir = @"ProductImages";
static NSString *const kUserImagesDir = @"UserImages";
static NSString *const kUserDataFile = @"UserDataFile";
static NSString *const kIsGestureAuthed = @"IsGestureAuthed";
static NSString *const kTempRedPacketNum = @"TempRedPacketNumKey";
static NSString *const kIsFirstOpenTouchId = @"IsFirstOpenTouchIdKey2";
static NSString *const kIsHideMedalDeclaretion = @"kIsHideMedalDeclaretion"; // 是否显示勋章宣导页
static NSString *const kIsHideVIPDeclaretion = @"kIsHideVIPDeclaretion"; // 是否显示会员宣导页
static NSString *const kCallCenterViewFrameRem = @"kCallCenterViewFrameRemKey";
static NSString *const kCallCenterViewIsShow = @"kCallCenterViewIsShowKey";
static NSString *const kShowHomeMaskView = @"kShowHomeMaskViewKey";

static NSString *const kReminderMaskViewIsHidden = @"reminderMaskView2IsHiddenKey";
static NSString *const kTelephoneMember = @"telephoneMemberKey";

static NSString *const kCityDataPlistNameKey = @"CityData";

static NSString *const kDeviceTokenKey = @"DeviceTokenKey";

#define kWelcomeIsShow [@"welcomeIsShowKey" stringByAppendingString:kVersion]
#define kMaxCacheSize 50*1024*1024
//----------------------网络请求---------------------------

#define kTimeoutInterval 30
static NSString *const kWaitTitleText = @"加载中...";
static NSString *const kNoMoreDataFooterText = @"没有更多数据啦!";
static NSString *const kResponseSuccessfulCode = @"200";
static NSString *const kResponseUnLoginCode = @"204";
#define kShowAlertWaitInterval 10

#define kPlatform @"bank-IOS"

/**
 *  友盟AppKey
 *
 *  @return return value description
 */
static NSString *const UmengAppkey = @"575e56eb67e58e3d70000da5";
static NSString *const kUMShareAppKey = @"575e56eb67e58e3d70000da5";

#pragma mark ----------     分享相关话术    ----------------
static NSString *const kShareTitleText = @"800Banking";
static NSString *const kShareContentText = @"关注金融，收获资讯，开启财富，在这里金钱永不眠！";
static NSString *const kShareUrlImageName = @"shareIcon";
static NSString *const kCallCenterPhone = @"400-6366-800";
static NSString *const kHuiFuLoginBanner = @"huifuLoginBanner";
static NSString *const kCangJingGeBanner = @"CANGJINGE";

#define kShareUrlStr [NSString stringWithFormat:@"%@static/regDown.html?invCode=",kServerAddress]

#pragma mark ----------     提醒相关话术    ----------------
//激活第三方支付提醒话术
static NSString *const kActivateHFPayTitleText  = @"温馨提示";
static NSString *const kActivateHFPayMessageText  = @"为确保您的资金安全，请先开通第三方资金托管账户";
static NSString *const kCancelBtnTitle  = @"稍后继续";
static NSString *const kDoneBtnTitle  = @"去开通";
 
/**
 *  测试环境
 */
//#define kServerAddress        @"http://app.e800bank.com:81/"         //测试环境域名
//#define kH5ServerAddress      @"http://test.e800bank.com:81/"        //H5测试环境域名
//#define kMd5Key @"knab008"                                        //测试环境MD5Key

/**
 *  UAT环境
 */
#define kServerAddress    @"http://muat.800banking.com.cn/"       //UAT环境IP地址
#define kH5ServerAddress   @"http://uat.800banking.com.cn/"       //H5UAT环境域名
#define kMd5Key @"knab008"                                        //UAT环境MD5Key

/**
 *  生产环境
 */
//#define kServerAddress      @"https://m.800banking.com.cn/"           //生产环境域名
//#define kH5ServerAddress    @"https://www.800banking.com.cn/"         //H5生产环境域名
//#define kMd5Key @"knab008"                                            //生产环境MD5Key

#define kChannel @"2"
#pragma mark - HTML5 URLS - m

#define kAppId @"1134851892"

#define kUrlServiceProtocol @"static/serviceProtocol.html"
#define kUrlRiskClause @"static/riskClause.html"
#define kUrlSafeClause @"static/safe.html"
#define kUrlHelpCenter @"view/help.html"
#define kUrlAboutUs @"static/aboutUs.html"
#define kUrlQuestionnaire @"static/riskSurvey.html"

#endif /* Parameter_h */
