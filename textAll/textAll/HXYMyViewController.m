//
//  HXYMyViewController.m
//  textAll
//
//  Created by liangqi on 17/6/7.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import "HXYMyViewController.h"
#import "HXYMyInfoView.h"

#import "HXYMyTableViewCell.h"
@interface HXYMyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, copy) NSArray *tableImages;
@property (nonatomic, copy) NSArray *tableTitles;
@end

@implementation HXYMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableImages = @[
                         @[@"my-bussinessCenter",@"my-distribution",@"my-recommend",@"my-collection"],
                         @[@"my-VIPCenter",@"my-authentication",@"my-godAuthentication",@"my-Level"],
                         @[@"my-handbook",@"my-eceptionist",@"my-setting"]];
    
    self.tableTitles = @[
                         @[@"商家中心",@"我的代理",@"我的推荐",@"我的收藏"],
                         @[@"会员中心",@"实名认证",@"大神认证",@"我的等级"],
                         @[@"操作指南",@"联系客服",@"系统设置"]];
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    UIView *bgView = [[UIView alloc]init];
    

    
    HXYMyInfoView *view = [[HXYMyInfoView alloc]init];
    [bgView addSubview:view];
    view.backgroundColor = [UIColor lightGrayColor];
    view.frame = CGRectMake(0, 0, ScreenWidth, 418);
    tableView.tableHeaderView = view;
    [view setModel];
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.mas_equalTo(bgView);
//        make.height.mas_equalTo(418);
//    }];
//    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//    }];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.tableImages.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableImages[section] count];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellid";
    HXYMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[HXYMyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.text = self.tableTitles[indexPath.section][indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSString *imgStr = self.tableImages[indexPath.section][indexPath.row];
    cell.headImage = imgStr;
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
