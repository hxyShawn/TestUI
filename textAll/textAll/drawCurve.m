//
//  drawCurve.m
//  textAll
//
//  Created by 贺东方 on 17/6/1.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//
//#define HXYLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#import "drawCurve.h"

@implementation drawCurve


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawWithImage
{
    UIImage *image = [UIImage imageNamed:@"my_info_bottom"];
    self.layer.contents = (id)image.CGImage;
}

- (void)drawBezierPathWithRect:(CGRect)rect
{
    CGFloat layerH = rect.size.height;
    CGFloat layerW = rect.size.width;
    CGFloat startY = 0;
    CGFloat bottomY = layerH + startY;
    CGPoint startPoint = CGPointMake(layerW, startY);
    
    CGPoint secPoint = CGPointMake(layerW, bottomY);
    CGPoint bottomControlPoint = CGPointMake(layerW/2, startY + layerH + 40);
    CGPoint thirdPoint = CGPointMake(0, bottomY);
    CGPoint forthPoint = CGPointMake(0, startY);
    CGPoint ctrlPoint1 = CGPointMake(layerW*2/5, startY - 80);
    CGPoint ctrlPoint2 = CGPointMake(layerW * 4/5, startY + 100);
    UIBezierPath *path = [UIBezierPath bezierPath];
    //把path移动到指定的点,第一次使用的话就是path的起点了
    [path moveToPoint:startPoint];
    [path addLineToPoint:secPoint];
    [path addQuadCurveToPoint:thirdPoint controlPoint:bottomControlPoint];
    [path addLineToPoint:forthPoint];
    [path addCurveToPoint:forthPoint controlPoint1:ctrlPoint1 controlPoint2:ctrlPoint2];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.lineWidth = 1.0;
    layer.fillColor = [UIColor greenColor].CGColor;
    //    layer.strokeColor = [UIColor colorWithRed:218 green:218 blue:218 alpha:1.0].CGColor;
    //    layer.strokeColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:layer];
}

- (void)drawWithBezierPath
{
    HXYLog();
    //1. 简单的使用layer
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.frame = self.bounds;
//    layer.backgroundColor = [UIColor blueColor].CGColor;
//    [self.layer addSublayer:layer];
    
    //2. CAShapeLayer配合BezierPaht使用
    //fillCorlor: layer的填充色
    //strokeCorlor: 边框的填充色
    //2.1 矩形
    CGRect rect = CGRectMake(50, 50, 100, 100);
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    //2.2 圆形  如果宽高相等就是圆,不同就是椭圆
    //这个方法应该是用来给圆角的,画圆应该用 bezierPathWithArcCenter
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:50];
    /*
     @arcCenter: 圆心
     @radius: 半径
     @startAngle: 起点: 弧度制 起点应该是0.0
     @endAngle: 终点: 弧度制 一个圆的终点应该是M_PI*2
     @clockwise: 开始画圆的方向 YES:顺时针 NO:逆时针
     */
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.center radius:100 startAngle:M_PI endAngle:M_PI*2 clockwise:NO];
    //3. 画曲线
    CGFloat layerH = 100;
    CGFloat startY = 0;
    CGFloat bottomY = layerH + startY;
    CGPoint startPoint = CGPointMake(self.frame.size.width, startY);
    
    CGPoint secPoint = CGPointMake(self.frame.size.width, bottomY);
    CGPoint bottomControlPoint = CGPointMake(self.frame.size.width/2, startY + layerH + 40);
    CGPoint thirdPoint = CGPointMake(0, bottomY);
    CGPoint forthPoint = CGPointMake(0, startY);
    
//    CGPoint endPoint = CGPointMake(300, 300);
//    CGPoint controlPoint = CGPointMake(170, 200);
//    CGPoint controlPoint2 = CGPointMake(170, 200);
    //    [path addLineToPoint:startPoint];
    //一个控制点
    //    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    //两个控制点
    //    [path addCurveToPoint:endPoint controlPoint1:controlPoint controlPoint2:controlPoint2];
    //三个控制点
    
    //
    UIBezierPath *path = [UIBezierPath bezierPath];
    //把path移动到指定的点,第一次使用的话就是path的起点了
    [path moveToPoint:startPoint];
    [path addLineToPoint:secPoint];
    [path addQuadCurveToPoint:thirdPoint controlPoint:bottomControlPoint];
    [path addLineToPoint:forthPoint];
    CGFloat A = 20;
    
    CGFloat K = 100;
    
    CGFloat u = 120;
    
    CGFloat w = M_PI/120;
    
    CGMutablePathRef path1 = CGPathCreateMutable();
    CGPathMoveToPoint(path1, nil, 0, 0);
    
    CGFloat y = 0.0f;
    
    for (float x = 0.f; x <= self.frame.size.width; x++) {
        y = A * sin(w*x + u) + K;
        CGPathAddLineToPoint(path1, nil, x, y);
        x++;
    }
    [path appendPath:[UIBezierPath bezierPathWithCGPath:path1]];

    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.lineWidth = 1.0;
        layer.fillColor = [UIColor greenColor].CGColor;
//    layer.strokeColor = [UIColor colorWithRed:218 green:218 blue:218 alpha:1.0].CGColor;
    layer.strokeColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:layer];
    
}

- (void)drawCurve
{
    
    /*
     y=Asin(wx+u)+K 对就是这么简单，那参数代表的又是什么呢?
     
     A ：振幅
     w ：角速度 w = 2PI/T T:周期
     u ：初相
     K ：y 轴偏移
     */
    
        
    CGFloat A = 20;
        
    CGFloat K = 100;
        
    CGFloat u = 120;
        
    CGFloat w = M_PI/120;
        
    CAShapeLayer *waveLayer = [[CAShapeLayer alloc]init];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, 0);
    
    CGFloat y = 0.0f;
    
    for (float x = 0.f; x <= self.frame.size.width; x++) {
        y = A * sin(w*x + u) + K;
        CGPathAddLineToPoint(path, nil, x, y);
        x++;
    }
    
    CGPathAddLineToPoint(path, nil, self.frame.size.width, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    waveLayer.path = path;
    CGPathRelease(path);
    [self.layer addSublayer:waveLayer];
}

- (void)drawRect:(CGRect)rect
{
    //ddd
//    [self drawBezierPathWithRect:rect];//失败了,计算不出来controlPoint,数学!!!
    
}
@end
