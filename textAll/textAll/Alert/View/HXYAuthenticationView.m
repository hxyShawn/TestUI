//
//  HXYAuthenticationView.m
//  manmanda
//
//  Created by liangqi on 17/7/1.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYAuthenticationView.h"
#import <Masonry/Masonry.h>
#import "NSString+HXYCategory.h"
@interface HXYAuthenticationView()<UITextFieldDelegate>
@property (nonatomic, copy) NSArray *array;
@property (nonatomic, copy) NSString *titleStr;
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, strong) UITextField *tf;
@end
@implementation HXYAuthenticationView

- (instancetype)initWithTitle:(NSString *)titleStr placeholder:(NSString *)placeholder
{
    self = [super init];
    if (self) {
        self.titleStr = titleStr;
        self.placeholder = placeholder;
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    UIView *topView = [[UIView alloc]init];
    [self addSubview:topView];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.equalTo(self.mas_height).with.multipliedBy(0.26);
    }];
    
    UILabel *titleLable = [[UILabel alloc]init];
    titleLable.text = self.titleStr;
    titleLable.textColor = RGBA(0, 0, 0, 0.87);
//    titleLable.font = PF(Medium, 13);
    titleLable.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:titleLable];
    
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topView.mas_centerX);
        make.centerY.equalTo(topView.mas_centerY);
        
    }];
    
    UIView *middleView = [[UIView alloc]init];
    [self addSubview:middleView];
    [middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(topView.mas_bottom);
        make.height.equalTo(self.mas_height).with.multipliedBy(0.26);
    }];
    self.tf = [[UITextField alloc]init];
//    self.tf.attributedPlaceholder = [[NSAttributedString alloc]initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName : RGBA(0, 0, 0, 0.75),NSFontAttributeName : PF(Medium, 14)}];
    self.tf.keyboardType = UIKeyboardTypeDefault;
    self.tf.delegate = self;
    [middleView addSubview:self.tf];
    [self.tf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(middleView);
        make.left.equalTo(middleView).offset(16);
    }];
    
    UIView *topLine = [[UIView alloc]init];
    topLine.backgroundColor = UIColorFromRGB(SepratorColor);
    [middleView addSubview:topLine];
    UIView *bottomLine = [[UIView alloc]init];
    bottomLine.backgroundColor = UIColorFromRGB(SepratorColor);
    [middleView addSubview:bottomLine];
    [topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(middleView);
        make.height.equalTo(@0.5);
    }];
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(middleView);
        make.height.equalTo(@0.5);
    }];
    
    
    UIView *bottomView = [[UIView alloc]init];
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(middleView.mas_bottom);
        make.left.right.equalTo(self);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    self.btnArray = [NSMutableArray array];
    NSArray *array = @[@"取消",@"确定"];
    NSArray *titleColorArray = @[RGBA(0, 0, 0, 0.75),[UIColor whiteColor]];
//    NSArray *bgColorArray = @[[UIColor whiteColor],UIColorFromRGB(NewPinkValue)];
    
    UIView *lastSpaceView = [[UIView alloc]init];
    [bottomView addSubview:lastSpaceView];
    
    [lastSpaceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(bottomView);
    }];
    for (NSUInteger i =0; i<array.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:titleColorArray[i] forState:UIControlStateNormal];
//        [btn setBackgroundColor:bgColorArray[i]];
//        btn.titleLabel.font = PF(Regular, 14);
        [bottomView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lastSpaceView.mas_right);
            make.centerY.equalTo(bottomView.mas_centerY);
            make.height.equalTo(bottomView.mas_height).multipliedBy(0.5);
            make.width.equalTo(bottomView.mas_width).multipliedBy(0.3);
        }];
        [btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnArray addObject:btn];
        
        UIView *spaceView = [[UIView alloc]init];
        [bottomView addSubview:spaceView];
        
        [spaceView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btn.mas_right).with.priorityHigh();
            make.top.bottom.equalTo(bottomView);
            make.width.equalTo(lastSpaceView.mas_width);
        }];
        lastSpaceView = spaceView;
    }
    [lastSpaceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(bottomView.mas_right);
    }];
    [self layoutIfNeeded];
    for (UIButton *btn in self.btnArray) {
        if (btn.tag == 1) {
            btn.layer.cornerRadius = 32*kHeightScale/2;
            [btn clipsToBounds];
        }
    }
}

- (void)BtnClick:(UIButton *)btn
{
    NSString *authenticationInfo = self.tf.text;
    NSInteger code = 0;
    NSString *msg = nil;
    if ([NSString isNullOrEmpty:authenticationInfo]) {
        //1的时候显示msg
        code = 1;
        msg = @"请输入验证码";
    }else{
        code = 0;
        msg = @"已经输入验证码";
    }
    
    if ([_delegate respondsToSelector:@selector(HXYAuthenticationView:didSelctedAtIndex: authenticationInfo:)]) {
        [_delegate HXYAuthenticationView:self didSelctedAtIndex:btn.tag authenticationInfo:@{@"code":@(code),@"msg":msg,@"info":authenticationInfo}];
    }
}
@end
