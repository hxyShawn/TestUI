//
//  UIImageView+HXYCategory.h
//  manmanda
//
//  Created by liangqi on 17/4/18.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (HXYCategory)
/**
 设置圆角
 使用:view.layer.mask =  来使用此方法,需要先把imageView设置好frame
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
@end
