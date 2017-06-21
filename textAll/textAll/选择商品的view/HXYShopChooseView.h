//
//  HXYShopChooseView.h
//  manmanda
//
//  Created by liangqi on 17/4/28.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+YYAdd.h"
#import "TTTAttributedLabel.h"
/**
 其他两个view的抽奖基类
 */
@interface HXYShopChooseView : UIView

@property (nonatomic, copy)   NSString *title;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *line;


- (void)setDataWithDic:(NSDictionary *)dict;

- (CGFloat)heightWithDic:(NSDictionary *)dict;

@end
