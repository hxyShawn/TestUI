//
//  JROButton.m
//  textAll
//
//  Created by 贺东方 on 2017/10/17.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import "JROButton.h"
@interface JROButtonConfiguration()

@end

@implementation JROButtonConfiguration

+ (instancetype)defaultConfiguration
{
    JROButtonConfiguration *config = [[JROButtonConfiguration alloc]init];
    config.font = [UIFont systemFontOfSize:14];
    config.titleColor = [UIColor blackColor];
    return config;
}

+ (instancetype)configuration
{
    return [[JROButtonConfiguration alloc]init];
}

@end

@implementation JROButton

+ (instancetype)buttonWithConfiguration:(JROButtonConfiguration *)configuration
{
    JROButton *btn = [JROButton buttonWithType:UIButtonTypeCustom];
    if (configuration.font) {
        btn.titleLabel.font = configuration.font;
    }
    if (configuration.titleColor) {
        [btn setTitleColor:configuration.titleColor forState:UIControlStateNormal];
    }
    
    return btn;
}


@end
