//
//  UIView+HXYCategory.h
//  manmanda
//
//  Created by liangqi on 17/2/24.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIView (HXYCategory)
/**
 设置圆角
 使用:view.layer.maskl = 此方法
 @param cornerRadius 圆角的弧度
 @param bounds view的bounds
 @param corners 给哪个角做圆角
    UIRectCornerTopLeft     = 1 << 0,
    UIRectCornerTopRight    = 1 << 1,
    UIRectCornerBottomLeft  = 1 << 2,
    UIRectCornerBottomRight = 1 << 3,
    UIRectCornerAllCorners  = ~0UL
 @return 返回一个mask
 */
- (CAShapeLayer *)setCornerRadius:(CGFloat)cornerRadius RoundingCorners:(UIRectCorner)corners;


/**
 判断当前view是否在显示中

 @return YES  正在显示 NO  没有显示
 */
- (BOOL)isVisible;
@end
