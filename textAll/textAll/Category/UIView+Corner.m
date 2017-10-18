//
//  UIView+Corner.m
//  textAll
//
//  Created by 贺东方 on 2017/10/17.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import "UIView+Corner.h"

@implementation UIView (Corner)
- (void)setCornerRadius:(CGFloat)cornerRadius RoundingCorners:(UIRectCorner)corners
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
@end
