//
//  HXYLocationManager.m
//  manmanda
//
//  Created by liangqi on 17/5/15.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYLocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface HXYLocationManager()
@property (nonatomic, strong) CLLocationManager *locationManager;   //定位
@property (nonatomic, assign) BOOL  isAuthenticated;
@end
@implementation HXYLocationManager
+(instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static HXYLocationManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[HXYLocationManager alloc] init];
    });
    return instance;
}

// 请求定位
- (void) requestLocation{
    // 请求用户权限 开启定位
    // 判断当前App是否开启定位服务
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    // 判断是否已授权
    if (status == kCLAuthorizationStatusNotDetermined) {
        // 请求授权
        [self.locationManager requestWhenInUseAuthorization];
    }
    // 如果关闭定位服务 弹框提示
    else if (status == kCLAuthorizationStatusDenied){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"定位服务已关闭,请在设置中找到该应用,然后开启定位服务" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
    }
    else{
        self.isAuthenticated = YES;
        [self.locationManager startUpdatingLocation];
    }
}



#pragma mark - CLLocationDelegate
// 授权状态改变时回调
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if (status == kCLAuthorizationStatusDenied) {
        NSLog(@"不允许");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"定位服务已关闭,请在设置中找到该应用,然后开启定位服务" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
    }
    else{
        // 启动定位服务
        [manager startUpdatingLocation];
    }
}
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    // 先判断有没有位置信息
    if (locations.count > 0) {
        // 停止定位
        [manager stopUpdatingLocation];
        // 从数组中取出任意一个位置信息
        CLLocation *location = [locations firstObject];
        // 传入位置信息 调用数据请求方法
        self.latitude = location.coordinate.latitude;
        self.longitude = location.coordinate.longitude;
        NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
//        [userdefaults setObject:[NSString stringWithFormat:@"%lf",_latitude] forKey:Latitude];
//        [userdefaults setObject:[NSString stringWithFormat:@"%lf",_longitude] forKey:Longitude];
        [userdefaults synchronize];
        
    }
}

#pragma mark - getter&setter
- (CGFloat)latitude
{
    if (_isAuthenticated == NO) {return 0;}
    [self requestLocation];
    return _latitude;
}
@end
