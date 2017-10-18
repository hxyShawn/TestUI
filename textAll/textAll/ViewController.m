//
//  ViewController.m
//  textAll
//
//  Created by 贺东方 on 17/5/27.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import "ViewController.h"

#import "HXYMyInfoView.h"
#import "drawCurve.h"
#import "HXYMyViewController.h"
#import "BezierPathLearning.h"
#import "AdViewController.h"
#import "DynamicLabelViewController.h"
#import "AlterableHeightCellViewController.h"
#import "TestPriorityViewController.h"
#import "HXYAlertViewController.h"
#import <StoreKit/StoreKit.h>
#import "Case1ViewController.h"
#import "nineItemView.h"
#import "UIButton+HXY.h"

#import "UIView+HXYCategory.h"
@interface ViewController ()<SKStoreProductViewControllerDelegate>
@property (nonatomic, strong) SKStoreProductViewController *vc;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];

    [button setTitle:@"点击" selectedTitle:@"选择"];
    [button setTitleColor:[UIColor greenColor] selectedTitleColor:[UIColor blueColor]];
//    [button setBackgroundColor:[UIColor whiteColor] selectedBackgroundColor: [UIColor blackColor]];
    [button setImage:[UIImage imageNamed:@"Apple"] selectedImage:[UIImage imageNamed:@"Analyzeloop"]];
    [button setButtonActionBlock:^(UIButton *button) {
        NSLog(@"-----");
        button.selected = !button.selected;
    }];


//
//    nineItemView *view = [[nineItemView alloc] init];
//    [self.view addSubview:view];
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
//    UIImageView *imgv1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Apple"]];
//    UIImageView *imgv2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"doge"]];
//    [self.view addSubview:imgv1];
//    [self.view addSubview:imgv2];
//    [imgv1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.equalTo(self.view).offset(16);
//    }];
//    [imgv2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.top.equalTo(self.view).offset(16);
//    }];
//    [imgv2 setCornerRadius:5 RoundingCorners:UIRectCornerAllCorners];
    
    //这里测试了一下合适才会产生frame
//    UIView *bgView = [[UIView alloc]init];
//    [self.view addSubview:bgView];
//    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.size.mas_equalTo(CGSizeMake(100, 100));
//    }];
//    bgView.backgroundColor = [UIColor redColor];
//    HXYLog(@" view frame = %@", NSStringFromCGRect(bgView.frame));
//    [self.view setNeedsLayout];
//    [self.view layoutIfNeeded];
//    HXYLog(@" view frame = %@", NSStringFromCGRect(bgView.frame));
//    [bgView setCornerRadius:10 RoundingCorners:UIRectCornerAllCorners];
    

}

- (void)BtnClick:(UIButton *)btn
{
    HXYLog();
    //画曲线
    //    [self drawCurveView];
    //    [self bezierPathLearning];
    //    [self my];
    //    [self adScrollView];
    //    [self dynamicLabel];
    //    [self dynamicCell];
    //    [self testPriority];
    
    //    [self inAppStorePurchase];//未完成
//    [self HXYAlertViewController];
    Case1ViewController *vc = [[Case1ViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)viewDidAppear:(BOOL)animated
{
    HXYLog();
}


- (void)inAppStorePurchase
{
    self.vc = [[SKStoreProductViewController alloc]init];
    self.vc.delegate = self;
    NSDictionary *dict = @{SKStoreProductParameterITunesItemIdentifier: @375380948};
    [self.vc loadProductWithParameters:dict completionBlock:^(BOOL result, NSError * _Nullable error) {
        if (result) {
            [self presentViewController:self.vc animated:YES completion:nil];
        }else{
//            HXYLog(@"%@",error);
        }
    }];
}

- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController
{
//    HXYLog();
}

- (void)DXPopViewLearning
{
    
}

- (void)HXYAlertViewController
{

    HXYAlertViewController *vc = [[HXYAlertViewController alloc]init];
    vc.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    //iOS8以前用UIModalPresentationCurrentContext,并且是给presentingViewController设置的,
    //iOS8以后给presentedViewC设置,UIModalPresentationOverCurrentContext
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)testPriority
{
    TestPriorityViewController *vc = [[TestPriorityViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)dynamicLabel
{
    DynamicLabelViewController *vc = [[DynamicLabelViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (void)dynamicCell
{
    AlterableHeightCellViewController *vc = [[AlterableHeightCellViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)adScrollView
{
    AdViewController *vc = [[AdViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)my
{
    HXYMyViewController *vc = [[HXYMyViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)bezierPathLearning
{
    BezierPathLearning *bezierPathView = [[BezierPathLearning alloc]init];
    [self.view addSubview:bezierPathView];
    [bezierPathView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).mas_offset(130);
        make.height.mas_equalTo(100);
    }];
    
}

//BezierPath画图
- (void)drawCurveView
{
    //尝试用BezierPath画图,失败,数学不过关,不过也学到了不少东西
    //    drawCurve *drawCurveView = [[drawCurve alloc]init];
    //    [view addSubview:drawCurveView];
    //    [drawCurveView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.right.mas_equalTo(view);
    //        make.top.mas_equalTo(view.mas_top).mas_offset(130);
    //        make.height.mas_equalTo(100);
    //    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
