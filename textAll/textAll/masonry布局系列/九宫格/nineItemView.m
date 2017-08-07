//
//  nineItemView.m
//  textAll
//
//  Created by 贺东方 on 17/8/7.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import "nineItemView.h"

@implementation nineItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self confUI];
    }
    return self;
}

- (void)confUI
{
    CGFloat w = (ScreenWidth -24)/3;
    UIView *bgview = [[UIView alloc]init];
    [self addSubview:bgview];
    bgview.layer.borderColor = [UIColor blackColor].CGColor;
    bgview.layer.borderWidth = 1.0;
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.right.left.equalTo(self);
    }];
    
    
    UIView *lastView = nil;
    for (NSInteger i = 0; i<7; i++) {
        UIView *view = [[ UIView alloc]init];
        [bgview addSubview:view];
        view.backgroundColor = [UIColor colorWithHue:(arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:1.0];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i%3 == 0) {
                if (lastView) {
                    make.top.equalTo(lastView.mas_bottom).offset(6);
                }else{
                    make.top.equalTo(bgview).offset(6);
                }
                make.left.equalTo(bgview).offset(6);
            }else if (i%3 == 1)
            {
                make.left.equalTo(lastView.mas_right).offset(6);
                make.top.equalTo(lastView.mas_top);
            }else{
                make.left.equalTo(lastView.mas_right).offset(6);
                make.right.equalTo(bgview.mas_right).offset(-6);
                make.top.equalTo(lastView.mas_top);
            }
            make.height.equalTo(@(w));
            make.width.equalTo(@(w));
        }];
        lastView = view;
    }
    [lastView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgview.mas_bottom);
    }];

}

/**
 九宫格布局（不限于九宫格，可以是N个格子），每个格子给定高（cellHeight）宽（cellWidth），
 每行格子数量（numPerRow），格子总数量（totalNum），格子与边界距离（viewPadding），格
 子之间的距离（viewPaddingCell）。
 @param cellWidth       格子宽度
 @param cellHeight      格子高度
 @param numPerRow       每行格子数量
 @param totalNum        格子总数量
 @param viewPadding     格子与边界距离
 @param viewPaddingCell 格子之间的距离
 @param superView       父视图
 */
- (void)gridWithCellWidth:(CGFloat)cellWidth
               cellHeight:(CGFloat)cellHeight
                numPerRow:(NSInteger)numPerRow
                 totalNum:(NSInteger)totalNum
              viewPadding:(CGFloat)viewPadding
          viewPaddingCell:(CGFloat)viewPaddingCell
                superView:(UIView *)superView
{
    __block UILabel *lastView = nil;// 创建一个空view 代表上一个view
    __block UILabel *lastRowView;// 创建一个空view 代表上一行view
    __block NSInteger lastRowNo = 0;//上一行的行号
    NSMutableArray *cells = [[NSMutableArray alloc] init];
    for (int i = 0; i < totalNum; i++) {
        UILabel *aLabel = [UILabel new];
        aLabel.text = [NSString stringWithFormat:@"%d",i];
        [superView addSubview:aLabel];
        aLabel.backgroundColor = [UIColor colorWithHue:(arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                            brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:1.0];
        [cells addObject:aLabel];
    }
    // 循环创建view
    for (int i = 0; i < cells.count; i++)
    {
        UILabel *lb = cells[i];
        BOOL isFirstRow = [self isFirstRowWithIndex:i numOfRow:numPerRow];
        BOOL isFirstCol = [self isFirstColumnWithIndex:i numOfRow:numPerRow];
        BOOL isLastCol = [self isLastColumnWithIndex:i numOfRow:numPerRow totalNum:totalNum];
        BOOL isLastRow = [self isLastRowWithIndex:i numOfRow:numPerRow totalNum:totalNum];
        NSInteger curRowNo = i/numPerRow;
        if (curRowNo != lastRowNo)
        {//如果当前行与上一个view行不等，说明换行了
            lastRowView = lastView;
            lastRowNo = curRowNo;
        }
        // 添加约束
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(cellWidth));
            make.height.equalTo(@(cellHeight));
            if (isFirstRow)
            {
                make.top.equalTo(superView.mas_top).with.offset(viewPadding);
            }
            else
            {
                if (lastRowView)
                {
                    make.top.equalTo(lastRowView.mas_bottom).with.offset(viewPaddingCell);
                }
            }
            if (isFirstCol)
            {
                make.left.equalTo(superView.mas_left).with.offset(viewPadding);
            }
            else
            {
                if (lastView)
                {
                    make.left.equalTo(lastView.mas_right).with.offset(viewPaddingCell);
                }
            }
            if (isFirstRow && isLastCol)
            {
                make.right.equalTo(superView.mas_right).with.offset(-viewPadding);
            }
            if (isLastRow && isFirstCol)
            {
                make.bottom.equalTo(superView.mas_bottom).with.offset(-viewPadding);
            }
        }];
        // 每次循环结束 此次的View为下次约束的基准
        lastView = lb;
    }
}
/**
 是否第一行
 @param index    当前下标
 @param numOfRow 每行个数
 @return YES OR NO
 */
- (BOOL)isFirstRowWithIndex:(NSInteger)index numOfRow:(NSInteger)numOfRow
{
    if (numOfRow != 0)
    {
        return index/numOfRow == 0;
    }
    return NO;
}
/**
 是否第一列
 @param index    当前下标
 @param numOfRow 每行个数
 @return YES OR NO
 */
- (BOOL)isFirstColumnWithIndex:(NSInteger)index numOfRow:(NSInteger)numOfRow
{
    if (numOfRow != 0)
    {
        return index%numOfRow == 0;
    }
    return NO;
}
/**
 是否最后一行
 @param index    当前下标
 @param numOfRow 每行个数
 @return YES OR NO
 */
- (BOOL)isLastRowWithIndex:(NSInteger)index numOfRow:(NSInteger)numOfRow totalNum:(NSInteger)totalNum
{
    NSInteger totalRow = ceil(totalNum/((CGFloat)numOfRow));//总行数
    if (numOfRow != 0)
    {
        return index/numOfRow == totalRow - 1;
    }
    return NO;
}
/**
 是否最后一列
 @param index    当前下标
 @param numOfRow 每行个数
 @return YES OR NO
 */
- (BOOL)isLastColumnWithIndex:(NSInteger)index numOfRow:(NSInteger)numOfRow totalNum:(NSInteger)totalNum
{
    if (numOfRow != 0)
    {
        if (totalNum < numOfRow)
        {//总数小于每行最大个数时，如果index是最后一个，那么也是最后一列
            return index == totalNum-1;
        }
        return index%numOfRow == numOfRow - 1;
    }
    return NO;
}
@end
