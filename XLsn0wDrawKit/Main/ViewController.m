//
//  ViewController.h
//  XLsn0wDrawKit
//
//  Created by ginlong on 2018/4/19.
//  Copyright © 2018年 ginlong. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
#import "DialView.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import "XLsn0wDrawKit.h"

@interface ViewController ()

@property (nonatomic, assign)  CGFloat strokeEnd;
@property (nonatomic, strong)  CAShapeLayer *mylayer;
@property (nonatomic, strong)  CADisplayLink *displayLink;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view.layer addSublayer:[XLsn0wAnimationLayer replicatorLayer_Heart]];
}

- (void)loveReplicatorLayer {
    // love路径
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(20, 200)];
    [bezierPath addLineToPoint:CGPointMake(300, 200)];
    //    [bezierPath addQuadCurveToPoint:CGPointMake(SYS_DEVICE_WIDTH/2.0, 400) controlPoint:CGPointMake(SYS_DEVICE_WIDTH/2.0 + 200, 20)];
    //    [bezierPath addQuadCurveToPoint:CGPointMake(SYS_DEVICE_WIDTH/2.0, 200) controlPoint:CGPointMake(SYS_DEVICE_WIDTH/2.0 - 200, 20)];
    [bezierPath closePath];
    
    // 具体的layer
    UIView *dotView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    //    dotView.center = CGPointMake(SYS_DEVICE_WIDTH/2.0, 200);
    dotView.layer.cornerRadius = dotView.frame.size.width/2;
    dotView.backgroundColor = [UIColor greenColor];
    
    // 动作效果
    CAKeyframeAnimation *loveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    loveAnimation.path = bezierPath.CGPath;
    loveAnimation.duration = 8;
    loveAnimation.repeatCount = MAXFLOAT;
    loveAnimation.removedOnCompletion = NO;
    loveAnimation.fillMode = kCAFillModeForwards;
    [dotView.layer addAnimation:loveAnimation forKey:nil];
    
    
    CAReplicatorLayer *loveLayer = [CAReplicatorLayer layer];
    loveLayer.instanceCount = 10;                // 40个layer
    loveLayer.instanceDelay = 0.2;               // 每隔0.2出现一个layer
    loveLayer.instanceColor = [UIColor greenColor].CGColor;
    loveLayer.instanceGreenOffset = -0.03;       // 颜色值递减。
    loveLayer.instanceRedOffset = -0.02;         // 颜色值递减。
    loveLayer.instanceBlueOffset = -0.01;        // 颜色值递减。
    [loveLayer addSublayer:dotView.layer];
    [self.view.layer addSublayer:loveLayer];
}


- (void)drawDrawView {
    DrawView *draw = [DrawView new];
    [self.view addSubview:draw];
    draw.badgeValue = @"99";
    draw.backgroundColor = [UIColor lightGrayColor];
    [draw setFrame:(CGRectMake(0, 0, kScreenWidth, 300))];
}

- (void)drawDialView {
    DialView *dial = [[DialView alloc] initWithFrame:CGRectMake(100, 400, 200, 200)
                                           tintColor:[UIColor orangeColor]
                                       selectedColor:[UIColor blackColor]
                                           dialValue:0.2
                                            animated:YES];
    [self.view addSubview:dial];
    dial.backgroundColor = [UIColor lightGrayColor];
    [dial setDialValue:0.8];
}

- (void)drawArrowLayer {///绘制带箭头的提示框
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 100, 200, 100)
                                                     byRoundingCorners:UIRectCornerAllCorners
                                                           cornerRadii:CGSizeMake(10, 10)];
    
    [bezierPath moveToPoint:CGPointMake(100, 60)];
    [bezierPath addLineToPoint:CGPointMake(80, 100)];
    [bezierPath addLineToPoint:CGPointMake(120, 100)];
    
    CAShapeLayer *shaperLayer = [CAShapeLayer layer];
    [self.view.layer addSublayer:shaperLayer];
    shaperLayer.fillColor = [UIColor orangeColor].CGColor;
    shaperLayer.path = bezierPath.CGPath;
}

- (void)drawLayer {
//    CAShapeLayer *circle = [CAShapeLayer layer];
//    circle.bounds        = CGRectMake(0, 0, 100, 100);  //设置大小
//    circle.position      = self.view.center;            //设置中心位置
//    circle.path          = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)].CGPath; //设置绘制路径
//    circle.strokeColor   = [UIColor redColor].CGColor;      //设置划线颜色
//    circle.fillColor     = [UIColor yellowColor].CGColor;   //设置填充颜色
//    circle.lineWidth     = 10;          //设置线宽
//    circle.lineCap       = @"round";    //设置线头形状
//    circle.strokeEnd     = 0.75;        //设置轮廓结束位置
//    [self.view.layer addSublayer:circle];
    

    //创建矩形圆角正方形路径
    UIBezierPath * rectP   = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:5];
    
    //创建圆路径
    UIBezierPath * circleP = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 80, 80)];
    
    //内部弧路径
    UIBezierPath * interP  = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50)
                                                            radius:35
                                                        startAngle:1.5 * M_PI
                                                          endAngle:1.7 * M_PI
                                                         clockwise:NO];
    [interP addLineToPoint:CGPointMake(50, 50)];
    [interP closePath];
    
    /// 合体
    [rectP appendPath:circleP];
    [rectP appendPath:interP];
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.bounds         = CGRectMake(0, 0, 100, 100);
    layer.position       = self.view.center;
    layer.path           = rectP.CGPath;
    layer.fillColor      = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    layer.fillRule       = kCAFillRuleEvenOdd;  //重点， 填充规则
    [self.view.layer addSublayer:layer];
}

- (void)drawProgressBar {
    //创建圆路径
    UIBezierPath * circleP = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 80, 80)];
    
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.bounds         = CGRectMake(0, 0, 200, 200);
    layer.position       = self.view.center;
    layer.path           = circleP.CGPath;
    layer.strokeColor    = [[UIColor redColor] colorWithAlphaComponent:0.5].CGColor;
    layer.lineWidth      = 1;
    layer.strokeStart    = 0;
    layer.strokeEnd      = 0;
    layer.fillColor      = [UIColor clearColor].CGColor;
    layer.fillRule       = kCAFillRuleEvenOdd;
    self.mylayer = layer;
    [self.view.layer addSublayer:self.mylayer];
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(changeEnd)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
}

- (void)changeEnd {
    self.strokeEnd = self.strokeEnd + 0.001;
    self.mylayer.strokeEnd = self.strokeEnd;
    self.mylayer.lineWidth = 6;
    if (self.strokeEnd == 1) {
        [self.displayLink invalidate];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
