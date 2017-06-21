//
//  TestPriorityViewController.m
//  textAll
//
//  Created by liangqi on 17/6/13.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import "TestPriorityViewController.h"

@interface TestPriorityViewController ()

@end

@implementation TestPriorityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *view = [[UIView alloc]init];
    [self.view addSubview:view];
    
    UILabel *label = [[UILabel alloc]init];
    [self.view addSubview:label];
    label.numberOfLines = 0;
    NSString *str = @"压缩阻力是为了防止视图内容被剪切，拉伸阻力是为了防止视图内容被扩大。决定压缩阻力或拉伸阻力是否能够成功的是你设置的内容大小的约束优先级是多少。以压缩阻力来说，前面提到过，枚举值UILayoutPriorityDefaultHigh表示的就是压缩阻力的优先级，即750。若你给视图设置的保持内容大小的约束优先级大于750，则说明保持视图内容大小更迫切，则即使设置的尺寸约束比内容大小要小，也不会对视图进行剪切，因为压缩阻力起作用了。用代码来写就是这样：";
    label.text = str;
    label.preferredMaxLayoutWidth = ScreenWidth - 20;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(10);
        make.right.offset(-10);
    }];
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
