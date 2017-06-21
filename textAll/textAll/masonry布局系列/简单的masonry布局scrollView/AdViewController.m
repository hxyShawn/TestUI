//
//  AdViewController.m
//  textAll
//
//  Created by liangqi on 17/6/8.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import "AdViewController.h"

@interface AdViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation AdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.pagingEnabled = NO;
    [self.view addSubview:self.scrollView];
    self.scrollView.backgroundColor = [UIColor lightGrayColor];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);//scrollView必须要设置这个四个边,但是光设置了四个边不会有显示,因为scrollView的size由subView决定的
    }];
    UIView *containerView = [[UIView alloc]init];
    containerView.backgroundColor = [UIColor yellowColor];
    [self.scrollView addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.scrollView);
        //内容的宽度必须自己设置,因为scrollView的宽度和contentSize都是由subView决定的
        //这里,千万不要写死要改变的东西,比如如果是横向的话就是写死高度就好了,纵向写死宽度
        make.height.mas_equalTo(ScreenHeight);
    }];
    
    UIView *lastView = nil;
    NSArray *colorArray = @[[UIColor redColor],[UIColor greenColor],[UIColor purpleColor],[UIColor grayColor]];
    for (int i=0; i<4; i++) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = colorArray[i];
        [containerView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(containerView);
            make.width.mas_equalTo(ScreenWidth);
            if (lastView) {
                make.left.mas_equalTo(lastView.mas_right);
            }else{
                make.left.mas_equalTo(0);
            }
        }];
        lastView = view;
    }
    [containerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lastView);
    }];
    [self scroll];
    
}

- (void)scroll
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        dispatch_sync(dispatch_get_main_queue(), ^{
            CGFloat targetX = self.scrollView.contentOffset.x+self.scrollView.frame.size.width;
            BOOL animated = YES;
            [_scrollView setContentOffset:CGPointMake(targetX, 0) animated:animated];

//        });
    }];
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
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
