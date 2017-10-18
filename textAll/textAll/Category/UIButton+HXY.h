//
//  UIButton+HXY.h
//  textAll
//
//  Created by 贺东方 on 2017/10/16.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//
/**
 button 的样式，以图片为基准
 
 - HXYButtonLayoutTypeNormal: button 默认样式：内容居中-图左文右
 - HXYButtonLayoutTypeCenterImageRight: 内容居中-图右文左
 - HXYButtonLayoutTypeCenterImageTop: 内容居中-图上文下
 - HXYButtonLayoutTypeCenterImageBottom: 内容居中-图下文上
 - HXYButtonLayoutTypeLeftImageLeft: 内容居左-图左文右
 - HXYButtonLayoutTypeLeftImageRight: 内容居左-图右文左
 - HXYButtonLayoutTypeRightImageLeft: 内容居右-图左文右
 - HXYButtonLayoutTypeRightImageRight: 内容居右-图右文左
 */
typedef NS_ENUM(NSInteger, ButtonLayoutType) {
    ButtonLayoutTypeNormal = 0,
    ButtonLayoutTypeCenterImageRight,
    ButtonLayoutTypeCenterImageTop,
    ButtonLayoutTypeCenterImageBottom,
    ButtonLayoutTypeLeftImageLeft,
    ButtonLayoutTypeLeftImageRight,
    ButtonLayoutTypeRightImageLeft,
    ButtonLayoutTypeRightImageRight,
};
#import <UIKit/UIKit.h>



typedef void (^ButtonActionBlock)(UIButton *button);

@interface UIButton (HXY)

/**
 UIButton：点击事件 block 返回
 */
@property(nonatomic, copy) ButtonActionBlock buttonActionBlock;

/**
 button 的布局样式，默认为：HXYButtonLayoutTypeNormal，注意：文字、字体大小、图片等设置一定要在设置buttonLayoutType之前设置，要不然计算会以默认字体大小计算，导致位置偏移
 */
@property(nonatomic, assign) ButtonLayoutType buttonLayoutType;

/*!
 *  文字与图片之间的间距，默认为：0
 */
@property (nonatomic, assign) CGFloat padding;

/*!
 *  文字或图片距离 button 左右边界的最小距离，默认为：5
 */
@property (nonatomic, assign) CGFloat padding_inset;


/**
 设置普通状态的文字以及选择状态下的文字

 @param title 普通状态的文字
 @param selectedTitle 选择状态的文字
 */
- (void)setTitle:(NSString *)title selectedTitle:(NSString *)selectedTitle;


/**
 设置普通状态的文字颜色以及选择状态下的文字颜色
 
 @param titleColor 普通状态的文字颜色
 @param selectedTitleColor 选择状态的文字颜色
 */
- (void)setTitleColor:(UIColor *)titleColor selectedTitleColor:(UIColor *)selectedTitleColor;

/**
 设置普通状态的图片以及选择状态下的图片

 @param image 普通状态的图片
 @param selectedImage 选择状态的图片
 */
- (void)setImage:(UIImage *)image selectedImage:(UIImage *)selectedImage;

/**
 设置普通状态的背景颜色以及选择状态下的背景颜色

 @param backgroundColor 普通状态的文字
 @param selectedBackgroundColor 选择状态的文字
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor selectedBackgroundColor:(UIColor *)selectedBackgroundColor;



@end
