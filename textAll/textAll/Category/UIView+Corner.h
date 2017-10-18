//
//  UIView+Corner.h
//  textAll
//
//  Created by 贺东方 on 2017/10/17.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Corner)
/**
 设置圆角
 使用Masonry的时候 需要确认已经有了frame
 @param cornerRadius 圆角的弧度
 @param corners 给哪个角做圆角
 UIRectCornerTopLeft     = 1 << 0,
 UIRectCornerTopRight    = 1 << 1,
 UIRectCornerBottomLeft  = 1 << 2,
 UIRectCornerBottomRight = 1 << 3,
 UIRectCornerAllCorners  = ~0UL
 */
- (void)setCornerRadius:(CGFloat)cornerRadius RoundingCorners:(UIRectCorner)corners;
@end
