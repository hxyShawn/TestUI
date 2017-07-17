//
//  UILabel+HXYCategory.m
//  manmanda
//
//  Created by liangqi on 17/4/6.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "UILabel+HXYCategory.h"

@implementation UILabel (HXYCategory)

+ (NSAttributedString *)attriStrWithHtmlText:(NSString *)text
{
    NSDictionary *options = @{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType,
                               NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding) };
    
    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    
    NSAttributedString *str = [[NSAttributedString alloc] initWithData:data options:options documentAttributes:nil error:nil];
    return str;
}

+ (NSDictionary *)setFont:(UIFont *)font color:(UIColor *)color kern:(CGFloat)kern
{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if (font) {
        [dict setObject:font forKey:NSFontAttributeName];
    }
    if (color) {
        [dict setObject:color forKey:NSForegroundColorAttributeName];
    }
    if (kern) {
        [dict setObject:[NSNumber numberWithFloat:kern] forKey:NSKernAttributeName];
    }
    
    return dict;
    
}

- (CGFloat )dynamicCalculationLabelHight:(UILabel*) label{
    //有源码在 有需求自行微调即可
    NSInteger n = 3;//最多显示的行数
    CGSize labelSize = {0, 0};
    
    labelSize = [self ZFYtextHeightFromTextString:label.text width:label.frame.size.width fontSize:label.font.pointSize];
    
    // NSLog(@"%f",label.font.pointSize);//获取 label的字体大小
    //NSLog(@"%f",label.font.lineHeight);//获取label的在不同字体下的时候所需要的行高
    //NSLog(@"%f",labelSize.height);//label计算行高
    CGFloat rate = label.font.lineHeight; //每一行需要的高度
    
    CGRect frame= label.frame;
    if (labelSize.height>rate*n) {
        frame.size.height = rate*n;
    }else{
        frame.size.height = labelSize.height;
    }
    return frame.size.height;
}

+ (CGFloat)hightWithText:(NSString *)text fontSize:(CGFloat)fontSize width:(CGFloat)width maxLine:(NSInteger)maxLine
{
    return [self hightWithText:text fontSize:fontSize width:width maxLine:maxLine];
}

- (CGFloat)hightWithText:(NSString *)text fontSize:(CGFloat)fontSize width:(CGFloat)width maxLine:(NSInteger )maxLine
{
    NSInteger n = maxLine;//最多显示的行数
    CGSize labelSize = {0, 0};
    
    labelSize = [self ZFYtextHeightFromTextString:text width:width fontSize:fontSize];
    
    // NSLog(@"%f",label.font.pointSize);//获取 label的字体大小
    //NSLog(@"%f",label.font.lineHeight);//获取label的在不同字体下的时候所需要的行高
    //NSLog(@"%f",labelSize.height);//label计算行高
    CGFloat rate = [UIFont systemFontOfSize:fontSize].lineHeight; //每一行需要的高度
    
    CGFloat height;
    if (labelSize.height>rate*n) {
        height = rate*n;
    }else{
        height = labelSize.height;
    }
    return height;
    
}

//计算 label需要的宽度和高度方法
- (CGSize)ZFYtextHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size{
    //计算 label需要的宽度和高度
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:size]};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    CGSize size1 = [text sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:size]}];
    
    return CGSizeMake(size1.width, rect.size.height);
}

+ (instancetype)label
{
    return [[self alloc]init];    
}
@end
