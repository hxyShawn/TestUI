 //
//  HXYShopChooseItemsView.m
//  manmanda
//
//  Created by liangqi on 17/5/2.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYShopChooseItemsView.h"
#import "UIButton+HXYCategory.h"
#import "NSString+HXYCategory.h"
#import "HXYShopDetailModel.h"
#import "MJExtension.h"
#import "UIView+HXYCategory.h"
static CGFloat const leading = 16;

@interface HXYShopChooseItemsView()

@property (nonatomic, strong)NSMutableArray *itemArray;
@property (nonatomic, strong)NSMutableArray *itemFrameArray;
@property (nonatomic, strong) HXYShopDetailModel *model;
@property (nonatomic, strong)NSMutableArray *selectedItemArray;

@end

@implementation HXYShopChooseItemsView

- (NSMutableArray *)selectedItemArray
{
    if (!_selectedItemArray) {
        _selectedItemArray = [NSMutableArray array];
    }
    return _selectedItemArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.itemArray = [NSMutableArray array];
        self.itemFrameArray = [NSMutableArray array];
    }
    return self;
}

- (void)setModel:(HXYShopDetailModel *)model
{
    _model = model;
    self.typeArray = model.datas;
    self.title = model.title;
}

- (void)setDataWithDic:(NSDictionary *)dict
{
    self.model = [HXYShopDetailModel mj_objectWithKeyValues:dict];

    CGFloat top = 14;
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Medium" size:15]?[UIFont fontWithName:@"PingFangSC-Medium" size:15]: [UIFont fontWithName:@"PingFang-SC-Medium" size:15];
    NSDictionary *attrDict = @{NSFontAttributeName : font,NSForegroundColorAttributeName : RGBA(0, 0, 0, 0.86), NSKernAttributeName : @1.0};
    self.titleLabel.attributedText = [[NSAttributedString alloc]initWithString:self.title attributes:attrDict];
    [self.titleLabel sizeToFit];
    self.titleLabel.frame = CGRectMake(16, top, self.titleLabel.width, self.titleLabel.height);

    if (self.typeArray.count >0) {
        [self.typeArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *title = (NSString *)obj;
            UIFont *itemFont = [UIFont fontWithName:@"PingFangSC-Regular" size:13]?[UIFont fontWithName:@"PingFangSC-Regular" size:13]: [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            item.tag = idx;
            NSDictionary *attrDict = [item setFont:itemFont titleColor:RGBA(0, 0, 0, 0.54) kern:2.0];
            [item setAttributedTitle:[[NSAttributedString alloc]initWithString:title attributes:attrDict]             forState:UIControlStateNormal];
            [self addSubview:item];
            
            NSValue *value = self.itemFrameArray[idx];
            CGRect rect = [value CGRectValue];
            item.frame = rect;
            [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
            [item setBackgroundImage:[item buttonImageFromColor:UIColorFromRGB(0xf8f8f8)] forState:UIControlStateNormal];
            [item setBackgroundImage:[item buttonImageFromColor:UIColorFromRGB(NewPinkValue)] forState:UIControlStateSelected];

            item.layer.mask = [item setCornerRadius:2 RoundingCorners:UIRectCornerAllCorners];
            [self.itemArray addObject:item];
        }];
    }
    
    [self addSubview:self.line];
    CGFloat lineY = self.typeArray.count == 0? self.titleLabel.bottom + 15 : self.height - 0.5;
    if (self.typeArray.count == 0) {
        self.line.frame = CGRectMake(leading, lineY, ScreenWidth - leading, 0.5);
    }else{
        self.line.frame = CGRectMake(leading, lineY, ScreenWidth - leading, 0.5);
    }
}

- (CGFloat)heightWithDic:(NSDictionary *)dict
{
    self.model = [HXYShopDetailModel mj_objectWithKeyValues:dict];
    
    CGFloat height = 0;
    
    CGFloat itemMinW = 80;
    CGFloat itemH = 32;
    CGFloat margin = 8;
    CGFloat itemY = 48;
    CGFloat locX  = 0;
    CGFloat col = 0;
    CGFloat itemX = 0;
    for (int i=0; i<self.typeArray.count; i++) {
        UIFont *itemFont = [UIFont fontWithName:@"PingFangSC-Regular" size:13]?[UIFont fontWithName:@"PingFangSC-Regular" size:13]: [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        NSDictionary *attrDict = @{NSFontAttributeName : itemFont,NSKernAttributeName : @2.0};
        NSString *title = self.typeArray[i];
        CGFloat itemW = [title widthWithAttributes:attrDict size:CGSizeMake(MAXFLOAT, itemH)];
        itemW = itemW>itemMinW?itemW+20:itemMinW;
        
        //MARK: 判断当前的文字的长度加起来是否已经超过限定的宽度
        
        if (locX+itemW > ScreenWidth) {
            itemY += (itemH+8);
            col = 0;
            locX = 0;
        }
        if (col == 0) {
            itemX = leading;
            locX = leading + itemW +margin;
        }else{
            
            itemX = locX;
            locX += itemW +margin;
        }
        col ++;
        
        height = itemY + itemH;
        CGRect rect = CGRectMake(itemX, itemY, itemW, itemH);
        [self.itemFrameArray addObject:[NSValue valueWithCGRect:rect]];
    }
    return height + 15;
}

- (void)itemClick:(UIButton *)btn
{
    if ([_delegate respondsToSelector:@selector(HXYShopChooseItemsView:didSelectItem:)]) {
        [_delegate HXYShopChooseItemsView:self didSelectItem:btn];
    }
    btn.selected = !btn.selected;
    if (btn.selected) {
        [self.selectedItemArray addObject:btn];
    }
    HXYLog();
}
@end
