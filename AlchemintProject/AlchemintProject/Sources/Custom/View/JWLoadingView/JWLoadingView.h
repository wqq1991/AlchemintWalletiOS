/********************************************************************
 文件名称 : LoadingView.h 文件
 作   者 : WuQiaoqiao
 创建时间 : 15/5/21
 文件描述 : 类
 *********************************************************************/


typedef void(^FailBlock)(void);

typedef NS_ENUM(NSUInteger, LoadingState) {

    LoadingStateLoading,
    LoadingStateFail,
    LoadingStateNoData,
};

@interface JWLoadingView : UIView


/**
 *  设置LoadingView 的范围偏移量 EG: 默认覆盖整个父视图
 */
@property (nonatomic, assign) UIEdgeInsets offsetForView;

/**
 *  显示加载视图
 *
 *  @param supview supview description
 */
+ (void)showLoadingView:(UIView *)supview;

/**
 *  @author qiaoqiao.wu, 16-01-07 22:01:14
 *
 *
 *
 *  @param supview supview description
 *  @param gifName gifName description
 */ 
+ (void)showLoadingView:(UIView *)supview forGifWithName:(NSString *)gifName;

/**
 *  @author qiaoqiao.wu, 16-01-15 23:01:16
 *
 *  显示带GIF动画的加载页,可自行设置每帧间隔时间。
 *
 *  @param supview 父视图。
 *  @param gifName Gif图片文件名。
 *  @param time    每帧间隔时间。
 */
+ (void)showLoadingView:(UIView *)supview forGifWithName:(NSString *)gifName timeSlot:(NSTimeInterval )time;

/**
 *  @author qiaoqiao.wu, 16-01-07 22:01:51
 *
 *  显示带透明背景的Gif加载视图.
 *
 *  @param supview supview description
 */
+ (void)showHUDLoadingView:(UIView *)supview forGifWithName:(NSString *)gifName timeSlot:(NSTimeInterval )time;

/**
 *  显示带半透明背景的加载视图
 *
 *  @param supview supview description
 */
+ (void)showHUDLoadingView:(UIView *)supview;
/**
 *  显示带回调的加载失败视图
 *
 *  @param supview supview description
 *  @param block   block description
 */
+(void)showLoadFailView:(UIView *)supview failBlock:(FailBlock )block;

/**
 *  显示无数据视图
 *
 *  @param supview supview description
 */
+ (void)showNoDataView:(UIView *)supview;

/**
 *  显示无数据视图 且可自定义Title和Image内容 不传或传空则 显示默认.
 *
 *  @param supview supview description
 */
+ (void)showNoDataView:(UIView *)supview title:(NSString *)title image:(UIImage *)image;

/**
 *  从当前视图隐藏LoadingView
 *
 *  @param supview supview description
 */
+ (void)hiddenViewInView:(UIView *)supview;
@end
