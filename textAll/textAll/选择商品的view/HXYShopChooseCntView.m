//
//  HXYShopChooseCntView.m
//  manmanda
//
//  Created by liangqi on 17/5/3.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYShopChooseCntView.h"
#import "UILabel+HXYCategory.h"
#import "UIView+YYAdd.h"
#import "HXYChosenTicketTableViewCell.h"
#import "HXYChooseTicketView.h"
#import "UIColor+HXYCategory.h"
#import "NSString+HXYCategory.h"

static const CGFloat rowH = 49; //每一个view都是这个高度
@interface HXYShopChooseCntView()<HXYChosenTicketTableViewCellDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UILabel *priceCntLabel;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) NSMutableArray *itemArray;
@end

@implementation HXYShopChooseCntView

@synthesize viewH = _viewH;

- (NSMutableArray *)itemArray
{
    if (!_itemArray) {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}
-(NSMutableArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [NSMutableArray array];
    }
    return _titleArray;
}
- (HXYKVOArrayModel *)ticketsModel
{
    if (!_ticketsModel) {
        _ticketsModel = [[HXYKVOArrayModel alloc]init];
    }
    return _ticketsModel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
        [self initUI];
    }
    return self;
}
- (UITableView *)ticketsView
{
    if (!_ticketsView) {
        _ticketsView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _ticketsView.delegate = self;
        _ticketsView.dataSource = self;
    }
    return _ticketsView;
}
- (void)initData
{
    
}

- (void)initUI
{
    [self addSubview:self.ticketsView];
    
    [self initBottomView];
}

- (void)initBottomView
{
    self.bottomView = [[UIView alloc]init];
    [self addSubview:self.bottomView];
    self.bottomView.frame = CGRectMake(0, self.height - rowH, ScreenWidth, rowH);
    CGFloat hideBtnW = 24;
    CGFloat hideBtnH = 14;
    CGFloat hideBtnY = (49-hideBtnH)/2;
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0 , ScreenWidth/2, rowH)];
    [self.bottomView addSubview:bgView];
    
    UIButton *hideBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [hideBtn setBackgroundImage:[UIImage imageNamed:@"activity_choose_hideBtn"] forState:UIControlStateNormal];
    [hideBtn setBackgroundImage:[UIImage imageNamed:@"activity_choose_hideBtnSelected"] forState:UIControlStateSelected];
    [bgView addSubview:hideBtn];
    [hideBtn addTarget:self action:@selector(hideBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    hideBtn.frame = CGRectMake(8, hideBtnY, hideBtnW, hideBtnH);
    
    UIView *lineView = [[UIView alloc]init];
    [bgView addSubview:lineView];
    lineView.backgroundColor = [UIColor colorWithHexString:@"DADADA"];
    lineView.frame = CGRectMake(hideBtn.right + 8,10, 0.5, 30);
    
    UILabel *priceCntLabel = [[UILabel alloc]init];
    [bgView addSubview:priceCntLabel];
    priceCntLabel.frame = CGRectMake(lineView.right + 16,13 , 100, 23);
    self.priceCntLabel = priceCntLabel;
    
    UIButton *confirmBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    confirmBtn.backgroundColor = UIColorFromRGB(NewPinkValue);
    confirmBtn.frame = CGRectMake(ScreenWidth/2, 0, ScreenWidth/2, rowH);
    [confirmBtn setTitle:@"确认订单" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.bottomView addSubview:confirmBtn];
    [confirmBtn addTarget:self action:@selector(confirmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setViewH:(CGFloat)viewH
{
    _viewH = viewH;
    CGRect rect = self.frame;
    rect.size.height = viewH;
    rect.origin.y = ScreenHeight - 64 - viewH;
    self.frame = rect;
    
}

- (void)addTicketViewWithType:(NSString *)type item:(UIButton *)item
{
    if ([NSString isNullOrEmpty:type] || !item) {return;}
    
    NSMutableArray *array = [self.ticketsModel mutableArrayValueForKeyPath:@"array"];
    [array addObject:type];
    [self.ticketsView beginUpdates];
    NSArray *tempIndexPathArr = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:array.count -1 inSection:0]];
    [self.ticketsView insertRowsAtIndexPaths:tempIndexPathArr withRowAnimation:UITableViewRowAnimationFade];
    [self.ticketsView endUpdates];
    [self adjustContent];
    [self.itemArray addObject:item];
    [self.ticketsView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.ticketsModel.array.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

- (void)deleteTicketViewWithType:(NSString *)type item:(UIButton *)item
{
    NSMutableArray *array = [self.ticketsModel mutableArrayValueForKey:@"array"];
    if (array.count == 0) {return;}
    
    NSString *title = [item attributedTitleForState:UIControlStateNormal].string;
    NSInteger index = [array indexOfObject:title];
    
    if (index == NSNotFound) {return;}
    [array removeObjectAtIndex:index];
    [self.ticketsView beginUpdates];
    NSArray *tempIndexPathArr = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:index inSection:0]];
    [self.ticketsView deleteRowsAtIndexPaths:tempIndexPathArr withRowAnimation:UITableViewRowAnimationFade];
    [self.ticketsView endUpdates];
    [self adjustContent];
    [self.itemArray removeObject:item];
}

- (CGFloat)viewH
{
    return _viewH;
}

- (void)priceChange:(NSInteger)singlePrice count:(NSInteger)count
{
    NSString *priceStr = [NSString stringWithFormat:@"¥%ld ",(long)singlePrice];
    NSString *cntStr = [NSString stringWithFormat:@"(%ld张)",(long)count];
    NSAttributedString *cntAttrStr = [[NSAttributedString alloc]initWithString:cntStr attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"000000" alpha:0.26],NSFontAttributeName : [UIFont systemFontOfSize:13],NSKernAttributeName : @1.0}];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:priceStr attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"FF6FA2"],NSFontAttributeName : [UIFont systemFontOfSize:20],NSKernAttributeName : @1.0}];
    [str appendAttributedString:cntAttrStr];
    self.priceCntLabel.attributedText = str;
}

- (void)hideBtnClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
    self.ticketsView.hidden = !self.ticketsView.hidden;
}

- (void)confirmBtnClick:(UIButton *)btn
{
    HXYLog();
}

- (void)adjustContent
{
    if (self.ticketsModel.array.count <=3) {
        self.ticketsView.bounces = NO;
        self.viewH = self.ticketsModel.array.count * rowH +rowH;
        self.ticketsView.frame = CGRectMake(0, 0, ScreenWidth, self.ticketsModel.array.count * rowH);
    }
    self.ticketsView.bounces = YES;
    self.bottomView.frame = CGRectMake(0, self.height - rowH, ScreenWidth, rowH);
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.ticketsModel.array.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return rowH;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellId";
    HXYChosenTicketTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[HXYChosenTicketTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.delegate = self;
    }
    cell.indexPath = indexPath;
    cell.title = self.ticketsModel.array[indexPath.row];
    [self.ticketsModel.cellDic setObject:cell forKey:self.ticketsModel.array[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - HXYChosenTicketTableViewCellDelegate
- (void)HXYChosenTicketTableViewCell:(HXYChosenTicketTableViewCell *)cell
{
    NSString *title = cell.title;
    if (self.ticketsModel.array.count == 0) {return;}
    if (!cell) {return;}
    NSIndexPath *indexPath = [self.ticketsView indexPathForCell:cell];
    NSInteger row = indexPath.row;
    [self.ticketsView beginUpdates];
    [self.ticketsModel.array removeObject:title];
    NSArray *tempArray = [NSArray arrayWithObject:indexPath];
    [self.ticketsView deleteRowsAtIndexPaths:tempArray withRowAnimation:UITableViewRowAnimationTop];
    [self.ticketsView endUpdates];
    
    [self adjustContent];
    if ([self.itemArray[indexPath.row] isKindOfClass:[UIButton class]]) {
        UIButton *item = self.itemArray[indexPath.row];
        item.selected = !item.selected;
        [self.itemArray removeObject:item];
    }
}
@end
