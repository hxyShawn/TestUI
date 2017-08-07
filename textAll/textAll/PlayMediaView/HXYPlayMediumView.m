//
//  HXYPlayMediumView.m
//  manmanda
//
//  Created by liangqi on 17/7/13.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import "HXYPlayMediumView.h"
#import "RotatingView.h"
#import "ZFPlayerView.h"
#import "ZFPlayerControlView.h"
#import "Masonry.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface HXYPlayMediumView()<ZFPlayerDelegate,ZFPlayerControlViewDelagate>
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *playBtn;
@property (nonatomic, strong) RotatingView *rotatingView;
@property (nonatomic, strong) ZFPlayerView *playerView;
@property (nonatomic, assign) HXYPlayMediumViewType  mediumType;
@property (nonatomic, assign) BOOL  playing;
@end
@implementation HXYPlayMediumView

- (instancetype)initWithType:(HXYPlayMediumViewType)type
{
    self = [super init];
    if (self) {
        self.mediumType = type;
        [self confUI];
        
    }
    return self;
}

- (void)confUI
{
    [self addSubview:self.imageView];
    if (self.mediumType == HXYPlayMediumViewTypeAudio) {
        [self.imageView addSubview:self.rotatingView];
        [self.rotatingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.imageView.mas_centerX);
            make.centerY.equalTo(self.imageView.mas_centerY);
            make.width.equalTo(self.imageView.mas_width).multipliedBy(0.5);
            make.height.equalTo(self.imageView.mas_height).multipliedBy(0.5);
        }];
    }
    [self addSubview:self.playBtn];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.imageView.mas_centerX);
        make.centerY.equalTo(self.imageView.mas_centerY);
        make.width.equalTo(self.imageView.mas_width).multipliedBy(0.33);
        make.height.equalTo(self.imageView.mas_height).multipliedBy(0.33);
    }];
}
#pragma mark - btnAction
- (void)playBtnClick:(UIButton *)btn
{
    
    WEAKSELF;    
    switch (self.playWay) {
        case HXYPlayMediaWayInView:
        {
            btn.hidden = YES;
            if (self.mediumType == HXYPlayMediumViewTypeVideo) {
                
                self.playerView = [[ZFPlayerView alloc] init];
                self.playerView.delegate = self;
                
                [weakSelf.imageView addSubview:self.playerView];
                
                [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(weakSelf.imageView);
                    make.bottom.left.right.equalTo(weakSelf.imageView);
                    // Here a 16:9 aspect ratio, can customize the video aspect ratio
                    make.height.equalTo(self.playerView.mas_width).multipliedBy(9.0f/16.0f);
                }];
                
                // control view（you can custom）
                ZFPlayerControlView *controlView = [[ZFPlayerControlView alloc] init];
                controlView.hidePlaceHolder = YES;
                // model
                ZFPlayerModel *playerModel = [[ZFPlayerModel alloc]init];
                playerModel.fatherView = weakSelf.imageView;
                playerModel.videoURL = [NSURL URLWithString:weakSelf.mediumUrl];
                playerModel.placeholderImageURLString = weakSelf.imageUrl;
                self.playerView.playerLayerGravity = ZFPlayerLayerGravityResizeAspectFill;
                [self.playerView playerControlView:controlView playerModel:playerModel];
                [self.playerView autoPlayTheVideo];
                
                self.playerView.zf_closeBlcok = ^(){
                    [weakSelf.playerView resetPlayer];
                    [weakSelf.playerView removeFromSuperview];
                    weakSelf.playerView = nil;
                    weakSelf.playBtn.hidden = NO;
                };
                
                
            }else{
                
                self.rotatingView.hidden = NO;
                [self.rotatingView setRotatingViewLayoutWithFrame:self.rotatingView.frame];
                [self.rotatingView bringSubviewToFront:self.imageView];
                
                [self.rotatingView resumeLayer];
                self.playerView = [[ZFPlayerView alloc] init];
                self.playerView.delegate = self;
                [weakSelf.imageView addSubview:self.playerView];
                
                [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(weakSelf.imageView);
                    make.bottom.left.right.equalTo(weakSelf.imageView);
                    // Here a 16:9 aspect ratio, can customize the video aspect ratio
                    make.height.equalTo(self.playerView.mas_width).multipliedBy(9.0f/16.0f);
                }];
                
                
                ZFPlayerControlView *controlView = [[ZFPlayerControlView alloc] init];
                controlView.hidePlaceHolder = NO;
                
                ZFPlayerModel *playerModel = [[ZFPlayerModel alloc]init];
                playerModel.fatherView = weakSelf.imageView;
                playerModel.videoURL = [NSURL URLWithString:self.mediumUrl];
                playerModel.placeholderImageURLString = self.imageUrl;
                self.playerView.playerLayerGravity = ZFPlayerLayerGravityResizeAspectFill;
                [self.playerView playerControlView:controlView playerModel:playerModel];
                [self.playerView autoPlayTheVideo];
                
                [weakSelf.imageView bringSubviewToFront:weakSelf.rotatingView];
                
                self.playerView.zf_closeBlcok = ^(){
                    [weakSelf.playerView resetPlayer];
                    [weakSelf.playerView removeFromSuperview];
                    weakSelf.playerView = nil;
                };
                self.playerView.zf_playBlock = ^(BOOL isPauseByUser ){
                    if (isPauseByUser) {
                        [weakSelf.rotatingView pauseLayer];
                        
                    }else{
                        [weakSelf.imageView bringSubviewToFront:weakSelf.rotatingView];
                        [weakSelf.rotatingView resumeLayer];
                    }
                };
                self.playerView.zf_repeatPlayBlock = ^(){
                    weakSelf.rotatingView.hidden = NO;
                    [weakSelf.rotatingView resumeLayer];
                };
                self.playerView.zf_moviePlayDidEnd = ^(){
                    [weakSelf.rotatingView pauseLayer];
                    weakSelf.rotatingView.hidden = YES;
                };
                
            }
        }
            break;
        case HXYPlayMediaWayInCell:
            
            break;
        case HXYPlayMediaWayInController:
        {
            btn.hidden = NO;
            if ([_delegate respondsToSelector:@selector(HXYPlayMediumView:play:mediaUrl:imageUrl:)]) {
                [_delegate HXYPlayMediumView:self play:self.mediumType mediaUrl:self.mediumUrl imageUrl:self.imageUrl];
            }
        }
            break;
        default:
            break;
    }
    

    
}
#pragma mark - getter&setter
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.userInteractionEnabled = YES;
    }
    return _imageView;
}

- (UIButton *)playBtn
{
    if (!_playBtn) {
        NSString *imageName = self.mediumType? @"blackAudioPlay":@"blackVideoPlay";
        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playBtn addTarget:self action:@selector(playBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_playBtn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    return _playBtn;
}

- (RotatingView *)rotatingView
{
    if (!_rotatingView) {
        _rotatingView = [[RotatingView alloc]init];
        _rotatingView.hidden = YES;
        [_rotatingView addAnimation];
        _rotatingView.userInteractionEnabled = YES;
    }
    return _rotatingView;
}

- (void)setImageUrl:(NSString *)imageUrl
{
    _imageUrl = imageUrl;
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:img(Default_BackImage) options:SDWebImageAllowInvalidSSLCertificates];
    if (self.mediumType == HXYPlayMediumViewTypeAudio) {
//        [self.rotatingView.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:img(Default_BackImage) options:SDWebImageAllowInvalidSSLCertificates];
    }
}
@end
