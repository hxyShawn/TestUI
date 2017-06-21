//
//  HXYCustomButton.m
//  manmanda
//
//  Created by liangqi on 17/5/31.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYCustomButton.h"

@interface HXYCustomButton()
//显示内容
@property (nonatomic, copy) NSString *normalText;
@property (nonatomic, copy) NSString *selectedText;
@property (nonatomic, copy) NSString *normalImageStr;
@property (nonatomic, copy) NSString *selectedImageStr;
@property (nonatomic, strong) UIColor *normalTextCorlor;
@property (nonatomic, strong) UIColor *selectedTextCorlor;

@property (nonatomic, copy) NSString *currentText;
@property (nonatomic, copy) NSString *currentImageStr;
@property (nonatomic, strong) UIColor *currentTextColor;
@end

@implementation HXYCustomButton

- (instancetype)initWithType:(HXYCustomButtonDirectionType )directionType imageSize:(CGSize)imageSize space:(NSNumber *)space
{
    self = [super init];
    if (self) {
        self.imageSize = CGSizeEqualToSize(self.imageSize, CGSizeZero) ? imageSize : CGSizeMake(20, 20);
        self.buttonDirectionType = directionType;
        self.space = space == nil? 8.f : [space floatValue];
        self.currentText = self.normalText;
        self.currentTextColor = self.normalTextCorlor;
        self.currentImageStr = self.normalImageStr;
        [self layoutViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imgv];
        [self addSubview:self.label];
    }
    return self;
}

- (void)layoutViews
{
    switch (self.buttonDirectionType) {
        case HXYCustomButtonDirectionTypeVertical:
        {
            [self.imgv mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self);
                make.centerX.mas_equalTo(self.mas_centerX);
                make.size.mas_equalTo(CGSizeMake(20, 20));
            }];
            
            [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.imgv.mas_bottom).offset(self.space);
                make.centerX.mas_equalTo(self.mas_centerX);
                
            }];
        }
            break;
        case HXYCustomButtonDirectionTypeHorizontal:
        {
            [self.imgv mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self);
                make.centerY.mas_equalTo(self.mas_centerY);
                make.size.mas_equalTo(self.imageSize);
                make.right.mas_equalTo(self.label.mas_left).offset(-self.space);
            }];
            
            [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(self.mas_centerY);
                make.left.mas_equalTo(self.imgv.mas_right).offset(self.space);
            }];
        }
            break;
        default:
            break;
    }
}

+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}

- (void)updateConstraints
{
    switch (self.buttonDirectionType) {
        case HXYCustomButtonDirectionTypeVertical:
        {
            [self.imgv mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self);
                make.centerX.mas_equalTo(self.mas_centerX);
                make.size.mas_equalTo(CGSizeMake(20, 20));
            }];
            
            [self.label mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.imgv.mas_bottom).offset(self.space);
                make.centerX.mas_equalTo(self.mas_centerX);
                
            }];
        }
            break;
        case HXYCustomButtonDirectionTypeHorizontal:
        {
            [self.imgv mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self);
                make.centerY.mas_equalTo(self.mas_centerY);
                make.size.mas_equalTo(self.imageSize);
                make.right.mas_equalTo(self.label.mas_left).offset(-self.space);
            }];
            
            [self.label mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(self.mas_centerY);
                make.left.mas_equalTo(self.imgv.mas_right).offset(self.space);
            }];
        }
            break;
        default:
            break;
    }
    [super updateConstraints];
}

#pragma mark - public
- (void)setText:(NSString *)text forState:(UIControlState)state
{
    switch (state) {
        case UIControlStateNormal:
            self.normalText = text;
            break;
        case UIControlStateSelected:
            self.selectedText = text;
            break;
        default:
            break;
    }
    self.currentText = self.selected?self.selectedText : self.normalText;

    [self updateConstraints];
}

- (void)setTextColor:(UIColor *)color forState:(UIControlState)state
{
    switch (state) {
        case UIControlStateNormal:
            self.normalTextCorlor = color;
            break;
        case UIControlStateSelected:
            self.selectedTextCorlor = color;
            break;
        default:
            break;
    }
    self.currentTextColor = self.selected? self.selectedTextCorlor : self.normalTextCorlor;
    [self updateConstraints];
}

- (void)setImageStr:(NSString *)imageStr forState:(UIControlState)state
{
    switch (state) {
        case UIControlStateNormal:
            self.normalImageStr = imageStr;
            break;
        case UIControlStateSelected:
            self.selectedImageStr = imageStr;
            break;
        default:
            break;
    }
    self.currentImageStr = self.selected? self.selectedImageStr : self.normalImageStr;
    [self updateConstraints];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected: selected];
    if (selected) {
        self.currentText = self.selectedText;
        self.currentTextColor = self.selectedTextCorlor;
        self.currentImageStr = self.selectedImageStr;
    }else{
        self.currentText = self.normalText;
        self.currentTextColor = self.normalTextCorlor;
        self.currentImageStr = self.normalImageStr;
    }
    [self updateConstraints];
}

#pragma mark - getter&setter
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
        _label.textColor = [UIColor blackColor];
        _label.font = [UIFont systemFontOfSize:13];
    }
    return _label;
}

- (void)setCurrentText:(NSString *)currentText
{
    _currentText = currentText;
    self.label.text = currentText;
    [self.label sizeToFit];
}

- (void)setCurrentImageStr:(NSString *)currentImageStr
{
    _currentImageStr = currentImageStr;
    self.imgv.image = [UIImage imageNamed:currentImageStr];
}

- (void)setCurrentTextColor:(UIColor *)currentTextColor
{
    _currentTextColor = currentTextColor;
    self.label.textColor = currentTextColor;
}

@end
