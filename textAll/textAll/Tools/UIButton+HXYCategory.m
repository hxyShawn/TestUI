//
//  UIButton+HXYCategory.m
//  manmanda
//
//  Created by liangqi on 17/4/7.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "UIButton+HXYCategory.h"
#import "NSString+HXYCategory.h"
@implementation UIButton (HXYCategory)


- (NSDictionary *)setFont:(nullable UIFont *)font titleColor:(nullable UIColor *)titleColor kern:(CGFloat)kern
{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if (font) {
        [dict setObject:font forKey:NSFontAttributeName];
    }
    
    if (titleColor) {
        [dict setObject:titleColor forKey:NSForegroundColorAttributeName];
    }
    
    if (kern) {
        [dict setObject:[NSNumber numberWithFloat:kern] forKey:NSKernAttributeName];
    }
    
    return dict;
//    NSAttributedString *attr = [[NSAttributedString alloc]initWithString:title attributes:dict];
//    [self setAttributedTitle:attr forState:UIControlStateNormal];
}

- (UIImage *)buttonImageFromColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
