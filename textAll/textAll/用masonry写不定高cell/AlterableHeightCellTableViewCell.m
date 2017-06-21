//
//  AlterableHeightCellTableViewCell.m
//  textAll
//
//  Created by liangqi on 17/6/8.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import "AlterableHeightCellTableViewCell.h"

@interface AlterableHeightCellTableViewCell()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@end

@implementation AlterableHeightCellTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}
- (void)initUI
{
    CGFloat padding = 8;
    CGFloat space = 4;
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(padding);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-padding);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(self.contentView).offset(space);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(padding);
        make.right.mas_equalTo(self.contentView).offset(-padding);
        make.top.mas_equalTo(self.icon.mas_bottom).offset(space).with.priority(751);
        make.height.mas_equalTo(20);
    }];
    self.contentLabel.preferredMaxLayoutWidth = ScreenWidth - padding *2;
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(padding);
        make.right.mas_equalTo(self.contentView).offset(-padding);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(space);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-space).with.priority(749);
    }];
}


- (void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    self.titleLabel.text = titleStr;
}
- (void)setContentStr:(NSString *)contentStr
{
    _contentStr = contentStr;
    self.contentLabel.text = contentStr;
}
- (void)setData:(NSDictionary *)data
{
    _data = data;
    
}
#pragma mark - getter&setter
- (UIImageView *)icon
{
    if (!_icon) {
        _icon = [[UIImageView alloc]init];
        _icon.image = [UIImage imageNamed:@"doge"];
    }
    return _icon;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}
@end
