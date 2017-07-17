//
//  UIViewController+HXYCategory.h
//  manmanda
//
//  Created by liangqi on 17/4/6.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HXYBackItemType) {
    HXYBackItemTypePink = 0,
    HXYBackItemTypeBlack,
    HXYBackItemTypeWhite
};

@interface UIViewController (HXYCategory)
/**
 判断当前view是否在显示中
 
 @return YES  正在显示 NO  没有显示
 */
- (BOOL)isVisible;


/**
 获得当前在显示的viewController

 @return viewController
 */
- (UIViewController *)currentViewController;


/**
 设置标题

 @param title 标题
 @param font 字体
 @param color 字颜色
 */
- (void)setTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color;


/**
 设置导航栏右按钮,只有一个的时候,而且是文字的
 内置方法名 - (void)rightItemClick:(UIButton *)btn
 @param title title
 @param font font
 @param color color
 */
- (void)setRightTextItemWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color;


- (void)setBackItemWithImage:(UIImage *)image;


/**
 设置返回按钮

 @param type 颜色,粉,黑,白
 */
- (void)setBackArrowWithType:(HXYBackItemType)type;

/**
 默认的背景颜色: 0xEEEEEE  rbga(238,238,238,1.0)
 */
- (void)setDefaultBackgroundColor;

@end
