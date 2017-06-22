//
//  NSString+HXYCategory.h
//  manmanda
//
//  Created by liangqi on 17/2/24.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HXYCategory)

/**
 根据string自身来确定宽度,

 @param fontSize CGFloat的fontSize
 @param constrainedHeight 定高
 @return 宽
 */
- (CGFloat)widthWithFontSize:(CGFloat)fontSize constrainedWidth:(CGFloat )constrainedHeight;

/**
 根据string自身来确定高度

 @param fontSize CGFloat的fontSize
 @param constrainedWidth 定宽
 @return 高
 */
- (CGFloat)heightWithFontSize:(CGFloat)fontSize constrainedWidth:(CGFloat )constrainedWidth;

/**
 根据string自身来确定宽度
 
 @param font UIFont类型
 @param constrainedWidth 定高
 @return 宽
 */
- (CGFloat)widthWithFont:(UIFont *)font constrainedWidth:(CGFloat )constrainedHeight;

/**
 根据string自身来确定高度

 @param font UIFont类型
 @param constrainedWidth 定宽
 @return 高
 */
- (CGFloat)heightWithFont:(UIFont *)font constrainedWidth:(CGFloat )constrainedWidth;


/**
 *把字符串转成NSDate
 @return 返回Date
 */
- (NSDate *)stringToDate;


/**
 *根据dateFormate把字符串转成NSDate

 @param dateFormate 想要返回的日期的格式
 @return 返回Date
 */
- (NSDate *)stringToDateWithdateFormate:(NSString *)dateFormate;
/**
 *判断字符串是否为空或者为空值

 @param str 要判断的字符串
 @return 布尔值
 */
+(BOOL)isNullOrEmpty:(NSString *)str;


/**
 根据有属性返回宽度

 @param attributes 属性字典
 @param size 限制宽高
 @return 宽度
 */
- (CGFloat)widthWithAttributes:(NSDictionary *)attributes size:(CGSize )size;


/**
 根据有属性返回高度
 
 @param attributes 属性字典
 @return 高度
 */
- (CGFloat)heightWithAttributes:(NSDictionary *)attributes size:(CGSize)size;
@end
