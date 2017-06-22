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
@end
