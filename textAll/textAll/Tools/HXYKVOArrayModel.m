//
//  HXYKVOArrayModel.m
//  manmanda
//
//  Created by liangqi on 17/5/8.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYKVOArrayModel.h"

@implementation HXYKVOArrayModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        _array = [NSMutableArray array];
        _itemDic = [NSMutableDictionary dictionary];
        _cellDic = [NSMutableDictionary dictionary];
    }
    return self;
}
@end
