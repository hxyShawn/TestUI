//
//  HXYServiceViewController.m
//  manmanda
//
//  Created by liangqi on 17/5/5.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYServiceViewController.h"
#import "HXYRecognizeSimultaneousTableView.h"
#import "HXYSerTableView.h"
#import "RxWebViewController.h"
#import "ActivityDetailViewController.h"
#import "RoleArticleViewController.h"
#import "ArticleDetailViewController.h"
#import "ChatViewController.h"
#import "SearchViewController.h"
#import "RankingViewController.h"
#import "UserPageViewController.h"
#import "JYCityListViewController.h"
#import "QiandaoViewController.h"
#import "ServiceKindDetailViewController.h"
#import "RMHUMShare.h"
#import <UMSocialCore/UMSocialCore.h>
#import <UShareUI/UMSocialUIManager.h>
#import "UMSocialQQHandler.h"
#import "TYUserMsgViewController.h"
#import "AdmireShangView.h"
#import "SuiBianView.h"
#import "ActivityChangeDetailViewController.h"
#import "ChSearchViewController.h"
#import "UIColor+NMExtension.h"
#import "ThankView.h"
#import "WhatNeedDetailsController.h"
#import "ServiceKindDetailViewController.h"
#import "TaskCreateViewController.h"
#import "PublishWhatNeedController.h"
#import "RMHMoreServiceVC.h"
#import "CreateClubViewController.h"
#import "RMHPushGuideView.h"
#import "RMHReceiveCouponVC.h"
#import "HXYAlertView.h"
#import "RMHBindingVC.h"
#import "IsOrNotVViewController.h"
#import "HXYTaskViewController.h"
#import "UIViewController+HXYCategory.h"
#import "UINavigationBar+Awesome.h"
#import "RMHNewServiceKind.h"
#import "ActivityRootViewController.h"

#import "HXYLocationManager.h"
#import "NSString+HXYCategory.h"
#import "UIView+HXYCategory.h"


@interface HXYServiceViewController ()<UITableViewDelegate,UITableViewDataSource,BannerViewDelegate>
@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabView;
@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabViewPre;
@property (nonatomic, assign) BOOL canScroll;

//data
@property (nonatomic, assign) LoadWayType loadWay;
@property (nonatomic, strong) NSArray *bannerArray;

@property (nonatomic, assign) NSInteger currentPage;

//UI
@property (nonatomic, strong)HXYRecognizeSimultaneousTableView *tableView;
@property (nonatomic, strong) BannerView *bannerView;
@property (nonatomic, strong) UIView *headView;
@end

@implementation HXYServiceViewController

#pragma mark - lifecircle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //先请求数据
    [[HXYLocationManager sharedManager]requestLocation];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.`
    
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.headView;
    [self.headView addSubview:_bannerView];
    
    
    [self initUI];
    [self initData];
}

#pragma mark - init
- (void)initUI
{
    
}

- (void)initData
{
    
}

#pragma mark - UIConfig

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ScreenHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *tabConfigArray = @[@{
                                    @"title":@"图文介绍",
                                    @"view":@"PicAndTextIntroduceView",
                                    @"data":@"图文介绍的数据",
                                    @"position":@0
                                    },@{
                                    @"title":@"商品详情",
                                    @"view":@"ItemDetailView",
                                    @"data":@"商品详情的数据",
                                    @"position":@1
                                    },@{
                                    @"title":@"评价(273)",
                                    @"view":@"CommentView",
                                    @"data":@"评价的数据",
                                    @"position":@2
                                    }];
    HXYSerTableView *tabView = [[HXYSerTableView alloc]initWithTabConfigArray:tabConfigArray];
    [cell.contentView addSubview:tabView];
    return cell;
}


#pragma mark - scrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    CGFloat tabOffsetY = [_tableView rectForSection:2].origin.y-kTopBarHeight;
    //    CGFloat offsetY = scrollView.contentOffset.y;
    //    _isTopIsCanNotMoveTabViewPre = _isTopIsCanNotMoveTabView;
    //    if (offsetY>=tabOffsetY) {
    //        scrollView.contentOffset = CGPointMake(0, tabOffsetY);
    //        _isTopIsCanNotMoveTabView = YES;
    //    }else{
    //        _isTopIsCanNotMoveTabView = NO;
    //    }
    //    if (_isTopIsCanNotMoveTabView != _isTopIsCanNotMoveTabViewPre) {
    //        if (!_isTopIsCanNotMoveTabViewPre && _isTopIsCanNotMoveTabView) {
    //            //NSLog(@"滑动到顶端");
    //            [[NSNotificationCenter defaultCenter] postNotificationName:kGoTopNotificationName object:nil userInfo:@{@"canScroll":@"1"}];
    //            _canScroll = NO;
    //        }
    //        if(_isTopIsCanNotMoveTabViewPre && !_isTopIsCanNotMoveTabView){
    //            //NSLog(@"离开顶端");
    //            if (!_canScroll) {
    //                scrollView.contentOffset = CGPointMake(0, tabOffsetY);
    //            }
    //        }
    //    }
}
#pragma confData
#pragma mark - loadData

- (void)reloadData
{
    [self getBannerDatas];
}

/*
 获取轮播数据
 */
- (void)getBannerDatas
{
    [[[MMDHTTPClient sharedMMDHttpClient] setAuth] POST:@"V1/new/adList" parameters:@{@"type":@"1"} progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in responseObject[@"adList"]) {
            NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
            [dict setObject:dic[@"imgUrl"] forKey:@"img"];
            [dict setObject:dic[@"type"] forKey:@"type"];
            [dict setObject:dic[@"id"] forKey:@"id"];
            [arr addObject:dict];
        }
        self.bannerArray = arr;
        self.bannerView.dicArray = self.bannerArray;
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (void)loadDatasAtPage:(NSInteger)page
{
    NSString *url;
    NSMutableDictionary *dict;
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *city = [user objectForKey:JY_FIRST_OLD_CITY];
    [NSString isNullOrEmpty:city]?@"":[user objectForKey:JY_FIRST_OLD_CITY];
    if ([NSString isNullOrEmpty:city] || [city isEqualToString:@"全国"]) {
        city = @"";
    }
    HXYLog(@"%@",city);

//    NSString *lat = [NSString stringWithFormat:@"%f",_latitude];
//    NSString *lng = [[NSString stringWithFormat:@"%f",_longitude]}mutableCopy];

    switch (page) {
        case 0:
            url = @"V1/queryAllServe";
            break;
        case 1:
            url = @"V1/queryAllServe";
            break;
        case 2:
            url = @"V1/getAllByDistance";
            break;
        case 3:
            url = @"V1/follow";
            break;

            
        default:
            break;
    }
//    if (page == 0) {
//        if (self.loadWay != LOAD_MORE_DATAS) {
//            _pageOne = 1;
//        }
//        url = @"V1/queryAllServe";
//        dict = [@{@"type":@"1",
//                  @"city":city1,
//                  @"page":[NSString stringWithFormat:@"%d",(int)_pageOne],
//                  @"lat": [NSString stringWithFormat:@"%f",_latitude],
//                  @"lng":[NSString stringWithFormat:@"%f",_longitude]}mutableCopy];
//    }else if (page == 1) {
//        //热门 ---- 修改为最新
//        if (self.loadWay != LOAD_MORE_DATAS) {
//            _pageTwo = 1;
//        }
//        url = @"V1/queryAllServe";
//        dict = [@{@"type":@"0",
//                  @"city":city1,
//                  @"page":[NSString stringWithFormat:@"%d",(int)_pageTwo],
//                  @"lat": [NSString stringWithFormat:@"%f",_latitude],
//                  @"lng":[NSString stringWithFormat:@"%f",_longitude]}mutableCopy];
//        
//    }  else if (page == 2) {
//        
//        if (self.loadWay != LOAD_MORE_DATAS) {
//            _pageThree = 1;
//        }
//        url = @"V1/getAllByDistance";
//        dict = [@{@"page":[NSString stringWithFormat:@"%d",(int)_pageThree],
//                  @"lat": [NSString stringWithFormat:@"%f",_latitude],
//                  @"lng":[NSString stringWithFormat:@"%f",_longitude]}mutableCopy];
//        
//    }else if (page ==3) {
//        if (self.loadWay != LOAD_MORE_DATAS) {
//            _pageFour = 1;
//        }
//        url = @"V1/follow";
//        dict = [@{@"page":[NSString stringWithFormat:@"%d",(int)_pageFour],
//                  @"lat": [NSString stringWithFormat:@"%f",_latitude],
//                  @"lng":[NSString stringWithFormat:@"%f",_longitude]}mutableCopy];
//    }
//    
//    if ([self.bodyCity isEqualToString:@"全国"]) {
//        self.bodyCity = nil;
//    }
//
//    NSLog(@"dict ==== %@",dict);
//    MMDHTTPClient *client = [[MMDHTTPClient sharedMMDHttpClient] setAuth];
//    if (page==1||page==3||page==0) {
//        [client GET:url parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
//            
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            [self endLoading];
//            HXYLog(@"responseObject = %@",responseObject);
//            if ([[responseObject objectForKey:@"code"] integerValue] == 0) {
//                self.pageTotal = [responseObject[@"page"][@"totalCount"] integerValue];
//                if (![url isEqualToString:@"V1/queryAllServe"]) {
//                    self.loadArray = responseObject[@"ServeAndArticleVO"];
//                    NSLog(@"-----responseObject %ld hhhhhhh %@",(long)page,responseObject);
//                }else
//                {
//                    NSLog(@"-----responseObject %ld hhhhhhh %@",(long)page,responseObject);
//                    
//                    self.loadArray = responseObject[@"infoVos"];
//                }
//                
//                [self loadSuccessAtPage:page];
//            } else {
//                //                [MBProgressHUD showError:responseObject[@"msg"] toView:nil];
//            }
//            
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            [self endLoading];
//            HXYLog(@"%@",error);
//        }];
//    }else{
//        NSLog(@"%@ %@,%zd",url,dict,page);
//        [client POST:url parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
//            
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//            [self endLoading];
//            NSLog(@"%@ %@",url,dict);
//            if ([[responseObject objectForKey:@"code"] integerValue] == 0) {
//                self.pageTotal = [responseObject[@"page"][@"totalCount"] integerValue];
//                self.loadArray = responseObject[@"ServeAndArticleVO"];
//                
//                [self loadSuccessAtPage:page];
//            } else {
//            }
//        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//            NSLog(@"%@",error);
//            [self endLoading];
//        }];
//    }
}




#pragma mark - getter&setter
- (HXYRecognizeSimultaneousTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[HXYRecognizeSimultaneousTableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}

- (UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
        _headView.backgroundColor = [UIColor purpleColor];
        _tableView.tableHeaderView = _headView;
    }
    return _headView;
}

- (BannerView *)bannerView
{
    if (!_bannerView) {
        _bannerView = [[BannerView alloc] initWithFrame:_headView.bounds];
        _bannerView.delegate = self;
    }
    return _bannerView;
}
@end
