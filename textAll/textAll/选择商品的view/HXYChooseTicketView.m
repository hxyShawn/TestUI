//
//  HXYChooseTicketView.m
//  manmanda
//
//  Created by liangqi on 17/5/6.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYChooseTicketView.h"
#import "BaseViewFactory.h"
#import "HXYChangeCntView.h"
#import "UIColor+HXYCategory.h"

static const CGFloat leading = 16;
static const CGFloat top = 13;
static const CGFloat height = 29;
static const CGFloat margin = 16;
@interface HXYChooseTicketView()<HXYChangeCntViewDelegate>
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UIButton *deleteBtn;
@property (nonatomic, strong) HXYChangeCntView *changeCntView;
@end

@implementation HXYChooseTicketView

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
    }
    return _timeLabel;
}

- (UIButton *)deleteBtn
{
    if (!_deleteBtn) {
        UIImage *image = [UIImage imageNamed:@"activity_choose_deleteBtn"];
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteBtn setBackgroundImage:image forState:UIControlStateNormal];
        [_deleteBtn addTarget:self action:@selector(deleteBtnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _deleteBtn.frame = CGRectMake(self.changeCntView.left - 16 - image.size.width, (self.height - image.size.height)/2, image.size.width, image.size.height);
    }
    return _deleteBtn;
}

- (HXYChangeCntView *)changeCntView
{
    if (!_changeCntView) {
        _changeCntView = [[HXYChangeCntView alloc]initWithFrame:CGRectMake(self.width - margin - 132, top, 132, height)];
        _changeCntView.delegate = self;
        
    }
    return _changeCntView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.cnt = 1;
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    [self addSubview:self.changeCntView];
    [self addSubview:self.timeLabel];
    [self addSubview:self.deleteBtn];
}

- (void)deleteBtnBtnClick:(UIButton *)btn
{
    if ([_delegate respondsToSelector:@selector(deleteViewAtIndexPath:)]) {
        [_delegate deleteViewAtIndexPath:self.indexPath];
    }
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:13]?[UIFont fontWithName:@"PingFangSC-Regular" size:13]:[UIFont fontWithName:@"PingFang-SC-Regular" size:13];
    NSDictionary *dict = @{NSFontAttributeName :font, NSForegroundColorAttributeName : [UIColor colorWithHexString:@"0x000000" alpha:0.54], NSKernAttributeName : @0.87};
    NSAttributedString *attrStr = [[NSAttributedString alloc]initWithString:title attributes:dict];
    self.timeLabel.attributedText = attrStr;
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(leading, top, self.timeLabel.width, self.timeLabel.height);
}

#pragma mark - HXYChangeCntViewDelegate
- (void)cntDecrease:(NSInteger)num
{
    self.cnt++;
}

-(void)cntIncrease:(NSInteger)num
{
    if (self.cnt > 1) {
        
        self.cnt --;
    }
}

@end
