//
//  HXYHorizontalTextButton.h
//  textAll
//
//  Created by liangqi on 17/6/6.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 上下都是label的button
 */
@interface HXYHorizontalTextButton : UIButton
@property (nonatomic, assign) CGFloat  bottomW;
@property(nonatomic, assign) CGFloat space;
@property (nonatomic, copy) NSString *number;
@property (nonatomic, copy) NSString *text;

- (instancetype)initWithSpace:(NSNumber *)space;
@end
