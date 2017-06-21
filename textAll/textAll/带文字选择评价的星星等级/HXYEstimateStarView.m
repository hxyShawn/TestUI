//
//  HXYEstimateStarView.m
//  manmanda
//
//  Created by liangqi on 17/5/31.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYEstimateStarView.h"
#import "HXYCustomButton.h"

@interface HXYEstimateStarView()
@property (nonatomic, copy) NSArray *titleArray;
@property (nonatomic, strong) NSMutableArray *btnArray;

@end

@implementation HXYEstimateStarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
        [self confUI];
    }
    return self;
}

- (void)initUI
{
    NSString *selectedImgName = @"estimateSelected";

    for (int i =0; i<5; i++) {
        HXYCustomButton *button = [[HXYCustomButton alloc]init];
//        button.image = [UIImage imageNamed:selectedImgName];
//        button.text = self.titleArray[i];
        button.selected = YES;
        button.tag = i;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [self.btnArray addObject:button];
    }
}

- (void)confUI
{
    /*
     5个star ,写死宽度,间距可变
     */
    CGFloat btnW = 25;
    //    CGFloat space = (self.frame.size.width - btnW * self.btnArray.count) / (self.btnArray.count + 1);
    CGFloat space = 24;
    HXYCustomButton *lastBtn = nil;
    
    [self.btnArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:btnW leadSpacing:space tailSpacing:space];
    for (HXYCustomButton *btn in self.btnArray) {
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self).offset(0);
            make.top.mas_equalTo(self).offset(16);
        }];
        lastBtn = btn;
    }
}

- (void)btnClick:(UIButton *)btn
{
    self.starCnt = [NSString stringWithFormat:@"%ld",btn.tag];
    NSString *selectedImgName = @"estimateSelected";
    NSString *unSelectedImgName = @"estimateUnSelected";
    for (HXYCustomButton *button in self.btnArray) {
        button.selected = NO;
        if (button.tag <= btn.tag) {
            button.selected = YES;
        }
//        button.image = button.selected? [UIImage imageNamed:selectedImgName]:[UIImage imageNamed:unSelectedImgName];
    }

}

#pragma mark - getter&setter
- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"很差",@"较差",@"一般",@"满意",@"很好"];
    }
    return _titleArray;
}

- (NSMutableArray *)btnArray
{
    if (!_btnArray) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}
@end
