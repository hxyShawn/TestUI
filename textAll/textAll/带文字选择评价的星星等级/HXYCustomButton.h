//
//  HXYCustomButton.h
//  manmanda
//
//  Created by liangqi on 17/5/31.
//  Copyright © 2017年 nixinyue. All rights reserved.
//
/*
 HXYCustomButton *button = [[HXYCustomButton alloc]initWithType:HXYCustomButtonDirectionTypeVertical imageSize:CGSizeMake(40, 40) space:@4];
 button.frame = CGRectMake(10, 10, 100, 100);
 [button setImageStr:@"estimateSelected" forState:UIControlStateNormal];
 [button setImageStr:@"estimateUnSelected" forState:UIControlStateSelected];
 [button setText:@"全部人" forState:UIControlStateNormal];
 [button setText:@"么了" forState:UIControlStateSelected];
 [button setTextColor:[UIColor blackColor] forState:UIControlStateNormal];
 [button setTextColor:[UIColor redColor] forState:UIControlStateSelected];
 [button addTarget:self action:@selector(btnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
 [self.view addSubview:button];
 
 HXYCustomButton *horizontalBtn = [[HXYCustomButton alloc]initWithType:HXYCustomButtonDirectionTypeHorizontal imageSize:CGSizeMake(20, 20) space:nil];
 horizontalBtn.frame = CGRectMake(100, 100, 100, 22);
 [horizontalBtn setImageStr:@"estimateSelected" forState:UIControlStateNormal];
 [horizontalBtn setImageStr:@"estimateUnSelected" forState:UIControlStateSelected];
 [horizontalBtn setText:@"全部" forState:UIControlStateNormal];
 [horizontalBtn setText:@"么了" forState:UIControlStateSelected];
 [horizontalBtn setTextColor:[UIColor greenColor] forState:UIControlStateNormal];
 [horizontalBtn setTextColor:[UIColor redColor] forState:UIControlStateSelected];
 [horizontalBtn addTarget:self action:@selector(btnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
 [self.view addSubview:horizontalBtn];
 */
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, HXYCustomButtonDirectionType) {
    HXYCustomButtonDirectionTypeHorizontal,
    HXYCustomButtonDirectionTypeVertical
};
@interface HXYCustomButton : UIButton

/**
 只能用这个初始化,

 @param directionType directionType 横向还是纵向
 @param imageSize imageSize 图片的size,可以不传,不传默认20,20
 @param space 图片按钮之间的间距 不传默认8.f
 @return 实例
 */
- (instancetype)initWithType:(HXYCustomButtonDirectionType )directionType imageSize:(CGSize)imageSize space:(NSNumber *)space;

@property (nonatomic, assign) HXYCustomButtonDirectionType  buttonDirectionType;

/*控件,似乎不应该写出来的样子*/
@property (nonatomic, strong) UIImageView *imgv;
@property (nonatomic, strong) UILabel *label;

/*直接在这里把该设置的设置好*/
- (void)setText:(nullable NSString *)text forState:(UIControlState)state;
- (void)setTextColor:(nullable UIColor *)color forState:(UIControlState)state;
- (void)setImageStr:(nullable NSString *)imageStr forState:(UIControlState)state;

/*以下暂时没有写对应的使用,说白了就是看的*/
/*想要将图片显示成的size*/
@property (nonatomic, assign) CGSize imageSize;
/** 图片和标签之间的间隙 */
@property(nonatomic, assign) CGFloat space;


@end
