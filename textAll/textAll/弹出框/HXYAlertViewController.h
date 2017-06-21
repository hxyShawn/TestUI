//
//  HXYAlertViewController.h
//  textAll
//
//  Created by liangqi on 17/6/14.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, HXYAlertActionStyle) {
    HXYAlertActionStyleDefault = 0,
    HXYAlertActionStyleCancel,
    HXYAlertActionStyleDestructive
} ;

typedef NS_ENUM(NSInteger, HXYAlertControllerStyle) {
    HXYAlertControllerStyleActionSheet = 0,
    HXYAlertControllerStyleAlert
} ;

@interface HXYAlertViewController : UIViewController
+ (instancetype)HXYAlertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message preferredStyle:(HXYAlertControllerStyle)preferredStyle;
@end
