//
//  HXYChangeCntView.m
//  manmanda
//
//  Created by liangqi on 17/5/6.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYChangeCntView.h"
#import "UIView+YYAdd.h"
#import "UIColor+HXYCategory.h"
#import "BaseViewFactory.h"
@interface HXYChangeCntView()

@property (nonatomic, strong) UIButton *plusBtn;
@property (nonatomic, strong) UILabel *cntLabel;
@property (nonatomic, strong) UIButton *minusBtn;
@property (nonatomic, strong) UIView *line;
@end

@implementation HXYChangeCntView

-(UIView *)line
{
    if (!_line) {
        _line = [[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height - 0.5, ScreenWidth, 0.5)];
        _line.backgroundColor = [UIColor colorWithHexString:kSepratorColor];
    }
    return _line;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    //MARK: 如果cnt为0 暂时默认他是未初始化的
    if (self.cnt == 0) {
        self.cnt = 1;
    }
    
    CGFloat btnW = 40;
    CGFloat btnH = 29;
    
    
    
    UIButton *minusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:minusBtn];
    [minusBtn setBackgroundImage:[UIImage imageNamed:@"minusBtn"] forState:UIControlStateNormal];
    [minusBtn addTarget:self action:@selector(minusBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.minusBtn = minusBtn;
    self.minusBtn.frame = CGRectMake(0, 0, btnW, btnH);
    
    UILabel *cntLabel = [BaseViewFactory label];
    [self addSubview:cntLabel];
    self.cntLabel = cntLabel;
    self.cntLabel.textAlignment = NSTextAlignmentCenter;
    self.cntLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.cnt];
    CGFloat cntY = (btnH - 16) /2;
    self.cntLabel.frame = CGRectMake(self.minusBtn.right + 16, cntY, 20, 16);
    
    
    UIButton *plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:plusBtn];
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"plusBtn"] forState:UIControlStateNormal];
    [plusBtn addTarget:self action:@selector(plusBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.plusBtn = plusBtn;
    self.plusBtn.frame = CGRectMake(self.cntLabel.right + 16, 0, btnW, btnH);
    
//    [self addSubview:self.line];
}

//???: 一次购票的上限?
- (void)plusBtnClick:(UIButton *)btn
{
    self.cnt ++;
    if ([_delegate respondsToSelector:@selector(cntIncrease:)]) {
        [_delegate cntIncrease:1];
    }
}

- (void)minusBtnClick:(UIButton *)btn
{
    if (self.cnt >1 ) {
        self.cnt --;
    }
    if ([_delegate respondsToSelector:@selector(cntDecrease:)]) {
        [_delegate cntDecrease:-1];
    }
    
}

- (void)setCnt:(NSUInteger)cnt
{
    _cnt = cnt;
    
    self.cntLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.cnt];
}
@end
