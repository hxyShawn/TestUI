//
//  HXYStarView.m
//  manmanda
//
//  Created by liangqi on 17/7/13.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYStarView.h"
#import <Masonry/Masonry.h>
static NSString *imageName = @"full_star";
static CGFloat imgvW = 10;
static NSInteger maxCnt = 5;
@interface HXYStarView()
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation HXYStarView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self confUI];
    }
    return self;
}

- (void)confUI
{
    self.array = [NSMutableArray array];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:imageName];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.equalTo(@(imgvW));
    }];
    [self.array addObject:imageView];
    
    for (NSInteger i = 0; i < maxCnt - 1; i++) {
        UIImageView *imgv = [[UIImageView alloc]init];
        imgv.image = [UIImage imageNamed:imageName];[UIImage imageNamed:imageName];
        [self addSubview:imgv];
        [imgv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.mas_right).offset(4);
            make.top.bottom.equalTo(self);
            make.width.equalTo(@(imgvW));
        }];
        
        [self.array addObject:imgv];
        imageView = imgv;
    }
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right);
    }];
}
- (void)setStarCnt:(NSInteger)starCnt
{
    if (starCnt == 0) {
        starCnt = maxCnt;
    }
    _starCnt = starCnt;

    for (NSInteger i = 0; i<maxCnt; i++) {
        UIImageView *imgv = self.array[i];

        [imgv mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(imgvW));
        }];
        if (i >= starCnt) {
            [imgv mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@0);
            }];
        }

    }
}


@end
