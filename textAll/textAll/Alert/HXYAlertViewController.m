//
//  HXYAlertViewController.m
//  manmanda
//
//  Created by liangqi on 17/7/1.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

typedef NS_ENUM(NSUInteger, HXYAlertViewControllerType) {
    HXYAlertViewControllerTypeAuthenTication = 0
};

#import "HXYAlertViewController.h"
#import <Masonry.h>
#import "HXYAuthenticationView.h"
#import "MBProgressHUD.h"
#import "MMDHTTPClient.h"
#import "HXYBindPhoneView.h"

@interface HXYAlertViewController ()<HXYAuthenticationViewDelegate,HXYBindPhoneViewDelegate>
@property (nonatomic, strong) MBProgressHUD *mbProgressHUD;
@property (nonatomic, copy) NSString *confirmTitle;
@end

@implementation HXYAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
}

- (instancetype)initWithAuthenticationAlertView:(NSString *)titleStr placeHolder:(NSString *)placeHolder
{
    self = [super init];
    if (self) {
        self.titleStr = titleStr;
        self.contentStr = placeHolder;
        [self confAlertView];
    }
    return self;
}

- (instancetype)initWithConfirmTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        
        self.confirmTitle = title;
        [self confBindPhoneAlertView];
    }
    return self;
}

-(void)confBindPhoneAlertView
{
    HXYBindPhoneView *alertView = [[HXYBindPhoneView alloc]initWithConfirmTitle:self.confirmTitle];
    alertView.layer.cornerRadius = 5;
    alertView.delegate = self;
    alertView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:alertView];
    
    [alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.64);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.33);
    }];
}

- (void)confAlertView
{
    HXYAuthenticationView *alertView = [[HXYAuthenticationView alloc]initWithTitle:self.titleStr placeholder:self.contentStr];
    alertView.layer.cornerRadius = 5;
    alertView.delegate = self;
    alertView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:alertView];
    
    [alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.64);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.22);
    }];
}


#pragma mark - delegate
- (void)HXYAuthenticationView:(HXYAuthenticationView *)view didSelctedAtIndex:(NSInteger)index authenticationInfo:(NSDictionary *)dict
{
    if (index == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    if (index == 1) {
        NSInteger code = [dict[@"code"]integerValue];
        if (code == 0) {
            [self showAlert];
            [[[MMDHTTPClient sharedMMDHttpClient]setAuth]POST:@"news/activity/activity/add_ticket_permission" parameters:@{@"code":dict[@"info"]} progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                HXYLog(@"%@",responseObject);
                [self cancelAlert];
                NSInteger code = [responseObject[@"code"] integerValue];
                [self showAlertMessage:responseObject[@"msg"] showTime:2.0];
                if (code == 0) {
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [self dismissViewControllerAnimated:YES completion:nil];
                    });
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self showAlertMessage:@"网络失败,请重新再试" showTime:1.0];
                
            }];
        }else if (code == 1){
            [self showAlertMessage:dict[@"msg"] showTime:1.0];
        }else{
            
        }
    }
}

- (void)HXYBindPhoneView:(HXYBindPhoneView *)view didSelect:(NSInteger)tag
{
    //0:取消 2:确认
    if (tag == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    if (tag == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
        if ([_delegate respondsToSelector:@selector(HXYAlertViewController:didChooseItem:)]) {
            [_delegate HXYAlertViewController:self didChooseItem:1];
        }
    }
    
}

- (void)showAlertMessage:(NSString *)message showTime:(CGFloat) time
{
    [self.mbProgressHUD removeFromSuperview];
    [self.mbProgressHUD hide:YES];
    self.mbProgressHUD = nil;
    [self.view addSubview:self.mbProgressHUD];
    self.mbProgressHUD.detailsLabelText = message;
    [self.mbProgressHUD show:YES];
    [self.mbProgressHUD hide:YES afterDelay:time];
}

- (void)showAlert
{
    [self.mbProgressHUD removeFromSuperview];
    [self.mbProgressHUD hide:YES];
    self.mbProgressHUD = nil;
    [self.view addSubview:self.mbProgressHUD];
    self.mbProgressHUD.labelText = @"加载中";
    [self.mbProgressHUD show:YES];
}

- (void)cancelAlert
{
    if (self.mbProgressHUD) {
        [self.mbProgressHUD removeFromSuperview];
        [self.mbProgressHUD hide:YES];
        self.mbProgressHUD = nil;
    }
}

#pragma mark - getter&setter
- (MBProgressHUD *)mbProgressHUD
{
    if (!_mbProgressHUD) {
        _mbProgressHUD = [[MBProgressHUD alloc] initWithView:self.view];
        
        _mbProgressHUD.opacity = 0.8f;
        _mbProgressHUD.cornerRadius = HUDRadius;
        _mbProgressHUD.margin = 15.f;
        _mbProgressHUD.mode = MBProgressHUDModeText;
    }
    return _mbProgressHUD;
}
@end
