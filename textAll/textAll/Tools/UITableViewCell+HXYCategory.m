//
//  UITableViewCell+HXYCategory.m
//  manmanda
//
//  Created by liangqi on 17/6/28.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "UITableViewCell+HXYCategory.h"

#define GREATERTHAN8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
@implementation UITableViewCell (HXYCategory)
- (void)setSepratorLine
{
    
    if (GREATERTHAN8) {
        if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
            [self setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
            [self setLayoutMargins:UIEdgeInsetsZero];
        }
    }
}
@end
