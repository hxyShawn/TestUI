//
//  UIButton+HXY.m
//  textAll
//
//  Created by 贺东方 on 2017/10/16.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//
/*! runtime set */
#define Objc_setObj(key, value) objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC)

/*! runtime setCopy */
#define Objc_setObjCOPY(key, value) objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY)

/*! runtime get */
#define Objc_getObj objc_getAssociatedObject(self, _cmd)

#import "UIButton+HXY.h"
#import <objc/runtime.h>

@implementation UIButton (HXY)


- (void)setTitle:(NSString *)title selectedTitle:(NSString *)selectedTitle
{
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitle:selectedTitle forState:UIControlStateSelected];
}

- (void)setTitleColor:(UIColor *)titleColor selectedTitleColor:(UIColor *)selectedTitleColor
{
    if (titleColor) {
        [self setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (selectedTitleColor) {
        [self setTitleColor:selectedTitleColor forState:UIControlStateSelected];
    }
}

- (void)setImage:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    if (image) {
        [self setImage:image forState:UIControlStateNormal];
    }else{
        NSLog(@"没有normal的图片");
    }
    if (selectedImage) {
        [self setImage:selectedImage forState:UIControlStateSelected];
    }else{
        NSLog(@"没有selected的图片");
    }
}

- (void)setBackgroundColor:(UIColor *)backgroundColor selectedBackgroundColor:(UIColor *)selectedBackgroundColor
{
    CGSize size = CGSizeMake(1, 1);
    if (backgroundColor) {
        [self setBackgroundImage:[self imageFromColor:backgroundColor size:size] forState:UIControlStateNormal];
    }
    if (selectedBackgroundColor) {
        [self setBackgroundImage:[self imageFromColor:selectedBackgroundColor size:size] forState:UIControlStateSelected];
    }
}


- (void)setupButtonLayout
{
    CGFloat image_w = self.imageView.bounds.size.width;
    CGFloat image_h = self.imageView.bounds.size.height;
    
    CGFloat title_w = self.titleLabel.bounds.size.width;
    CGFloat title_h = self.titleLabel.bounds.size.height;
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0)
    {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        title_w = self.titleLabel.intrinsicContentSize.width;
        title_h = self.titleLabel.intrinsicContentSize.height;
    }
    
    UIEdgeInsets imageEdge = UIEdgeInsetsZero;
    UIEdgeInsets titleEdge = UIEdgeInsetsZero;
    
    if (self.padding_inset == 0)
    {
        self.padding_inset = 5;
    }
    
    switch (self.buttonLayoutType) {
        case ButtonLayoutTypeNormal:
        {
            
            titleEdge = UIEdgeInsetsMake(0, self.padding, 0, 0);
            
            imageEdge = UIEdgeInsetsMake(0, 0, 0, self.padding);
            
        }
            break;
        case ButtonLayoutTypeCenterImageRight:
        {
            titleEdge = UIEdgeInsetsMake(0, -image_w - self.padding, 0, image_w);
            imageEdge = UIEdgeInsetsMake(0, title_w + self.padding, 0, -title_w);
        }
            break;
        case ButtonLayoutTypeCenterImageTop:
        {
            titleEdge = UIEdgeInsetsMake(0, -image_w, -image_h - self.padding, 0);
            imageEdge = UIEdgeInsetsMake(-title_h - self.padding, 0, 0, -title_w);
        }
            break;
        case ButtonLayoutTypeCenterImageBottom:
        {
            titleEdge = UIEdgeInsetsMake(-image_h - self.padding, -image_w, 0, 0);
            imageEdge = UIEdgeInsetsMake(0, 0, -title_h - self.padding, -title_w);
        }
            break;
        case ButtonLayoutTypeLeftImageLeft:
        {
            titleEdge = UIEdgeInsetsMake(0, self.padding + self.padding_inset, 0, 0);
            
            imageEdge = UIEdgeInsetsMake(0, self.padding_inset, 0, 0);
            
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        }
            break;
        case ButtonLayoutTypeLeftImageRight:
        {
            titleEdge = UIEdgeInsetsMake(0, -image_w + self.padding_inset, 0, 0);
            imageEdge = UIEdgeInsetsMake(0, title_w + self.padding + self.padding_inset, 0, 0);
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        }
            break;
        case ButtonLayoutTypeRightImageLeft:
        {
            imageEdge = UIEdgeInsetsMake(0, 0, 0, self.padding + self.padding_inset);
            titleEdge = UIEdgeInsetsMake(0, 0, 0, self.padding_inset);
            
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        }
            break;
        case ButtonLayoutTypeRightImageRight:
        {
            titleEdge = UIEdgeInsetsMake(0, 0, 0, image_w + self.padding + self.padding_inset);
            imageEdge = UIEdgeInsetsMake(0, 0, 0, -title_w + self.padding_inset);
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        }
            break;
            
        default:
            break;
    }
    self.imageEdgeInsets = imageEdge;
    self.titleEdgeInsets = titleEdge;

}


#pragma mark - setter / getter
- (void)setButtonActionBlock:(ButtonActionBlock)buttonActionBlock
{
    [self addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    Objc_setObj(@selector(buttonActionBlock), buttonActionBlock);
    [self setupButtonLayout];
}

- (ButtonActionBlock)buttonActionBlock
{
    return Objc_getObj;
}

-(void)setbuttonLayoutType:(ButtonLayoutType)buttonLayoutType
{
    Objc_setObj(@selector(buttonLayoutType), @(buttonLayoutType));
    [self setupButtonLayout];
}

- (ButtonLayoutType)buttonLayoutType
{
    return [Objc_getObj integerValue];
}

- (void)setPadding:(CGFloat)padding
{
    Objc_setObj(@selector(padding), @(padding));
    [self setupButtonLayout];
}

- (CGFloat)padding
{
    return [Objc_getObj floatValue];
}

- (void)setPadding_inset:(CGFloat)padding_inset
{
    Objc_setObj(@selector(padding_inset), @(padding_inset));
    [self setupButtonLayout];
}

- (CGFloat)padding_inset
{
    return [Objc_getObj floatValue];
}

#pragma helpMethod
- (UIImage *)imageFromColor:(UIColor*)color size:(CGSize)size
{
    CGRect rect=CGRectMake(0.0f, 0.0f, size.width,size.height);
    UIGraphicsBeginImageContext(size);//创建图片
    CGContextRef context = UIGraphicsGetCurrentContext();//创建图片上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);//设置当前填充颜色的图形上下文
    CGContextFillRect(context, rect);//填充颜色
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (void)handleButtonAction:(UIButton *)sender
{
    if (self.buttonActionBlock)
    {
        self.buttonActionBlock(sender);
    }
}
@end
