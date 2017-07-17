//
//  UIImageView+HXYCategory.m
//  manmanda
//
//  Created by liangqi on 17/4/18.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "UIImageView+HXYCategory.h"

@implementation UIImageView (HXYCategory)
- (CAShapeLayer *)setCornerRadius:(CGFloat)cornerRadius RoundingCorners:(UIRectCorner)corners
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    return maskLayer;
}
@end
