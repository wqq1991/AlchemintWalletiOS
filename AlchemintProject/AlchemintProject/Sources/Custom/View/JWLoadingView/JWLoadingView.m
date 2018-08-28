/********************************************************************
 文件名称 : LoadingView.m 文件
 作   者 : WuQiaoqiao
 创建时间 : 15/5/21
 文件描述 : 类
 *********************************************************************/

#import <UIKit/UIKit.h>
#import "JWLoadingView.h"
#import <objc/runtime.h>
#import <ImageIO/ImageIO.h>

static NSInteger const LOAD_VIEW_TAG = 10000;

static NSString * const kDefaultTitle = @"暂无数据";
static NSString * const kDefaultImageName = @"backItemImage";
static NSTimeInterval const kDefaultTimeSlot = 0.04f;

@interface JWLoadingView ()
{
    
}
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) FailBlock failActionBlock;
@property (weak, nonatomic) IBOutlet UIImageView *centerImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *bgMaskView;
@property size_t index, count;
@property CGImageSourceRef gif;
@property (nonatomic, strong) NSDictionary *gifProperties;
@end

@implementation JWLoadingView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
        
       self = [nibs firstObject];

        _gifProperties = [NSDictionary dictionary];
        
    }
    return self;
}

/**
 *  显示正在加载视图
 *
 *  @param supview supview description
 */
+ (void)showLoadingView:(UIView *)supview {
  
    [self hiddenViewInView:supview];
    
    [self addLoadingView:supview state:LoadingStateLoading];
}

/**
 *  @author qiaoqiao.wu, 16-01-07 22:01:51
 *
 *  显示带透明背景的加载视图
 *
 *  @param supview supview description
 */
+ (void)showHUDLoadingView:(UIView *)supview {
    
    [self hiddenViewInView:supview];
    
    JWLoadingView *loadingView = [self addLoadingView:supview state:LoadingStateLoading];
    
    loadingView.bgMaskView.alpha = 0.3f;
}

/**
 *  @author qiaoqiao.wu, 16-01-07 22:01:01
 *
 *  显示带GIF动画的加载页
 *
 *  @param supview supview description
 *  @param gifName gifName description
 */
+ (void)showLoadingView:(UIView *)supview forGifWithName:(NSString *)gifName {

    [JWLoadingView showLoadingView:supview forGifWithName:gifName timeSlot:0.04f];
}

/**
 *  @author qiaoqiao.wu, 16-01-15 23:01:16
 *
 *  显示带GIF动画的加载页,可自行设置每帧间隔时间。
 *
 *  @param supview 父视图。
 *  @param gifName Gif图片文件名。
 *  @param time    每帧间隔时间。
 */
+ (void)showLoadingView:(UIView *)supview forGifWithName:(NSString *)gifName timeSlot:(NSTimeInterval )time {

    [self hiddenViewInView:supview];
    
    JWLoadingView *loadingView = [self addLoadingView:supview state:LoadingStateLoading];
    loadingView.titleLabel.text = @"";
    
    /***************************************************************************/
    
    time == 0 ? time = kDefaultTimeSlot : time;
    
    NSDictionary *gifLoopCount = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount];
    
    loadingView.gifProperties = [NSDictionary dictionaryWithObject:gifLoopCount forKey:(NSString *)kCGImagePropertyGIFDictionary];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:gifName ofType:@"gif"];
    
    if (!path) {
        
        NSLog(@"没有找到文件:%@",gifName);
        return;
    }
    
    loadingView.gif = CGImageSourceCreateWithURL((CFURLRef)[NSURL fileURLWithPath:path], (CFDictionaryRef)loadingView.gifProperties);
    
    loadingView.count = CGImageSourceGetCount(loadingView.gif);
    
    loadingView.timer = [NSTimer scheduledTimerWithTimeInterval:time target:loadingView selector:@selector(paly) userInfo:nil repeats:YES];
    
    /***************************************************************************/
}

/**
 *  @author qiaoqiao.wu, 16-01-07 22:01:51
 *
 *  显示带透明背景的Gif加载视图.
 *
 *  @param supview supview description
 */
+ (void)showHUDLoadingView:(UIView *)supview forGifWithName:(NSString *)gifName timeSlot:(NSTimeInterval )time {
 
    
    [self hiddenViewInView:supview];
    
    JWLoadingView *loadingView = [self addLoadingView:supview state:LoadingStateLoading];
    loadingView.titleLabel.text = @"";
    
    /***************************************************************************/
    
    time == 0 ? time = kDefaultTimeSlot : time;
    
    NSDictionary *gifLoopCount = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount];
    
    loadingView.gifProperties = [NSDictionary dictionaryWithObject:gifLoopCount forKey:(NSString *)kCGImagePropertyGIFDictionary];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:gifName ofType:@"gif"];
    
    if (!path) {
        
        NSLog(@"没有找到文件:%@",gifName);
        return;
    }
    
    loadingView.gif = CGImageSourceCreateWithURL((CFURLRef)[NSURL fileURLWithPath:path], (CFDictionaryRef)loadingView.gifProperties);
    
    loadingView.count = CGImageSourceGetCount(loadingView.gif);
    
    loadingView.timer = [NSTimer scheduledTimerWithTimeInterval:time target:loadingView selector:@selector(paly) userInfo:nil repeats:YES];
    
    loadingView.bgMaskView.alpha = 0.3f;
    
    /***************************************************************************/
    
}

/**
 *  @author qiaoqiao.wu, 16-01-07 23:01:40
 *
 *  Gif 动画播放实现
 */
- (void)paly {
 
    _index++;
    
    CGImageRef ref = CGImageSourceCreateImageAtIndex(_gif, _index, (CFDictionaryRef)_gifProperties);
    
    _centerImageView.layer.contents = (__bridge id)ref;
    
     CFRelease(ref);
    
    if (_index == _count - 1) {
        
        _index = 0;
    }
   
}

/**
 *  显示加载失败视图
 *
 *  @param supview supview description
 */
+ (void)showLoadFailView:(UIView *)supview {
    
    [self hiddenViewInView:supview];
    
     [JWLoadingView showLoadFailView:supview failBlock:nil];
}

/**
 *  显示带回调的加载失败视图
 *
 *  @param supview supview description
 *  @param block   block description
 */
+(void)showLoadFailView:(UIView *)supview failBlock:(FailBlock )block {
   
    [self hiddenViewInView:supview];
    
    JWLoadingView *loadingView = [JWLoadingView addLoadingView:supview state:LoadingStateFail];
    
    loadingView.centerImageView.image = [UIImage imageNamed:kDefaultImageName];
    loadingView.failActionBlock = block;
    
}

/**
 *  显示无数据视图
 *
 *  @param supview supview description
 */
+ (void)showNoDataView:(UIView *)supview {

    [self hiddenViewInView:supview];
    
    JWLoadingView *loadingView = [JWLoadingView addLoadingView:supview state:LoadingStateNoData];
    
    loadingView.centerImageView.image = [UIImage imageNamed:kDefaultImageName];
    
    loadingView.titleLabel.text = kDefaultTitle;
}

/**
 *  显示无数据视图 且可自定义Title和Image内容 不传或传空则 显示默认.
 *
 *  @param supview supview description
 */
+ (void)showNoDataView:(UIView *)supview title:(NSString *)title image:(UIImage *)image {
    
    [self hiddenViewInView:supview];
    
    JWLoadingView *loadingView = [JWLoadingView addLoadingView:supview state:LoadingStateNoData];
    
    /**
     *  设置Title 和Image EG:默认显示默认图片和默认Title
     */
    loadingView.centerImageView.image = [UIImage imageNamed:kDefaultImageName];
    
    loadingView.titleLabel.text = kDefaultTitle;
    
    if (title.length > 0) {
        
        loadingView.titleLabel.text = title;
    }
    
    if (image) {
        loadingView.centerImageView.image = image;
    }
   
}

/**
 *  从当前视图隐藏LoadingView
 *
 *  @param supview supview description
 */
+ (void)hiddenViewInView:(UIView *)supview {

    for (UIView *subview in supview.subviews) {
        
        if ([subview isKindOfClass:[JWLoadingView class]] && subview.tag == LOAD_VIEW_TAG) {
            
            JWLoadingView *loadingView = (JWLoadingView *)subview;
            
            /**
             *  @author qiaoqiao.wu, 16-01-07 22:01:32
             *
             *  如果存在定时器,则置空
             */
            if (loadingView.timer) {
                [loadingView.timer invalidate];
                loadingView.timer = nil;
            }
            
            [UIView animateWithDuration:0.25f animations:^{
                
                subview.alpha = 0.0f;
                
            } completion:^(BOOL finished) {
                
                [subview removeFromSuperview];
            }];
        }
    }
}

/**
 *  创建Loading 以及 重用方法
 *
 *  @param supview supview description
 *
 *  @return return Loadingview 实例
 */
+ (JWLoadingView *)addLoadingView:(UIView *)supview state:(LoadingState )state{

    JWLoadingView *loadingView = [[JWLoadingView alloc] init];
    loadingView.translatesAutoresizingMaskIntoConstraints = NO;
    loadingView.tag = LOAD_VIEW_TAG;
    [supview addSubview:loadingView];
    
    
    NSDictionary *views = NSDictionaryOfVariableBindings(loadingView);
    
    UIEdgeInsets edgeInsets = loadingView.offsetForView;
    
    /**
     *  给当前View 设置偏移量
     */
    NSString *constraintsWithVisualFormatForH = [NSString stringWithFormat:@"H:|-%f-[loadingView]-%f-|",edgeInsets.left,edgeInsets.right];
    NSString *constraintsWithVisualFormatForV = [NSString stringWithFormat:@"V:|-%f-[loadingView]-%f-|",edgeInsets.top,edgeInsets.bottom];
    
    [supview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:constraintsWithVisualFormatForH options:0 metrics:nil views:views]];
    [supview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:constraintsWithVisualFormatForV options:0 metrics:nil views:views]];
    
    
    /**
     *  只有失败状态才给View添加点击事件
     */
    if (state == LoadingStateFail) {
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:loadingView action:@selector(tapToReload:)];
        [loadingView.centerImageView addGestureRecognizer:tapGes];
        
    }
    
    return loadingView;
}

/**
 *  加载失败时,点击刷新事件
 *
 *  @param tapGes tapGes description
 */
- (void)tapToReload:(UITapGestureRecognizer *)tapGes {

    if (self.failActionBlock) {
        self.failActionBlock();
    }
}


@end
