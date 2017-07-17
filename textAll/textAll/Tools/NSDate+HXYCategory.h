//
//  NSDate+HXYCategory.h
//  manmanda
//
//  Created by liangqi on 17/2/24.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HXYCategory)


/**
 *把两个时间转化成date-date的形式
 *如2017-2-7    2017-2-10
 *转换成 2月7日-2月10日
 @param earlyDate 早的时间
 @param lateDate  晚的时间
 */
- (NSString *)date:(NSDate *)earlyDate toDate:(NSDate *)lateDate;

/**
 *
 *把日期转换成字符串

 @param NSString 图片格式
 @return 返回对应格式的字符串
*/
- (NSString *)dateToStringWithdateFormate:(NSString *)dateFormate;


/**
 时间戳

 @return 返回时间戳字符串
 */
+ (NSString*)getCurrentTimestamp;



/**
 时间戳转换成时间字符串

 @param time 时间戳
 @return 转换结果
 */
-(NSString*)SetTime:(NSString*)time;
@end
