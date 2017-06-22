//
//  NSDate+HXYCategory.m
//  manmanda
//
//  Created by liangqi on 17/2/24.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "NSDate+HXYCategory.h"

@implementation NSDate (HXYCategory)

- (NSString *)date:(NSDate *)earlyDate toDate:(NSDate *)lateDate
{
//    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    NSString *str = @"";
    return str;
}

- (NSDate *)stringToDate:(NSString *)dateString
{
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd HH::mm:ss"];
    NSDate *date = [df dateFromString:dateString];
    return date;
}

- (NSString *)dateToStringWithdateFormate:(NSString *)dateFormate;
{
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:dateFormate];
//    df setLocale:[NSLocale alloc]in
    NSString *string = [df stringFromDate:self];
    return string;
}

+ (NSString*)getCurrentTimestamp{
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval a=[dat timeIntervalSince1970];
    
    NSString*timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
    
    return timeString;
}

-(NSString*)SetTime:(NSString*)time{
    
    NSDateFormatter*formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"yyyMMdd"];
    
    int timeval = [time intValue];
    
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeval];
    
    // NSLog(@"1296035591  = %@",confromTimesp);
    
    NSString*confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
}
@end
