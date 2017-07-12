//
//  HXYKVOArrayModel.h
//  manmanda
//
//  Created by liangqi on 17/5/8.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 单纯为了可以使用KVO监控数组的个数而创建的模型
 */
@interface HXYKVOArrayModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) NSMutableDictionary *itemDic;
@property (nonatomic, strong) NSMutableDictionary *cellDic;
@end
