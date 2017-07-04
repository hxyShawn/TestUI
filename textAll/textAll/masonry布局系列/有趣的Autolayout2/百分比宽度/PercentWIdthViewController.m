//
//  PercentWIdthViewController.m
//  textAll
//
//  Created by 贺东方 on 17/6/22.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import "PercentWIdthViewController.h"

@interface PercentWIdthViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewWidthConstraint;
@property (assign, nonatomic) CGFloat maxWidth;
@end

@implementation PercentWIdthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //保存最大宽度
    _maxWidth = _containerViewWidthConstraint.constant;
    
    [self initView];
}

- (IBAction)modifyContainerViewWidth:(UISlider *)sender {
    if (sender.value) {
        //改变containerView的宽度
        _containerViewWidthConstraint.constant = sender.value * _maxWidth;
    }
}


- (void) initView {
    UIView *subView = [UIView new];
    subView.backgroundColor = [UIColor redColor];
    
    [_containerView addSubview:subView];
    
    [subView mas_makeConstraints:^(MASConstraintMaker *make) {
        //上下左贴边
        make.left.equalTo(_containerView.mas_left);
        make.top.equalTo(_containerView.mas_top);
        make.bottom.equalTo(_containerView.mas_bottom);
        
        //宽度为父view的宽度的一半
        make.width.equalTo(_containerView.mas_width).multipliedBy(0.5);
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
