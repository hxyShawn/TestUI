//
//  HXYCustomButton.m
//  manmanda
//
//  Created by liangqi on 17/5/31.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYCustomButton.h"
#import <Masonry.h>
@interface HXYCustomButton()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *imgv;
@end

@implementation HXYCustomButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.label];
        [self addSubview:self.imgv];
        [self confUI];
    }
    return self;
}

- (void)confUI
{
    [self.imgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(self.imgv.mas_bottom).offset(8);
        make.height.mas_equalTo(17);
    }];
}

- (void)setText:(NSString *)text
{
    _text = text;
    self.label.text = text;
}

- (UIImageView *)imgv
{
    if (!_imgv) {
        _imgv = [[UIImageView alloc]init];
    }
    return _imgv;
}
- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.26];
        _label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12]?[UIFont fontWithName:@"PingFangSC-Regular" size:12]: [UIFont fontWithName:@"PingFang-SC-Regular" size:12];
    }
    return _label;
}
- (void)setImage:(UIImage *)image
{
    _image = image;
    self.imgv.image = image;
}
@end
