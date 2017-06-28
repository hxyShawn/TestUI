//
//  Model.h
//  textAll
//
//  Created by 贺东方 on 17/6/25.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *content;
@property (strong, nonatomic) UIImage *avatar;

// Cache
@property (assign, nonatomic) CGFloat cellHeight;
@end
