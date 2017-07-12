//
//  HXYLocationManager.h
//  manmanda
//
//  Created by liangqi on 17/5/15.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HXYLocationManager : NSObject

@property (nonatomic, assign) CGFloat  latitude;
@property (nonatomic, assign) CGFloat  longitude;

+(instancetype)sharedManager;
- (void)requestLocation;
@end
