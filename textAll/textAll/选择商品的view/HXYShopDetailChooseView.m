//
//  HXYShopDetailChooseView.m
//  manmanda
//
//  Created by liangqi on 17/4/28.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYShopDetailChooseView.h"
#import "UIColor+HXYCategory.h"
#import "HXYShopChooseTextView.h"
#import "HXYShopChooseItemsView.h"
#import "HXYShopChooseHeadView.h"
#import "HXYShopDetailModel.h"
#import "HXYShopHeadModel.h"
#import "HXYShopChooseCntView.h"
#import "MJExtension.h"
static const CGFloat maskH = 180;
static const CGFloat btnH = 49;

@interface HXYShopDetailChooseView()<HXYShopChooseItemsViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *viewArray;
@property (nonatomic, strong) UIView *contentBgView;
@property (nonatomic, strong) HXYShopChooseCntView *countView;
@end

@implementation HXYShopDetailChooseView

- (HXYShopChooseCntView *)countView
{
    if (!_countView) {
        _countView = [[HXYShopChooseCntView alloc]init];
        _countView.frame = CGRectMake(0, ScreenHeight - 49 - 64, ScreenWidth, 49);
        [self.contentBgView addSubview:_countView];
    }
    return _countView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
        [self initUI];
    }
    return self;
}

- (void)initData
{
    //MARK: 视图的搭建心路历程
    /*
      票务类型,票务种类,票务时间应该是作为一个单独的比如itemView之类的,item的长度小于等于四个字的时候,固定宽度80,如果当前屏幕放不下就换行,间距固定,即如果换行的话剩下来的地方就空着好了.如果字符串的高度大于固定宽度80,那么宽度就是字符串的宽度+20,左右都10
    */
    self.viewArray = [NSMutableArray array];
}

- (void)initUI
{
    self.backgroundColor = [UIColor clearColor];
    self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    
    UIView *maskBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, maskH)];
    maskBgView.backgroundColor = [UIColor colorWithHexString:@"000000" alpha:0.5];
    [self addSubview:maskBgView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(maskTap:)];
    [maskBgView addGestureRecognizer:tap];
    
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 300 - btnH)];
    _scrollView.alwaysBounceHorizontal = NO;
    _scrollView.bounces = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.scrollView];
    
    self.contentBgView = [[UIView alloc]init];
    [self.scrollView addSubview:self.contentBgView];
    self.contentBgView.backgroundColor = [UIColor whiteColor];
    self.contentBgView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    
//    [self initConfirmBtn];
}

- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    
    CGFloat headH = 100;
    HXYShopHeadModel *headModel = [[HXYShopHeadModel alloc]init];
    headModel.imgUrl = nil;
    headModel.title = @"titletitletitletitle";
    headModel.price = @"200";
    
    HXYShopChooseHeadView *headView = [[HXYShopChooseHeadView alloc]init];
    [self addSubview:headView];
    headView.backgroundColor = [UIColor whiteColor];
    headView.frame = CGRectMake(0, maskH, ScreenWidth, headH);
    [headView setDataWithModel:headModel];
    
    self.scrollView.frame = CGRectMake(0, headView.bottom, ScreenWidth, ScreenHeight - headView.bottom);
    
    
    HXYShopDetailModel *model = [[HXYShopDetailModel alloc]init];
    model.title = @"票务种类";
    model.datas = @[@"一",@"二个",@"三个字",@"四个字四四个",@"五个字五个",@"六个字六个字",@"七个字七个字七"];
    
    NSDictionary *introDic = @{@"title":@"票务类型",@"datas":@"123123123123剪短发拉设计费考虑到监考老师极度分裂会计师付款了上架了科三教练圣诞节福利可视对讲流口水就考虑到就分手了空间登录开始就"};
    NSDictionary *typeDic = @{@"title":@"票务类型",@"datas":@[@"预售",@"现场" ]};
    NSDictionary *formDic = @{@"title":@"票务种类",@"datas":@[@"通票",@"两日通票",@"三日通票",@"VIP",@"单日票",@"三日通票12232323",@"三日通票11",@"三日通票11",@"三日通票2",@"三日通票"]};
    NSDictionary *timeDic = @{@"datas": @[@"7.21 17:00 - 19:00",@"7.21 17:00 - 19:00",@"7.21 17:00 - 19:00",@"7.21 17:00 - 19:00",@"7.21 17:00 - 19:00",@"7.21 17:00 - 19:00",@"7.21 17:00 - 19:00"],@"title":@"票务时间"};
    
    HXYShopChooseTextView *introView = [[HXYShopChooseTextView alloc]init];
    [self.contentBgView addSubview:introView];
    introView.frame = CGRectMake(0, 0, ScreenWidth, [introView heightWithDic:introDic]);
    [introView setDataWithDic:introDic];
    
    HXYShopChooseItemsView *typeView = [[HXYShopChooseItemsView alloc]init];
    [self.contentBgView addSubview:typeView];
    typeView.frame = CGRectMake(0, introView.bottom, ScreenWidth, [typeView heightWithDic:typeDic]);
    [typeView setDataWithDic:typeDic];
    
    HXYShopChooseItemsView *formView = [[HXYShopChooseItemsView alloc]init];
    formView.delegate = self;
    [self.contentBgView addSubview:formView];
    formView.frame = CGRectMake(0, typeView.bottom, ScreenWidth, [formView heightWithDic:formDic]);
    [formView setDataWithDic:formDic];
    
    HXYShopChooseItemsView *timeView = [[HXYShopChooseItemsView alloc]init];
    [self.contentBgView addSubview:timeView];
    timeView.frame = CGRectMake(0, formView.bottom, ScreenWidth, [timeView heightWithDic:timeDic]);
    [timeView setDataWithDic:timeDic];
    
    CGFloat contentH = ScreenWidth - introView.bottom - btnH > timeView.bottom?ScreenWidth- introView.bottom: timeView.bottom;
    self.contentBgView.frame = CGRectMake(0, 0, ScreenWidth, contentH);
    self.scrollView.frame = CGRectMake(0, headView.bottom, ScreenWidth, ScreenHeight - headView.bottom);
    self.scrollView.contentSize = CGSizeMake(ScreenWidth, self.contentBgView.height);
}

- (void)HXYShopChooseItemsView:(HXYShopChooseItemsView *)chooseItemsView didSelectItem:(UIButton *)item
{
//    [self.countView addTicketView];
}

- (void)maskTap:(UITapGestureRecognizer *)ges
{
    [self remove];
}

- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}
- (void)remove
{
    [self removeFromSuperview];
}
@end
