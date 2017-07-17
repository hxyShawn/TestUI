//
//  UIViewController+HXYCategory.m
//  manmanda
//
//  Created by liangqi on 17/4/6.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "UIViewController+HXYCategory.h"

@implementation UIViewController (HXYCategory)

- (BOOL)isVisible
{
    return (self.isViewLoaded && self.view.window);
}

- (UIViewController *)currentViewController
{
    UIResponder *nextResponder =  self;
    
    do
    {
        nextResponder = [nextResponder nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
            return (UIViewController*)nextResponder;
        
    } while (nextResponder != nil);
    
    return nil;
}

- (void)setTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth - 120,20)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    if (font) {
        titleLabel.font = font;
    } else {
        titleLabel.font = [UIFont systemFontOfSize:18];
    }
    
    if (color) {
        titleLabel.textColor = color;
    } else {
        titleLabel.textColor = UIColorFromRGB(BlackColorValue);
    }
    titleLabel.text = title;
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
}

- (void)setRightTextItemWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 40);
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button addTarget:self action:@selector(rightItemClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
}

- (void)setBackItemWithImage:(UIImage *)image
{
    UIImage *leftImage = nil;
    if (!image) {
        leftImage = [[UIImage imageNamed:@"blackBackArrow" ]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else{
        leftImage = image;
    }
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftImage style:UIBarButtonItemStylePlain target:self action:@selector(back)];
}

- (void)setBackArrowWithType:(HXYBackItemType)type
{
    NSString *imgStr = nil;
    switch (type) {
        case HXYBackItemTypePink:
            imgStr = @"pinkBackArrow";
            break;
        case HXYBackItemTypeBlack:
            imgStr = @"blackBackArrow";
            break;
        case HXYBackItemTypeWhite:
            imgStr = @"whiteBackArrow";
            break;
        default:
            imgStr = @"pinkBackArrow";
            break;
    }
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imgStr]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
}

- (void)back
{
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)setDefaultBackgroundColor
{
    self.view.backgroundColor = UIColorFromRGB(0xEEEEEE);
    
}
@end
