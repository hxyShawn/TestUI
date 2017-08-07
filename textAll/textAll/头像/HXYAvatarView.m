//
//  HXYAvatarView.m
//  manmanda
//
//  Created by liangqi on 17/3/20.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYAvatarView.h"
#import <UIImageView+WebCache.h>
#import "UIImage+YYAdd.h"
#import "UIView+YYAdd.h"
#import "UIImageView+CornerRadius.h"
#import <Masonry.h>
@interface HXYAvatarView()
@property (nonatomic,strong)UIImageView     *avatarImgv;
@property (nonatomic,strong)UIImageView     *vImgv;
@property (nonatomic,strong)UIImage         *image;
@property (nonatomic,assign)NSInteger        isV;
@end

@implementation HXYAvatarView
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
    [self addSubview:self.avatarImgv];
    [self addSubview:self.vImgv];

    if (self.isV) {
        self.vImgv.image = [UIImage imageNamed:@"ic_V_highlight"];
    }
    [self.avatarImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.vImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.avatarImgv.mas_right);
        make.bottom.equalTo(self.avatarImgv.mas_bottom);
    }];
    
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:ges];
}

- (void)tap:(UITapGestureRecognizer *)ges
{
    if([_delegate respondsToSelector:@selector(HXYAvatarView:didSelectAvatarView:)]) {
        [_delegate HXYAvatarView:self didSelectAvatarView:self.userId];
    }
}
- (void)setVSize:(CGSize)vSize
{
    _vSize = vSize;
    [self.vImgv mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(vSize);
    }];
}
- (void)setWithUrlStr:(NSString *)urlStr isV:(NSInteger )isV
{
    [self.avatarImgv sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:Deafult_Avatar] options:SDWebImageAllowInvalidSSLCertificates];
    if (isV) {
        self.vImgv.image = [UIImage imageNamed:@"ic_V_highlight"];
    }else{
        self.vImgv.image = [UIImage imageNamed:@"ic_not_v"];
    }
}

- (UIImageView *)avatarImgv
{
    if (!_avatarImgv) {
        _avatarImgv = [[UIImageView alloc]initWithRoundingRectImageView];
    }
    return _avatarImgv;
}

- (UIImageView *)vImgv
{
    if (!_vImgv) {
        _vImgv = [[UIImageView alloc]initWithRoundingRectImageView];
    }
    return _vImgv;
}
@end
