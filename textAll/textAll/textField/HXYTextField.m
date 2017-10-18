//
//  HXYTextField.m
//  textAll
//
//  Created by 贺东方 on 17/8/12.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import "HXYTextField.h"


@interface HXYTextField()<UITextFieldDelegate>
@property (nonatomic, assign) HXYTextFieldType type;

@end
@implementation HXYTextField

- (instancetype)initWithFrame:(CGRect)frame font:(CGFloat)font keyboardType:(UIKeyboardType)keyboardType placeholder:(NSString *)placeholder HXYTextFieldType:(HXYTextFieldType)type
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.textField];
        self.textField.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.textField.font = [UIFont systemFontOfSize:font];
        self.textField.keyboardType = keyboardType;
        self.textField.placeholder = placeholder;
        self.type = type;
    }
    return self;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.textColor = UIColorFromRGB(0x333333);
        _textField.delegate = self;
        [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];    }
    return _textField;
}

- (void)textFieldDidChange:(UITextField *)textField {
    NSString *toBeString = textField.text;
    toBeString = [self filterCharactor:textField.text withRegex:@"[^a-zA-Z0-9\u4e00-\u9fa5]"];
    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage];
    if([lang isEqualToString:@"zh-Hans"]) {
        UITextRange *selectedRange = [textField markedTextRange];
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        if(!position) {
            textField.text = [self lengthLimit:toBeString];
        }
        else{
        }
    }
    else{
        textField.text = [self lengthLimit:toBeString];
    }
}

- (NSString *)lengthLimit:(NSString *)toBeString {
    switch (self.type) {

        case HXYTextFieldPhone: {
            if(toBeString.length > 11) {
                return [toBeString substringToIndex:11];
            }
        }
            break;
        case HXYTextFieldPWD: {
            if(toBeString.length > 20) {
                return [toBeString substringToIndex:20];
            }
        }
            break;
        case HXYTextFieldCode: {
            if(toBeString.length > 6) {
                return [toBeString substringToIndex:6];
            }
        }
            break;
        case HXYTextFieldDefault: {
            if(toBeString.length > 50) {
                return [toBeString substringToIndex:50];
            }
        }
        default:
            break;
    }
    return toBeString;
}

- (NSString *)text {
    return self.textField.text;
}
- (void)setText:(NSString *)text {
    self.textField.text = text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (NSString *)filterCharactor:(NSString *)string withRegex:(NSString *)regexStr{
    NSString *filterText = string;
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr options:NSRegularExpressionCaseInsensitive error:&error];
    NSString *result = [regex stringByReplacingMatchesInString:filterText options:NSMatchingReportCompletion range:NSMakeRange(0, filterText.length) withTemplate:@""];
    return result;
}

@end
