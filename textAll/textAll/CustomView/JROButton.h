//
//  JROButton.h
//  textAll
//
//  Created by 贺东方 on 2017/10/17.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 配置项,可以做几个默认的配置,到时候修改方便
 */
@interface JROButtonConfiguration : NSObject

@property (nonatomic, strong) UIFont *font;

@property (nonatomic, strong) UIColor *titleColor;

+ (instancetype)defaultConfiguration;

+ (instancetype)configuration;



@end

@interface JROButton : UIButton

//利用JROButtonConfiguration快速初始化button的一些配置
+ (instancetype)buttonWithConfiguration:(JROButtonConfiguration *)configuration;



@end
