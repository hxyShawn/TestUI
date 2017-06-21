//
//  HXYShopChooseItemsView.h
//  manmanda
//
//  Created by liangqi on 17/5/2.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYShopChooseView.h"
@protocol HXYShopChooseItemsViewDelegate;


/**
 票务类型,票务种类,票务时间的view
 */
@interface HXYShopChooseItemsView : HXYShopChooseView

@property (nonatomic, copy) NSArray *typeArray;

@property (nonatomic, copy) void(^itemClick)(NSInteger tag);

@property (nonatomic, assign) id<HXYShopChooseItemsViewDelegate>delegate;

@end

@protocol HXYShopChooseItemsViewDelegate <NSObject>

- (void)HXYShopChooseItemsView:(HXYShopChooseItemsView*)chooseItemsView didSelectItem:(UIButton *)item;

@end
