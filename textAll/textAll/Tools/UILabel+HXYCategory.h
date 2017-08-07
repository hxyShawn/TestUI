//
//  UILabel+HXYCategory.h
//  manmanda
//
//  Created by liangqi on 17/4/6.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (HXYCategory)


/**
 把html转成富文本

 @param text html
 @return 富文本
 */
+ (NSAttributedString *)attriStrWithHtmlText:(NSString *)text;
/**
 用来计算需要限定行数的label的高度

 @param text 文字
 @param fontSize 字体
 @param width 限制宽度
 @param maxLine 最大行数
 @return 高度
 */
- (CGFloat)hightWithText:(NSString *)text fontSize:(CGFloat)fontSize width:(CGFloat)width maxLine:(NSInteger )maxLine;

+ (CGFloat)hightWithText:(NSString *)text fontSize:(CGFloat)fontSize width:(CGFloat)width maxLine:(NSInteger )maxLine;

- (CGSize)ZFYtextHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size;


/**
 这个好像只能计算没有设置字间距,行间距的,纯文本的高度

 @param label
 @return
 */
- (CGFloat )dynamicCalculationLabelHight:(UILabel*) label;


/**
 快速设置字体,字体颜色,字间距,
 //本来想直接返回一个富文本的字符串的,但是由于label的text经常是要等到传入数据才可以使用,所以就放弃了
 
 @param font 字体
 @param color 字体颜色
 @param kern 字间距
 */
+ (NSDictionary *)setFont:(UIFont *)font color:(UIColor *)color kern:(CGFloat)kern;


+ (instancetype )label;
@end
