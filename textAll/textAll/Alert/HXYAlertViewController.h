//
//  HXYAlertViewController.h
//  manmanda
//
//  Created by liangqi on 17/7/1.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HXYAlertViewControllerDelegate;
@interface HXYAlertViewController : UIViewController
@property (nonatomic, copy) NSString *titleStr;    //最上面那个
@property (nonatomic, copy) NSString *contentStr;   //中间的
@property (nonatomic, assign) id<HXYAlertViewControllerDelegate>delegate;

- (instancetype)initWithAuthenticationAlertView:(NSString *)titleStr placeHolder:(NSString *)placeHolder;

- (instancetype)initWithConfirmTitle:(NSString *)title;
@end

@protocol HXYAlertViewControllerDelegate <NSObject>

- (void)HXYAlertViewController:(HXYAlertViewController *)alertViewController didChooseItem:(NSInteger )index;

@end
