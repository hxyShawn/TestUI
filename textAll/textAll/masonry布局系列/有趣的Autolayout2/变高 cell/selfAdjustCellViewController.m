//
//  selfAdjustCellViewController.m
//  textAll
//
//  Created by 贺东方 on 17/6/25.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import "selfAdjustCellViewController.h"
#import "Model.h"
#import "SelfAdjustTableViewCell.h"
#import "Common.h"
static NSString *cellId = @"cellid";
#define IOS_8_NEW_FEATURE_SELF_SIZING
@interface selfAdjustCellViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SelfAdjustTableViewCell *templateCell;
@property (nonatomic, strong) NSArray *data;
@end

@implementation selfAdjustCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    
    [self generateData];
    [self.tableView reloadData];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[SelfAdjustTableViewCell class] forCellReuseIdentifier:cellId];
        _tableView.estimatedRowHeight = 80;
//#ifdef IOS_8_NEW_FEATURE_SELF_SIZING
        // iOS 8 的Self-sizing特性
        if ([UIDevice currentDevice].systemVersion.integerValue > 7) {
            _tableView.rowHeight = UITableViewAutomaticDimension;
        }
//#endif

    }
    return _tableView;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//#ifdef IOS_8_NEW_FEATURE_SELF_SIZING
    // iOS 8 的Self-sizing特性
    return UITableViewAutomaticDimension;
//#else
//    
//    if (!_templateCell) {
//        _templateCell = [tableView dequeueReusableCellWithIdentifier:cellId];
//        _templateCell.tag = -1000; // For debug dealloc
//    }
//    
//    // 获取对应的数据
//    Model *dataEntity = _data[(NSUInteger) indexPath.row];
//    
//    // 判断高度是否已经计算过
//    if (dataEntity.cellHeight <= 0) {
//        // 填充数据
//        [_templateCell setupData:dataEntity];
//        // 根据当前数据，计算Cell的高度，注意+1
//        dataEntity.cellHeight = [_templateCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 0.5f;
//        NSLog(@"Calculate: %ld, height: %g", (long) indexPath.row, dataEntity.cellHeight);
//    } else {
//        NSLog(@"Get cache: %ld, height: %g", (long) indexPath.row, dataEntity.cellHeight);
//    }
//    
//    return dataEntity.cellHeight;
//#endif
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SelfAdjustTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    [cell setupData:_data[(NSUInteger) indexPath.row]];
    return cell;
}
// 生成数据
- (void)generateData {
    NSMutableArray *tmpData = [NSMutableArray new];
    
    for (int i = 0; i < 20; i++) {
        Model *dataEntity = [Model new];
        dataEntity.avatar = [UIImage imageNamed:[NSString stringWithFormat:@"bluefaces_%d", (i % 4) + 1]];
        dataEntity.title = [NSString stringWithFormat:@"Title: %d", i];
        dataEntity.content = [Common getText:@"content-" withRepeat:i * 2 + 1];
        [tmpData addObject:dataEntity];
    }
    
    _data = tmpData;
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
