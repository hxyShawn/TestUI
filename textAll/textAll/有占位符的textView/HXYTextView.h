//
//  HXYTextView.h
//  manmanda
//
//  Created by liangqi on 17/5/31.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXYTextView : UITextView
/** 占位文字 */
@property (nonatomic,copy) NSString *placeholder;
/** 占位文字颜色 */
@property (nonatomic,strong) UIColor *placeholderColor;
@end
