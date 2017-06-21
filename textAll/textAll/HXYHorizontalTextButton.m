//
//  HXYHorizontalTextButton.m
//  textAll
//
//  Created by liangqi on 17/6/6.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import "HXYHorizontalTextButton.h"
#import "Masonry.h"
@interface HXYHorizontalTextButton()
@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UILabel *bottomLabel;
@end

@implementation HXYHorizontalTextButton

- (instancetype)initWithSpace:(NSNumber *)space
{
    self = [super init];
    if (self) {
        self.space = space == nil? 4.f : [space floatValue];
        
        
        [self initUI];
    }
    return self;
}



- (void)initUI
{
    [self addSubview:self.topLabel];
    [self addSubview:self.bottomLabel];
    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(self.mas_width);
    }];
    
    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topLabel.mas_bottom).offset(self.space);
        make.height.mas_equalTo(24);
        make.left.equalTo(self);
        make.width.mas_equalTo(self.mas_width);
    }];
}

#pragma mark - getter&setter
- (void)setText:(NSString *)text
{
    _text = text;
    self.topLabel.text =  text;
    [self.topLabel sizeToFit];
}
- (void)setNumber:(NSString *)number
{
    _number = number;
    self.bottomLabel.text = number;
    [self.bottomLabel sizeToFit];
    self.bottomW = self.bottomLabel.bounds.size.width;
}

- (UILabel *)topLabel
{
    if (!_topLabel) {
        _topLabel = [[UILabel alloc]init];
        _topLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13]?[UIFont fontWithName:@"PingFangSC-Regular" size:13]: [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        _topLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.54];
        _topLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _topLabel;
}

- (UILabel *)bottomLabel
{
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc]init];
        _bottomLabel.font = [UIFont systemFontOfSize:20];
        _bottomLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.87];
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _bottomLabel;
}
@end
