//
//  HXYCancelOrderViewController.h
//  manmanda
//
//  Created by liangqi on 17/6/28.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HXYCancelOrderViewControllerDelegate;

/**
 使用这个的时候需要先给这个类的实例设置
 HXYCancelOrderViewController *vc = modalPresentationStyle = UIModalPresentationOverCurrentContext;[[HXYCancelOrderViewController alloc]init];
 vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
 7以上是给presentingVC(将要弹出的)设置 8是给presentedVC(被弹出的)设置
 */
@interface HXYCancelOrderViewController : UIViewController
@property (nonatomic, assign) NSInteger  toBeCanceledId;
@property (nonatomic, assign) id<HXYCancelOrderViewControllerDelegate>delegate;

@property (nonatomic, copy) void(^confirmCancel)(NSInteger ID);
@end

@protocol HXYCancelOrderViewControllerDelegate <NSObject>

- (void)HXYCancelOrderViewController:(HXYCancelOrderViewController *)vc confirmCancelID:(NSInteger )ID;


@end
