//
//  HXYBindPhoneView.m
//  manmanda
//
//  Created by liangqi on 17/7/3.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYBindPhoneView.h"
#import <Masonry.h>

@interface HXYBindPhoneView()
@property (nonatomic, copy) NSString *title;
@end
@implementation HXYBindPhoneView

- (instancetype)initWithConfirmTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.title = title;
        [self confUI];
    }
    return self;
}

- (void)confUI
{
    UIImageView *imgv = [[UIImageView alloc]init];
    imgv.image = img(@"bindPhone");
    [self addSubview:imgv];
    
    [imgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo(self.mas_width).multipliedBy(0.525);
        make.height.equalTo(self.mas_height).multipliedBy(0.43);
        make.top.equalTo(self).mas_offset(20*kHeightScale);
    }];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"为了您的账户安全\n请先设置密码哦~";
    label.numberOfLines = 2;
    label.font =PF(Regular, adjustFontSize(13));
    label.textColor = RGBA(0, 0, 0, 0.54);
    [self addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(imgv.mas_bottom).offset(8);
    }];
    
    UIView *bottomView = [[UIView alloc]init];
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(label.mas_bottom);
        make.bottom.equalTo(self);
    }];
    
    NSMutableArray *btnArray = [NSMutableArray array];
    NSArray *array = @[@"取消",self.title];
    NSArray *titleColorArray = @[RGBA(0, 0, 0, 0.75),[UIColor whiteColor]];
    NSArray *bgColorArray = @[[UIColor whiteColor],UIColorFromRGB(NewPinkValue)];
    
    UIView *lastSpaceView = [[UIView alloc]init];
    [bottomView addSubview:lastSpaceView];
    
    [lastSpaceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(bottomView);
    }];
    for (NSUInteger i =0; i<array.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:titleColorArray[i] forState:UIControlStateNormal];
        [btn setBackgroundColor:bgColorArray[i]];
        btn.titleLabel.font = PF(Regular, 14);
        [bottomView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lastSpaceView.mas_right);
            make.centerY.equalTo(bottomView.mas_centerY);
            make.height.equalTo(bottomView.mas_height).multipliedBy(0.5);
            make.width.equalTo(bottomView.mas_width).multipliedBy(0.3);
        }];
        [btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btnArray addObject:btn];
        
        UIView *spaceView = [[UIView alloc]init];
        [bottomView addSubview:spaceView];
        
        [spaceView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btn.mas_right).with.priorityHigh();
            make.top.bottom.equalTo(bottomView);
            make.width.equalTo(lastSpaceView.mas_width);
        }];
        lastSpaceView = spaceView;
    }
    [lastSpaceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(bottomView.mas_right);
    }];
    [self layoutIfNeeded];
    for (UIButton *btn in btnArray) {
        if (btn.tag == 1) {
            btn.layer.cornerRadius = 32*kHeightScale/2;
            [btn clipsToBounds];
        }
    }
}

- (void)BtnClick:(UIButton *)btn
{
    if ([_delegate respondsToSelector:@selector(HXYBindPhoneView:didSelect:)]) {
        [_delegate HXYBindPhoneView:self didSelect:btn.tag];
    }
}
@end
