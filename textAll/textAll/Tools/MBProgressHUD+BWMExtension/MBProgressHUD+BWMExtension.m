//
//  MBProgressHUD+BWMExtension.m
//  Example
//
//  Created by 伟明 毕 on 15/7/20.
//  Copyright (c) 2015年 Bi Weiming. All rights reserved.
//

#import "MBProgressHUD+BWMExtension.h"

NSString * const kHXYMBProgressHUDMsgLoading = @"正在加载...";
NSString * const kHXYMBProgressHUDMsgLoadError = @"加载失败";
NSString * const kHXYMBProgressHUDMsgLoadSuccessful = @"加载成功";
NSString * const kHXYMBProgressHUDMsgNoMoreData = @"没有更多数据了";
NSTimeInterval kHXYMBProgressHUDHideTimeInterval = 1.2f;

static CGFloat FONT_SIZE = 13.0f;
static CGFloat OPACITY = 0.85;
#define DEFAULTTITLEFONT [UIFont boldSystemFontOfSize:16.f]
#define DEFAULTDETAILFONT [UIFont boldSystemFontOfSize:12.f]
#define DEFAULTTEXTCOLOR [UIColor whiteColor]


@implementation MBProgressHUD (BWMExtension)

+ (MBProgressHUD *)hxy_showHUDAddedTo:(UIView *)view labelText:(NSString *)labelText detailText:(NSString *)detailText labelFont:(UIFont *)labelFont labelColor:(UIColor *)labelColor detailFont:(UIFont *)detailFont detailColor:(UIColor *)detailColor opacity:(CGFloat)opacity delay:(NSTimeInterval)delay mode:(MBProgressHUDMode)mode
{
    static MBProgressHUD *HUD = nil;
    if (HUD) {
        [HUD hide:YES];
        HUD  = nil;
    }
    //MBProgressHUD 默认字体颜色白色
    HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.labelText = labelText;
    HUD.detailsLabelText = detailText;
    HUD.labelColor = labelColor?labelColor:DEFAULTTEXTCOLOR;
    HUD.detailsLabelColor = detailColor?detailColor:DEFAULTTEXTCOLOR;
    HUD.labelFont = labelFont?labelFont:DEFAULTTITLEFONT;
    HUD.detailsLabelFont = detailFont?detailFont:DEFAULTDETAILFONT;
    HUD.opacity = opacity?opacity:OPACITY;
    
    HUD.mode = mode;
    [HUD show:YES];
    if (delay <= 0) {
        [HUD hide:YES afterDelay:1.5];
    }
    return HUD;
}

+ (MBProgressHUD *)hxy_showTextHUDAddedTo:(UIView *)view labelText:(NSString *)labelText labelFont:(UIFont *)labelFont labelColor:(UIColor *)labelColor
{
    return [self hxy_showHUDAddedTo:view labelText:labelText detailText:nil labelFont:labelFont labelColor:labelColor detailFont:nil detailColor:nil opacity:0 delay:0 mode:MBProgressHUDModeText];
}

+ (MBProgressHUD *)hxy_showTextHUDAddedTo:(UIView *)view labelText:(NSString *)labelText labelFont:(UIFont *)labelFont labelColor:(UIColor *)labelColor delay:(NSTimeInterval)delay
{
    return [self hxy_showHUDAddedTo:view labelText:labelText detailText:nil labelFont:labelFont labelColor:labelColor detailFont:nil detailColor:nil opacity:0 delay:delay mode:MBProgressHUDModeText];
}

+ (MBProgressHUD *)hxy_showTextHUDAddedTo:(UIView *)view detailText:(NSString *)detailText detailFont:(UIFont *)detailFont detailColor:(UIColor *)detailColor
{
    return [self hxy_showHUDAddedTo:view labelText:nil detailText:detailText labelFont:nil labelColor:nil detailFont:detailFont detailColor:detailColor opacity:0 delay:0 mode:MBProgressHUDModeText];
}

+ (MBProgressHUD *)hxy_showTextHUDAddedTo:(UIView *)view detailText:(NSString *)detailText detailFont:(UIFont *)detailFont detailColor:(UIColor *)detailColor delay:(NSTimeInterval)delay
{
    return [self hxy_showHUDAddedTo:view labelText:nil detailText:detailText labelFont:nil labelColor:nil detailFont:detailFont detailColor:detailColor opacity:0 delay:delay mode:MBProgressHUDModeText];
}

+ (MBProgressHUD *)hxy_showTextHUDAddedTo:(UIView *)view text:(NSString *)text
{
    //因为有可能是多行的,所以这里选择detailLabel
    return [self hxy_showTextHUDAddedTo:view detailText:text detailFont:nil detailColor:nil];
}

+ (MBProgressHUD *)hxy_showText:(NSString *)text
{
    return [self hxy_showTextHUDAddedTo:[UIApplication sharedApplication].keyWindow text:text];
}

+ (MBProgressHUD *)hxy_showIndeterminateHUDAddedTo:(UIView *)view text:(NSString *)text detailFont:(UIFont *)detailFont detailColor:(UIColor *)detailColor
{
    return [self hxy_showHUDAddedTo:view labelText:nil detailText:text labelFont:nil labelColor:nil detailFont:detailFont detailColor:detailColor opacity:0.8 delay:0 mode:MBProgressHUDModeIndeterminate];
}

+ (MBProgressHUD *)hxy_showIndeterminateHUDAddedTo:(UIView *)view text:(NSString *)text
{
    return [self hxy_showIndeterminateHUDAddedTo:view text:text detailFont:nil detailColor:nil];
}

+ (MBProgressHUD *)hxy_showIndeterminateHUD
{
    return [self hxy_showIndeterminateHUDAddedTo:[UIApplication sharedApplication].keyWindow text:nil];
}

+ (MBProgressHUD *)hxy_showHUDAddedTo:(UIView *)view title:(NSString *)title animated:(BOOL)animated {
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:animated];
    HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
    HUD.detailsLabelText = title;
    HUD.opacity = OPACITY;
    return HUD;
}

+ (MBProgressHUD *)hxy_showHUDAddedTo:(UIView *)view title:(NSString *)title {
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
    HUD.detailsLabelText = title;
    HUD.opacity = OPACITY;
    return HUD;
}

- (void)hxy_hideWithTitle:(NSString *)title hideAfter:(NSTimeInterval)afterSecond {
    if (title) {
        self.detailsLabelText = title;
        self.mode = MBProgressHUDModeText;
    }
    [self hide:YES afterDelay:afterSecond];
}

- (void)hxy_hideAfter:(NSTimeInterval)afterSecond {
    [self hide:YES afterDelay:afterSecond];
}

- (void)hxy_hideWithTitle:(NSString *)title
                hideAfter:(NSTimeInterval)afterSecond
                  msgType:(HXYMBProgressHUDMsgType)msgType {
    self.detailsLabelText = title;
    self.mode = MBProgressHUDModeCustomView;
    self.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[[self class ]p_imageNamedWithMsgType:msgType]]];
    [self hide:YES afterDelay:afterSecond];
}

+ (MBProgressHUD *)hxy_showTitle:(NSString *)title toView:(UIView *)view hideAfter:(NSTimeInterval)afterSecond {
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.mode = MBProgressHUDModeText;
    HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
    HUD.detailsLabelText = title;
    HUD.opacity = OPACITY;
    [HUD hide:YES afterDelay:afterSecond];
    return HUD;
}

+ (MBProgressHUD *)hxy_showTitle:(NSString *)title
                      toView:(UIView *)view
                   hideAfter:(NSTimeInterval)afterSecond
                     msgType:(HXYMBProgressHUDMsgType)msgType {
    
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
    
    NSString *imageNamed = [self p_imageNamedWithMsgType:msgType];
    
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNamed]];
    HUD.detailsLabelText = title;
    HUD.opacity = OPACITY;
    HUD.mode = MBProgressHUDModeCustomView;
    [HUD hide:YES afterDelay:afterSecond];
    return HUD;
    
}

+ (NSString *)p_imageNamedWithMsgType:(HXYMBProgressHUDMsgType)msgType {
    NSString *imageNamed = nil;
    if (msgType == HXYMBProgressHUDMsgTypeSuccessful) {
        imageNamed = @"bwm_hud_success";
    } else if (msgType == HXYMBProgressHUDMsgTypeError) {
        imageNamed = @"bwm_hud_error";
    } else if (msgType == HXYMBProgressHUDMsgTypeWarning) {
        imageNamed = @"bwm_hud_warning";
    } else if (msgType == HXYMBProgressHUDMsgTypeInfo) {
        imageNamed = @"bwm_hud_info";
    }
    return imageNamed;
}

+ (MBProgressHUD *)hxy_showDeterminateHUDTo:(UIView *)view {
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.mode = MBProgressHUDModeDeterminateHorizontalBar;
    HUD.animationType = MBProgressHUDAnimationZoom;
    HUD.detailsLabelText = kHXYMBProgressHUDMsgLoading;
    HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
    return HUD;
}

+ (void)hxy_setHideTimeInterval:(NSTimeInterval)second fontSize:(CGFloat)fontSize opacity:(CGFloat)opacity {
    kHXYMBProgressHUDHideTimeInterval = second;
    FONT_SIZE = fontSize;
    OPACITY = opacity;
}

@end
