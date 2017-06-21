//
//  HXYChangeCntView.h
//  manmanda
//
//  Created by liangqi on 17/5/6.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HXYChangeCntViewDelegate <NSObject>

- (void)cntIncrease:(NSInteger)num;
- (void)cntDecrease:(NSInteger)num;

@end

/**
 商品什么加减数量,建议宽度130,如果label变大会改变
 */
@interface HXYChangeCntView : UIView
@property (nonatomic, assign) NSUInteger cnt;
@property (nonatomic, assign) CGFloat  viewW;
@property (nonatomic, assign) id<HXYChangeCntViewDelegate>delegate;
@end
