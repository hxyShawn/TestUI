//
//  UINavigationBar+Awesome.h
//  LTNavigationBar
//
//  Created by ltebean on 15-2-15.
//  Copyright (c) 2015 ltebean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Awesome)


/**
 设置背景颜色

 @param backgroundColor 背景颜色
 */
- (void)lt_setBackgroundColor:(UIColor *)backgroundColor;

- (void)lt_setElementsAlpha:(CGFloat)alpha;
- (void)lt_setTranslationY:(CGFloat)translationY;

/**
 需要在viewWillDisappear里调用
 */
- (void)lt_reset;
@end
