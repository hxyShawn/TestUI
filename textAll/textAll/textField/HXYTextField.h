//
//  HXYTextField.h
//  textAll
//
//  Created by 贺东方 on 17/8/12.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum HXYTextFieldType {
    HXYTextFieldPhone,
    HXYTextFieldCode,
    HXYTextFieldPWD,
    HXYTextFieldDefault
} HXYTextFieldType;


@interface HXYTextField : UIView
- (instancetype)initWithFrame:(CGRect)frame font:(CGFloat)font keyboardType:(UIKeyboardType)keyboardType placeholder:(NSString *)placeholder HXYTextFieldType:(HXYTextFieldType)type;

@property (strong, nonatomic) UITextField *textField;

@property (copy, nonatomic) NSString *text;
- (void)setText:(NSString *) text;
@end
