//
//  HXYAuthenticationView.h
//  manmanda
//
//  Created by liangqi on 17/7/1.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HXYAuthenticationViewDelegate;
@interface HXYAuthenticationView : UIView

@property (nonatomic, assign) id<HXYAuthenticationViewDelegate>  delegate;


- (instancetype)initWithTitle:(NSString *)titleStr placeholder:(NSString *)placeholder;
@end
@protocol HXYAuthenticationViewDelegate <NSObject>


/**
 点击协议

 @param view 自己
 @param index 点的是确定还是取消
 @param dict 1:code,0表示已经输入验证码,1没有验证码. 2: msg,提示信息 3:验证码的内容
 */
- (void)HXYAuthenticationView:(HXYAuthenticationView *)view didSelctedAtIndex:(NSInteger)index authenticationInfo:(NSDictionary *)dict;

@end
