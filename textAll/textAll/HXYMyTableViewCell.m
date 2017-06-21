//
//  HXYMyTableViewCell.m
//  个人界面
//
//  Created by 贺东方 on 17/5/27.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import "HXYMyTableViewCell.h"

#import "TTTAttributedLabel.h"
@interface HXYMyTableViewCell()
@property (nonatomic, strong) UIImageView *imgv;
@property (nonatomic, strong) TTTAttributedLabel *label;
@property (nonatomic, strong) TTTAttributedLabel *subLabel;
@property (nonatomic, strong) UIImageView *arrowheadImgv;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, assign) CGSize  imgSize;
@property (nonatomic, assign) CGSize  arrowheadImgvSize;

@end

@implementation HXYMyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.imgv];
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.subLabel];
        [self.contentView addSubview:self.arrowheadImgv];
        [self.contentView addSubview:self.line];
        [self initUI];
    }
    return self;
}


- (void)initUI
{
    [self.imgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(self.contentView).offset(16);
    }];
    
    [self.arrowheadImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-16);
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(self.imgv.mas_right).offset(16);
    }];
    
    [self.subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.right.mas_equalTo(self.arrowheadImgv.mas_left).offset(-16);
        
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.label.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.contentView.mas_bottom).offset(-0.5);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
}
+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}

- (void)updateConstraints
{
    [self.imgv mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(self.contentView).offset(16);
        make.size.mas_equalTo(self.imgSize);
    }];
    
    [self.arrowheadImgv mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-16);
        make.size.mas_equalTo(self.arrowheadImgvSize);
    }];
    
    [self.label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(self.imgv.mas_right).offset(16);
    }];
    
    [self.subLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.right.mas_equalTo(self.arrowheadImgv.mas_left).offset(-16);
        
    }];
    
    [self.line mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.label.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.contentView.mas_bottom).offset(-0.5);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    [super updateConstraints];
}

#pragma mark - getter&setter
- (UIImageView *)imgv
{
    if (!_imgv) {
        _imgv = [[UIImageView alloc]init];
        _imgv.userInteractionEnabled = YES;
    }
    return  _imgv;
}

- (TTTAttributedLabel *)label
{
    if (!_label) {
        _label = [[TTTAttributedLabel alloc]initWithFrame:CGRectZero];
        _label.font = [UIFont fontWithName:@"PingFangSC-Medium" size:13]?[UIFont fontWithName:@"PingFangSC-Medium" size:13]: [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
        _label.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.54];
        _label.userInteractionEnabled = YES;
    }
    return _label;
}

- (TTTAttributedLabel *)subLabel
{
    if (!_subLabel) {
        _subLabel = [[TTTAttributedLabel alloc]initWithFrame:CGRectZero];
        _subLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:11]?[UIFont fontWithName:@"PingFangSC-Medium" size:11]: [UIFont fontWithName:@"PingFang-SC-Medium" size:11];
        _subLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.26];
        _subLabel.userInteractionEnabled = YES;
    }
    return _subLabel;
}

- (UIImageView *)arrowheadImgv
{
    if (!_arrowheadImgv) {
        _arrowheadImgv = [[UIImageView alloc]init];
        UIImage *img = [UIImage imageNamed:@"me-nextArrowhead"];
        _arrowheadImgv.image = img;
        self.arrowheadImgvSize = img.size;
    }
    return _arrowheadImgv;
}

- (void)setText:(NSString *)text
{
    _text = text;
    self.label.text = text;
    [self.label sizeToFit];
}

- (void)setSubText:(NSString *)subText
{
    _subText = subText;
    self.subLabel.text = subText;
    [self.subLabel sizeToFit];
}

- (void)setHeadImage:(NSString *)headImage
{
    _headImage = headImage;
    UIImage *img = [UIImage imageNamed:headImage];
    self.imgv.image = img;
    self.imgSize = img.size;
}
- (UIView *)line
{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = UIColorFromRGB(SepratorColor);
    }
    return _line;
}
@end
