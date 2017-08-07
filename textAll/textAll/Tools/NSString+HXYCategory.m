//
//  NSString+HXYCategory.m
//  manmanda
//
//  Created by liangqi on 17/2/24.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "NSString+HXYCategory.h"

@implementation NSString (HXYCategory)

- (CGFloat)widthWithAttributes:(NSDictionary *)attributes size:(CGSize)size
{
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    return rect.size.width;
}

- (CGFloat)heightWithAttributes:(NSDictionary *)attributes size:(CGSize)size
{

    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    return rect.size.height;
}
- (CGFloat)widthWithFontSize:(CGFloat)fontSize constrainedWidth:(CGFloat )constrainedHeight
{
    CGSize size;
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
       size = [self sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(MAXFLOAT, constrainedHeight)];
    }else{
        CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, constrainedHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
        size = rect.size;
    }
    return size.width;
}

- (CGFloat)heightWithFontSize:(CGFloat)fontSize constrainedWidth:(CGFloat )constrainedWidth
{
    CGSize size;
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        size = [self sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(constrainedWidth, MAXFLOAT)];
    }else{
        CGRect rect = [self boundingRectWithSize:CGSizeMake(constrainedWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
        size = rect.size;
    }
    return size.height;
}

- (CGFloat)heightWithFont:(UIFont *)font constrainedWidth:(CGFloat )constrainedWidth
{
    CGSize size;
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        size = [self sizeWithFont:font constrainedToSize:CGSizeMake(constrainedWidth, MAXFLOAT)];
    }else{
        CGRect rect = [self boundingRectWithSize:CGSizeMake(constrainedWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
        size = rect.size;
    }
    return size.height;
}

- (CGFloat)widthWithFont:(UIFont *)font constrainedWidth:(CGFloat)constrainedHeight
{
    CGSize size;
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        size = [self sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, constrainedHeight)];
    }else{
        CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, constrainedHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
        size = rect.size;
    }
    return size.width;
}

- (NSDate *)stringToDate
{
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date = [df dateFromString:self];
    return date;
}

- (NSDate *)stringToDateWithdateFormate:(NSString *)dateFormate
{
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:dateFormate];
    NSDate *date = [df dateFromString:self];
    return date;
}

+(BOOL)isNullOrEmpty:(NSString*)str
{
    //因为向nil发送消息是有效的,所以还要对nil处理
    if (str == nil || str == NULL) {
        return YES;
    }
    //如果是NSNull类
    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    //如果去掉空格之后的长度是0
    if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

+ (NSString *)stringWithInteger:(NSInteger)integer
{
    return [NSString stringWithFormat:@"%ld",integer];
}

@end
