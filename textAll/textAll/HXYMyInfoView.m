//
//  HXYMyInfoView.m
//  textAll
//
//  Created by 贺东方 on 17/6/1.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import "HXYMyInfoView.h"
#import "HXYHorizontalTextButton.h"
#import "HXYCustomButton.h"


static const CGFloat btnW = 40;

@interface HXYMyInfoView()

@property (nonatomic, strong) UIView *upView;   //topView的上部分
@property (nonatomic, strong) UIView *downView; //topView的下部分
@property (nonatomic, strong) UIView *topView;  //显示信息的view
@property (nonatomic, strong) UIView *middleView;   //中间的三个按钮
@property (nonatomic, strong) UIView *bottomView;   //下面的三个按钮
@property (nonatomic, strong) UIView *avatarView;   //头像
@property (nonatomic, strong) HXYHorizontalTextButton *followBtn;   //关注
@property (nonatomic, strong) HXYHorizontalTextButton *fansBtn;     //烦死
@property (nonatomic, strong) HXYHorizontalTextButton *skillBtn;    //技能
@property (nonatomic, strong) NSMutableArray *topArray;
@property (nonatomic, strong) NSMutableArray *middleArray;
@property (nonatomic, strong) NSMutableArray *bottomArray;
@property (nonatomic, copy) NSArray *imgArray;
@end
@implementation HXYMyInfoView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
#pragma mark - private
- (void)initUI
{
    [self addSubview:self.topView];
    [self.topView addSubview:self.downView];
    [self.topView addSubview:self.upView];
    [self.topView addSubview:self.avatarView];
    [self.upView addSubview:self.followBtn];
    [self.upView addSubview:self.fansBtn];
    [self.upView addSubview:self.skillBtn];
    [self addSubview:self.middleView];
    [self addSubview:self.bottomView];
    [self.topArray addObject:self.followBtn];
    [self.topArray addObject:self.fansBtn];
    [self.topArray addObject:_skillBtn];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.mas_equalTo(self);
        make.height.mas_equalTo(221);
    }];
    
    [self.middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(self.topView.mas_bottom).offset(2);
        make.height.mas_equalTo(100);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(self.middleView.mas_bottom);
        make.height.mas_equalTo(102);
    }];
    
    [self.upView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.topView);
        make.top.mas_equalTo(self.topView.mas_top).offset(127);
        make.height.mas_equalTo(100);
    }];
    [self.downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.topView);
    }];
    
    [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(27);
        make.height.mas_equalTo(44);
        make.center.mas_equalTo(self.upView.center);
    }];
    
    [self.fansBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.followBtn.mas_top);
    }];
    
    [self.skillBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.followBtn.mas_top);
    }];
    [self confMiddleView];
    [self confBottomView];
    
}

- (void)confMiddleView
{
    NSMutableArray *array = [NSMutableArray array];
    //TODO: 图片名字可能会改
    NSArray *middleTitles = @[@"余额",@"许愿星",@"优惠券"];
    NSArray *middleImages = @[@"现金_icon",@"许愿星_icon",@"优惠券icon"];
    for (int i = 0; i<3; i++) {
        HXYCustomButton *button = [[HXYCustomButton alloc]initWithType:HXYCustomButtonDirectionTypeVertical imageSize:CGSizeMake(btnW, btnW) space:@8];
        [button setImageStr:middleImages[i] forState:UIControlStateNormal];
        [button setText:middleTitles[i] forState:UIControlStateNormal];
        button.tag = i;
        [self.middleView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.middleView.mas_centerY);
        }];
        [array addObject:button];
        
    }
    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:btnW leadSpacing:41 tailSpacing:41];
    
    NSMutableArray *lineArray = [NSMutableArray array];
    CGFloat space = (ScreenWidth - 1)/3;
    for (int i=0; i<2; i++) {
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = UIColorFromRGB(SepratorColor);
        [self.middleView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self.middleView.mas_height).multipliedBy(0.5);
            make.centerY.mas_equalTo(self.middleView.mas_centerY);
        }];
        [lineArray addObject:line];
    }
    [lineArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:0.5 leadSpacing:space tailSpacing:space];
}

- (void)confBottomView
{
    //TODO: 图片名字可能会改
    NSArray *bottomImages = @[];
    NSArray *bottomTitles = @[@"待付款",@"待接单",@"待收货",@"待评价"];
    CGFloat space = 24;
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<4; i++) {
        HXYCustomButton *button = [[HXYCustomButton alloc]initWithType:HXYCustomButtonDirectionTypeVertical imageSize:CGSizeMake(btnW, btnW) space:@8];
//        [button setImageStr:bottomImages[i] forState:UIControlStateNormal];
        [button setText:bottomTitles[i] forState:UIControlStateNormal];
        button.tag = i;
        [self.bottomView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.bottomView.mas_centerY);
        }];
        [array addObject:button];
        
    }
    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:btnW leadSpacing:space tailSpacing:space];
    NSMutableArray *lineArray = [NSMutableArray array];
    CGFloat lineSpace = (ScreenWidth - 1.5)/4;
    for (int i=0; i<3; i++) {
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = UIColorFromRGB(SepratorColor);
        [self.middleView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self.bottomView.mas_height).multipliedBy(0.5);
            make.centerY.mas_equalTo(self.bottomView.mas_centerY);
        }];
        [lineArray addObject:line];
    }
    [lineArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:0.5 leadSpacing:lineSpace tailSpacing:lineSpace];
}



- (void)updateConstraints
{
    CGFloat followW = self.followBtn.bottomW >27? self.followBtn.bottomW : 27;
    CGFloat fansW = self.fansBtn.bottomW >27? self.followBtn.bottomW : 27;
    CGFloat skillW = self.skillBtn.bottomW >27? self.followBtn.bottomW : 27;
    CGFloat space = ((ScreenWidth - followW)/2 - (fansW + skillW))/3;
    [self.followBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(followW);
    }];
    
    [self.fansBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.followBtn.mas_right).offset(space);
        make.width.mas_equalTo(fansW);
    }];
    
    [self.skillBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.fansBtn.mas_right).offset(space);
        make.width.mas_equalTo(skillW);
    }];
    [super updateConstraints];
}

#pragma mark - public
- (void)setModel
{
    self.followBtn.number = @"1000";
    
    self.fansBtn.number =  @"10K";
//    self.fansBtn.text = @"粉丝";
    self.skillBtn.number = @"10";
//    self.skillBtn.text = @"技能";
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

#pragma mark - delegate


#pragma mark - getter&setter
- (UIView *)topView
{
    if (!_topView) {
        _topView = [[UIView alloc]init];
    }
    return _topView;
}
- (UIView *)middleView
{
    if (!_middleView) {
        _middleView = [[UIView alloc]init];
        UIImageView *imgv = [[UIImageView alloc]init];
        imgv.image = [UIImage imageNamed:@"my_info_middleCurve"];
        [_middleView addSubview:imgv];
        [imgv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(_middleView);
        }];
    }
    return _middleView;
}
- (UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];

    }
    return _bottomView;
}

- (UIView *)upView
{
    if (!_upView) {
        _upView = [[UIView alloc]init];
        UIImageView *imgv = [[UIImageView alloc]init];
        imgv.image = [UIImage imageNamed:@"my_info_curve"];
        [_upView addSubview:imgv];
        [imgv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(_upView);
        }];
    }
    return _upView;
}

- (UIView *)downView
{
    if (!_downView) {
        _downView = [[UIView alloc]init];
        UIImageView *imgv = [[UIImageView alloc]init];
//        imgv.image = [UIImage imageNamed:@"my_info_curve"];
        //TODO: 这里应该有个全局变量设置图片
        [_downView addSubview:imgv];
    }
    return _downView;
}

- (UIView *)avatarView
{
    if (!_avatarView) {
        _avatarView = [[UIView alloc]init];
    }
    return _avatarView;
}

- (HXYHorizontalTextButton *)followBtn
{
    if (!_followBtn) {
        _followBtn = [[HXYHorizontalTextButton alloc]initWithSpace:@4];
        _followBtn.text = @"关注";
    }
    return _followBtn;
}

- (HXYHorizontalTextButton *)fansBtn
{
    if (!_fansBtn) {
        _fansBtn = [[HXYHorizontalTextButton alloc]initWithSpace:@4];
        _fansBtn.text = @"粉丝";
    }
    return _fansBtn;
}

- (HXYHorizontalTextButton *)skillBtn
{
    if (!_skillBtn) {
        _skillBtn = [[HXYHorizontalTextButton alloc]initWithSpace:@4];
        _skillBtn.text = @"技能";
    }
    return _skillBtn;
}

- (NSMutableArray *)topArray
{
    if (!_topArray) {
        _topArray = [NSMutableArray array];
    }
    return _topArray;
}
- (NSMutableArray *)middleArray
{
    if (!_middleArray) {
        _middleArray = [NSMutableArray array];
    }
    return _middleArray;
}
- (NSMutableArray *)bottomArray
{
    if (!_bottomArray) {
        _bottomArray = [NSMutableArray array];
    }
    return _bottomArray;
}


@end
