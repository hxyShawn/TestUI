//
//  UIButton+HXYCategory.h
//  manmanda
//
//  Created by liangqi on 17/4/7.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (HXYCategory)

- (NSDictionary *)setFont:(nullable UIFont *)font titleColor:(nullable UIColor *)titleColor kern:(CGFloat)kern;

/**
 根据本身的frame生成一个纯色的图片,可以用来当做纯色的背景颜色,因为设置backgroundColo没有状态选项
 
 @param color 颜色
 @return 图片
 */
- ( UIImage * _Nonnull )buttonImageFromColor:(nonnull UIColor *)color;

@end
