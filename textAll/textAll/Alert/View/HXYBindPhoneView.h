//
//  HXYBindPhoneView.h
//  manmanda
//
//  Created by liangqi on 17/7/3.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HXYBindPhoneViewDelegate;
@interface HXYBindPhoneView : UIView
- (instancetype)initWithConfirmTitle:(NSString *)title;
@property (nonatomic, assign) id<HXYBindPhoneViewDelegate>delegate;
@end

@protocol HXYBindPhoneViewDelegate <NSObject>

- (void)HXYBindPhoneView:(HXYBindPhoneView *)view didSelect:(NSInteger)tag;

@end
