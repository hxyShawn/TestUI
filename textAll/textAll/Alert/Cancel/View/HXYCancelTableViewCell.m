//
//  HXYCancelTableViewCell.m
//  manmanda
//
//  Created by liangqi on 17/6/28.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYCancelTableViewCell.h"
#import "Masonry.h"

@interface HXYCancelTableViewCell()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *btn;
@end

@implementation HXYCancelTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.btn];
    
    CGFloat width = 16 * kHeightScale;
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.height.mas_equalTo(width);
        make.left.equalTo(self.contentView).offset(16);
    }];
    
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(width, width));
        make.right.equalTo(self.contentView).offset(-16);
    }];
}

- (void)confCell:(NSString *)title
{
    self.label.text = title;
}
- (void)changeBtnState:(NSInteger)state
{
    //0: 未选中 1:选中 2:对现在取反(这个可能不会用到)
    
    self.btn.selected = state;
}
#pragma mark - getter&setter
- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.textColor = RGBA(0, 0, 0, 0.54);
//        _label.font = PF(Medium, 13);
    }
    return _label;
}

-(UIButton *)btn
{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_btn setImage:img(@"CancelOrderUnSelected") forState:UIControlStateNormal];
//        [_btn setImage:img(@"CancelOrderSelected") forState:UIControlStateSelected];
    }
    return _btn;
}
@end
