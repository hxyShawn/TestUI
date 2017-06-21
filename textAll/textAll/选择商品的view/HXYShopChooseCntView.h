//
//  HXYShopChooseCntView.h
//  manmanda
//
//  Created by liangqi on 17/5/3.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HXYKVOArrayModel.h"
@interface HXYShopChooseCntView : UIView
@property (nonatomic, assign) NSUInteger cnt;
@property (nonatomic, assign) CGFloat  viewH;
@property (nonatomic, strong) HXYKVOArrayModel *ticketsModel;
@property (nonatomic, strong) UITableView *ticketsView;
- (void)priceChange:(NSInteger)singlePrice count:(NSInteger)count;

- (void)addTicketViewWithType:(NSString *)type item:(UIButton *)item;
- (void)deleteTicketViewWithType:(NSString *)type item:(UIButton *)item;
- (void)adjustContent;
@end
