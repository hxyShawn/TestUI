//
//  MBProgressHUD+BWMExtension.h
//  Example
//
//  Created by 伟明 毕 on 15/7/20.
//  Copyright (c) 2015年 Bi Weiming. All rights reserved.
//

#import "MBProgressHUD.h"

/**
 *  @brief  Nihility-Ming对MBProgressHUD的扩展，方便使用。
 */
@interface MBProgressHUD (BWMExtension)

extern NSString * const kHXYMBProgressHUDMsgLoading;
extern NSString * const kHXYMBProgressHUDMsgLoadError;
extern NSString * const kHXYMBProgressHUDMsgLoadSuccessful;
extern NSString * const kHXYMBProgressHUDMsgNoMoreData;
extern NSTimeInterval kHXYMBProgressHUDHideTimeInterval;

typedef NS_ENUM(NSUInteger, HXYMBProgressHUDMsgType) {
    HXYMBProgressHUDMsgTypeSuccessful,
    HXYMBProgressHUDMsgTypeError,
    HXYMBProgressHUDMsgTypeWarning,
    HXYMBProgressHUDMsgTypeInfo
};
@property (nonatomic,strong)MBProgressHUD *hud;
/**
 *  @brief  添加一个带菊花的HUD
 *
 *  @param view  目标view
 *  @param title 标题
 *
 *  @return MBProgressHUD
 */
+ (MBProgressHUD *)hxy_showHUDAddedTo:(UIView *)view title:(NSString *)title;
/** 添加一个带菊花的HUD */
+ (MBProgressHUD *)hxy_showHUDAddedTo:(UIView *)view
                                title:(NSString *)title
                             animated:(BOOL)animated;


#pragma mark - 纯文本
/**
 @brief 纯文字,label和detail
 
 @param view 目标view
 @param labelText label的文字
 @param detailText 详情的文字
 @param labelFont label字体
 @param labelColor label颜色
 @param detailFont 详情字体
 @param detailColor 详情字体颜色
 @param opacity 背景的透明度
 @param delay 延迟时间
 @param mode 样式
 @return MBProgressHUD
 */
+ (MBProgressHUD *)hxy_showHUDAddedTo:(UIView *)view labelText:(NSString *)labelText detailText:(NSString *)detailText labelFont:(UIFont *)labelFont labelColor:(UIColor *)labelColor detailFont:(UIFont *)detailFont detailColor:(UIColor *)detailColor opacity:(CGFloat)opacity delay:(NSTimeInterval)delay mode:(MBProgressHUDMode)mode;

/**
 @brief 纯文字,只配置label

 @param view 目标view
 @param labelText label的文字
 @param labelFont label字体
 @param labelColor label颜色
 @return MBProgressHUD
 */
+ (MBProgressHUD *)hxy_showTextHUDAddedTo:(UIView *)view labelText:(NSString *)labelText labelFont:(UIFont *)labelFont labelColor:(UIColor *)labelColor;


/**
 @brief 纯文字,只配置label,可指定显示时间
 
 @param view 目标view
 @param labelText label的文字
 @param labelFont label字体
 @param labelColor label颜色
 @param delay 显示时间
 @return MBProgressHUD
 */
+ (MBProgressHUD *)hxy_showTextHUDAddedTo:(UIView *)view labelText:(NSString *)labelText labelFont:(UIFont *)labelFont labelColor:(UIColor *)labelColor delay:(NSTimeInterval)delay;

/**
 @brief 纯文字,只配置detail

 @param view 目标view
 @param detailText 详情的文字
 @param detailFont 详情字体
 @param detailColor 详情字体颜色
 @return MBProgressBUD
 */
+ (MBProgressHUD *)hxy_showTextHUDAddedTo:(UIView *)view detailText:(NSString *)detailText detailFont:(UIFont *)detailFont detailColor:(UIColor *)detailColor;


/**
 @brief 纯文字,只配置detail,可指定显示时间
 
 @param view 目标view
 @param detailText 详情的文字
 @param detailFont 详情字体
 @param detailColor 详情字体颜色
 @param delay 显示时间
 @return MBProgressHUD
 */
+ (MBProgressHUD *)hxy_showTextHUDAddedTo:(UIView *)view detailText:(NSString *)detailText detailFont:(UIFont *)detailFont detailColor:(UIColor *)detailColor delay:(NSTimeInterval)delay;


/**
 @brief 纯文本,显示多行文本

 @param view 目标view
 @param text 文字
 @return MBProgressHUD
 */
+ (MBProgressHUD *)hxy_showTextHUDAddedTo:(UIView *)view text:(NSString *)text;

/**
 @brief 纯文本,显示多行文本

 @param text 文本
 @return MBProgressHUD
 */
+ (MBProgressHUD *)hxy_showText:(NSString *)text;


#pragma mark - 显示activityIndicater
/**
 @brief 显示activityIndicater,文本.可配置字体,颜色

 @param view 目标view
 @param text 文本
 @param detailFont 文本字体
 @param detailColor 文本字体颜色
 @return MBProgressHUD
 */
+ (MBProgressHUD *)hxy_showIndeterminateHUDAddedTo:(UIView *)view text:(NSString *)text detailFont:(UIFont *)detailFont detailColor:(UIColor *)detailColor;


/**
 @brief 显示activityIndicater,文本

 @param view 目标view
 @param text 文本
 @return MBProgressHUD
 */
+ (MBProgressHUD *)hxy_showIndeterminateHUDAddedTo:(UIView *)view text:(NSString *)text;


/**
 @brief 显示activityIndicater

 @return MBProgressHUD
 */
+ (MBProgressHUD *)hxy_showIndeterminateHUD;


/*
    1. 自定义图片
    2. 加载成功
    3. 加载失败
    4. 横向进度条
    5. 圆形进度条
    6. 原型百分比进度条
 */

/**
 *  @brief  隐藏指定的HUD
 *
 *  @param afterSecond 多少秒后
 */
- (void)hxy_hideAfter:(NSTimeInterval)afterSecond;
/** 隐藏指定的HUD */
- (void)hxy_hideWithTitle:(NSString *)title
                hideAfter:(NSTimeInterval)afterSecond;
/** 隐藏指定的HUD */
- (void)hxy_hideWithTitle:(NSString *)title
                hideAfter:(NSTimeInterval)afterSecond
                  msgType:(HXYMBProgressHUDMsgType)msgType;

/**
 *  @brief  显示一个自定的HUD
 *
 *  @param title       标题
 *  @param view        目标view
 *  @param afterSecond 持续时间
 *
 *  @return MBProgressHUD
 */
+ (MBProgressHUD *)hxy_showTitle:(NSString *)title
                      toView:(UIView *)view
                   hideAfter:(NSTimeInterval)afterSecond;

/** 显示一个自定的HUD */
+ (MBProgressHUD *)hxy_showTitle:(NSString *)title
                      toView:(UIView *)view
                   hideAfter:(NSTimeInterval)afterSecond
                     msgType:(HXYMBProgressHUDMsgType)msgType;

/**
 *  @brief  显示一个渐进式的HUD
 *
 *  @param view 目标view
 *
 *  @return MBProgressHUD
 */
+ (MBProgressHUD *)hxy_showDeterminateHUDTo:(UIView *)view;

/** 配置本扩展的默认参数 */
+ (void)hxy_setHideTimeInterval:(NSTimeInterval)second fontSize:(CGFloat)fontSize opacity:(CGFloat)opacity;

@end
