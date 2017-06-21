//
//  HXYShopChooseView.m
//  manmanda
//
//  Created by liangqi on 17/4/28.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYShopChooseView.h"
#import "TTTAttributedLabel.h"
#import "UIView+YYAdd.h"
#import "UIButton+HXYCategory.h"
#import "UILabel+HXYCategory.h"
#import "NSString+HXYCategory.h"


@interface HXYShopChooseView()


@end

@implementation HXYShopChooseView

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}
- (UIView *)line
{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = UIColorFromRGB(0xDADADA);
//        [self addSubview:_line];
    }
    return _line;
}

- (void)setDataWithDic:(NSDictionary *)dict{}

- (CGFloat)heightWithDic:(NSDictionary *)dict{return  0;}

@end
