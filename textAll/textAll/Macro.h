//
//  Macro.h
//  textAll
//
//  Created by liangqi on 17/6/6.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

#import "Masonry.h"
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;

#define HXYLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

//判断系统版本
#define iOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

//判断手机版本
#define iPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6                                                                \
([UIScreen instancesRespondToSelector:@selector(currentMode)]                \
? CGSizeEqualToSize(CGSizeMake(750, 1334),                              \
[[UIScreen mainScreen] currentMode].size)           \
: NO)
#define iPhone6Plus                                                            \
([UIScreen instancesRespondToSelector:@selector(currentMode)]                \
? CGSizeEqualToSize(CGSizeMake(1242, 2208),                             \
[[UIScreen mainScreen] currentMode].size)           \
: NO)


// Define color myself.
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// Define color myself.
#define UIColorAlphaFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:.5]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
#define BlackColorValue     0x222222
#define hxytest(type,fontSize) [UIFont fontWithName:@"PingFangSC-"#type size:fontSize]
//font
#define PFFONT(type,fontSize) [UIFont fontWithName:@"PingFangSC-"#type size:fontSize]?[UIFont fontWithName:@"PingFangSC-"#type size:fontSize]: [UIFont fontWithName:@"PingFang-SC-"#type size:fontSize]

// It is clear that this is height of screen.
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
// Width
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

//5s尺寸的比例
#define ScreenScale ([[UIScreen mainScreen] bounds].size.width/320.f)
#define ScreenHeightScale ([[UIScreen mainScreen] bounds].size.height/480.f)

//根据6s尺寸图的比例
#define kWidthScale ([[UIScreen mainScreen] bounds].size.width/375.f)
#define kHeightScale ([[UIScreen mainScreen] bounds].size.width/667.f)
//默认的分割线的高度
#define DefaultLineHight    0.5
#define SepratorColor       0xDADADA

#endif /* Macro_h */
