//
//  UIView+HXYCategory.m
//  manmanda
//
//  Created by liangqi on 17/2/24.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "UIView+HXYCategory.h"

@implementation UIView (HXYCategory)
- (CAShapeLayer *)setCornerRadius:(CGFloat)cornerRadius RoundingCorners:(UIRectCorner)corners
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    return maskLayer;
}



@end
