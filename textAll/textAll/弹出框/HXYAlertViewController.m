//
//  HXYAlertViewController.m
//  textAll
//
//  Created by liangqi on 17/6/14.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import "HXYAlertViewController.h"

@interface HXYAlertViewController ()

@end

@implementation HXYAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor clearColor];
    

    
}
-(void)viewDidAppear:(BOOL)animated
{
    UIView *view = [[UIView alloc]init];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(10, 20, ScreenWidth - 20, 40);
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).offset(10);
//        make.right.equalTo(self.view).offset(-10);
////        make.bottom.equalTo(self.view.mas_bottom).offset(-10);
//        make.center.mas_equalTo(self.view.center);
//        make.height.mas_offset(80);
//    }];
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
