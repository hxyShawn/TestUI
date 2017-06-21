//
//  HXYShopChooseTextView.m
//  manmanda
//
//  Created by liangqi on 17/5/2.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYShopChooseTextView.h"
#import "NSString+HXYCategory.h"
#import "UIView+YYAdd.h"
#import "UIColor+HXYCategory.h"
#import "TTTAttributedLabel.h"
@interface HXYShopChooseTextView()

@property (nonatomic, strong) TTTAttributedLabel *contentLabel;
@property (nonatomic, assign) CGFloat  viewH;
@end

@implementation HXYShopChooseTextView

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[TTTAttributedLabel alloc]init];
        _contentLabel.numberOfLines = 0;
        UIFont *itemFont = [UIFont fontWithName:@"PingFangSC-Regular" size:13]?[UIFont fontWithName:@"PingFangSC-Regular" size:13]: [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        _contentLabel.font = itemFont;
        
    }
    return _contentLabel;
}

- (void)setDataWithDic:(NSDictionary *)dict
{
    self.title = dict[@"title"];
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Medium" size:15]?[UIFont fontWithName:@"PingFangSC-Medium" size:15]: [UIFont fontWithName:@"PingFang-SC-Medium" size:15];
    NSDictionary *attrDict = @{NSFontAttributeName : font,NSForegroundColorAttributeName : RGBA(0, 0, 0, 0.86), NSKernAttributeName : @1.0};
    self.titleLabel.attributedText = [[NSAttributedString alloc]initWithString:self.title attributes:attrDict];
    [self.titleLabel sizeToFit];
    self.titleLabel.frame = CGRectMake(16, 14, self.titleLabel.width, self.titleLabel.height);
    
    
    self.viewH = self.titleLabel.bottom;
    
    [self addSubview:self.contentLabel];
    NSString *content = dict[@"datas"];
    UIFont *contentFont = [UIFont fontWithName:@"PingFangSC-Regular" size:13]?[UIFont fontWithName:@"PingFangSC-Regular" size:13]: [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
    NSDictionary *contentDic = @{NSFontAttributeName : contentFont,NSKernAttributeName : @1.0, NSForegroundColorAttributeName : [UIColor colorWithHexString:@"000000" alpha:0.54]};
    self.contentLabel.attributedText = [[NSAttributedString alloc]initWithString:content attributes:contentDic];
    self.contentLabel.frame = CGRectMake(16, self.titleLabel.bottom + 9, ScreenWidth - 26, [content heightWithAttributes:contentDic size:CGSizeMake(ScreenWidth - 26, MAXFLOAT)]);
    
    self.line.frame = CGRectMake(16, self.contentLabel.bottom + 12 - 0.5, ScreenWidth - 16, 0.5);
    [self addSubview:self.line];
}
- (CGFloat)heightWithDic:(NSDictionary *)dict
{
    NSString *content = dict[@"datas"];
        UIFont *contentFont = [UIFont fontWithName:@"PingFangSC-Regular" size:13]?[UIFont fontWithName:@"PingFangSC-Regular" size:13]: [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
    NSDictionary *attDic = @{NSFontAttributeName : contentFont,NSKernAttributeName : @1.0};
    
    CGFloat height = [content heightWithAttributes:attDic size:CGSizeMake(ScreenWidth - 26, MAXFLOAT)];
    
    self.viewH += height + 12 + 43;
    
    return self.viewH;
}
@end
