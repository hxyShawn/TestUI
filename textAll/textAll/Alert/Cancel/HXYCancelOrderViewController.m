//
//  HXYCancelOrderViewController.m
//  manmanda
//
//  Created by liangqi on 17/6/28.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYCancelOrderViewController.h"
#import "HXYCancelTableViewCell.h"
#import "Masonry.h"
#import "UITableViewCell+HXYCategory.h"
static NSString *cellId = @"cellId";
@interface HXYCancelOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;
@property (nonatomic, assign) NSInteger  selectedRow;
@end

@implementation HXYCancelOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
        如果其他地方也用到,只要外面加个数组,然后再刷新界面
        如果界面有些不同,比如其他原因要加个输入框,就再扩展
     */
    
    /*
     使用这个的时候需要先给这个类的实例设置
     HXYCancelOrderViewController *vc = modalPresentationStyle = UIModalPresentationOverCurrentContext;[[HXYCancelOrderViewController alloc]init];
     vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
     */
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    self.dataArray = @[@"我不想订购了",@"信息填写错误,重拍",@"卖家没时间/缺货",@"其他原因"];
    [self initUI];
}

- (void)initUI
{
    UIColor *textColor = RGBA(0, 0, 0, 0.54);
    
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 5;
    [bgView clipsToBounds];
    [self.view addSubview:bgView];
    
    //MARK:topView
    UIView *topView = [[UIView alloc]init];
    [bgView addSubview:topView];
    UILabel *titleLable = [[UILabel alloc]init];
    [topView addSubview:titleLable];
    titleLable.textColor = RGBA(0, 0, 0, 0.87);
    titleLable.text = @"请选择取消理由";
//    titleLable.font = PF(Medium, 15);
    [titleLable sizeToFit];
    
    UIView *topLine = [[UIView alloc]init];
    topLine.backgroundColor = UIColorFromRGB(SepratorColor);
    [topView addSubview:topLine];
    
    //MARK:tableView
    [bgView addSubview:self.tableView];
    
    //Mark:bottomView
    UIView *bottomView = [[UIView alloc]init];
    [bgView addSubview:bottomView];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:textColor forState:UIControlStateNormal];
//    cancelBtn.titleLabel.font = PF(Regular, 13);
    [bottomView addSubview:cancelBtn];
    [cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:textColor forState:UIControlStateNormal];
//    confirmBtn.titleLabel.font = PF(Regular, 13);
    [bottomView addSubview:confirmBtn];
    [confirmBtn addTarget:self action:@selector(confirmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //MARK:layout
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.mas_equalTo(240*kWidthScale);
        make.height.mas_equalTo(268*kHeightScale);
    }];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(bgView);
        make.height.mas_equalTo(44*kHeightScale);
    }];
    
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topView.mas_centerX);
        make.centerY.equalTo(topView.mas_centerY);
        make.size.mas_equalTo(titleLable.frame.size);
    }];
    
    [topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(topView);
        make.bottom.equalTo(topView.mas_bottom).offset(-DefaultLineHight);
        make.height.mas_equalTo(DefaultLineHight);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bgView);
        make.top.equalTo(topView.mas_bottom);
        make.bottom.equalTo(bottomView.mas_top);
    }];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(bgView);
        make.height.mas_equalTo(44*kHeightScale);
    }];
    
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(bottomView).multipliedBy(0.5);
        make.left.top.bottom.equalTo(bottomView);
    }];
    
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(bottomView);
        make.width.equalTo(bottomView).multipliedBy(0.5);
    }];
}

#pragma mark - btnAction
- (void)confirmBtnClick:(UIButton *)btn
{
    if ([_delegate respondsToSelector:@selector(HXYCancelOrderViewController:confirmCancelID:)]) {
        [_delegate HXYCancelOrderViewController:self confirmCancelID:self.toBeCanceledId];
    }
    if (self.confirmCancel) {
        
        self.confirmCancel(self.toBeCanceledId);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)cancelBtnClick:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45*kHeightScale;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HXYCancelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[HXYCancelTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        //分割线顶到最前面
        [cell setSepratorLine];
        if (indexPath.row == self.selectedRow) {
            [cell changeBtnState:1];
        }
    }

    [cell confCell:self.dataArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HXYCancelTableViewCell *lastCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.selectedRow inSection:0]];
    [lastCell changeBtnState:0];
    self.selectedRow = indexPath.row;
    HXYCancelTableViewCell *currentCell = [tableView cellForRowAtIndexPath:indexPath];
    [currentCell changeBtnState:1];
}

#pragma mark - getter&setter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = NO;
        _tableView.separatorColor = UIColorFromRGB(SepratorColor);
    }
    return _tableView;
}

@end
