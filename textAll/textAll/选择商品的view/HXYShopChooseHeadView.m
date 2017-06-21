//
//  HXYShopChooseHeadView.m
//  manmanda
//
//  Created by liangqi on 17/5/3.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYShopChooseHeadView.h"
#import "UIColor+HXYCategory.h"
#import "UIView+YYAdd.h"
static const CGFloat leading = 16;

@interface HXYShopChooseHeadView()

@property (nonatomic, strong) UIImageView *imgv;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, strong) HXYShopHeadModel *model;
@property (nonatomic, strong) UIView *line;
@end

@implementation HXYShopChooseHeadView

- (UIView *)line
{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = UIColorFromRGB(0xDADADA);
        //        [self addSubview:_line];
    }
    return _line;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
        [self initUI];
    }
    return self;
}
- (void)initUI
{
    UIImageView *imgv = [[UIImageView alloc]init];
    [self addSubview:imgv];
    self.imgv = imgv;
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *priceLabel = [[UILabel alloc]init];
    [self addSubview:priceLabel];
    self.priceLabel = priceLabel;
    
    UILabel *countLabel = [[UILabel alloc]init];
    [self addSubview:countLabel];
    self.countLabel = countLabel;
    
    [self addSubview:self.line];
}

- (void)initData
{
    
}

- (void)setDataWithModel:(HXYShopHeadModel *)model
{
    self.model = model;
    
    self.imgv.frame = CGRectMake(leading, - 20, 100, 100);
    self.imgv.backgroundColor = [UIColor greenColor];
    
    self.titleLabel.frame = CGRectMake(self.imgv.right + leading, 10, ScreenWidth - 132-30, 20);
    NSDictionary *titleDic = @{NSFontAttributeName : [UIFont systemFontOfSize:15],NSForegroundColorAttributeName : [UIColor colorWithHexString:@"0x000000" alpha:0.87], NSKernAttributeName : @0.75};
    self.titleLabel.attributedText = [[NSAttributedString alloc]initWithString:model.title attributes:titleDic];
    
    NSDictionary *priceDic = @{NSFontAttributeName : [UIFont systemFontOfSize:20],NSForegroundColorAttributeName : [UIColor colorWithHexString:@"FF6FA2"], NSKernAttributeName : @1};
    self.priceLabel.attributedText = [[NSAttributedString alloc]initWithString:model.price attributes:priceDic];
    [self.priceLabel sizeToFit];
    self.priceLabel.frame = CGRectMake(self.imgv.right + leading, self.titleLabel.top + 35, self.priceLabel.width, self.priceLabel.height);
     
    NSDictionary *countDic = @{NSFontAttributeName : [UIFont systemFontOfSize:13],NSForegroundColorAttributeName : [UIColor colorWithHexString:@"0x000000" alpha:0.54], NSKernAttributeName : @0.65};
    self.countLabel.attributedText = [[NSAttributedString alloc]initWithString:@"数量: 1" attributes:countDic];
    [self.countLabel sizeToFit];
    self.countLabel.frame = CGRectMake(ScreenWidth - self.countLabel.width - leading, self.titleLabel.top + 40, self.countLabel.width, self.countLabel.height);
    
    self.line.frame = CGRectMake(leading, self.imgv.bottom + 19 - 0.5, ScreenWidth - leading, 0.5);

}
@end
