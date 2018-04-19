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

@interface ViewController ()

@property (nonatomic, assign)  CGFloat  end;
@property (nonatomic, strong)  CAShapeLayer *mylayer;
@property (nonatomic, strong)  CADisplayLink *displayLink;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self drawLayer];
    [self drawProgressBar];
    
    ///绘制带箭头的提示框
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 100, self.view.frame.size.width-20, 100)
                                                     byRoundingCorners:UIRectCornerAllCorners
                                                           cornerRadii:CGSizeMake(10, 10)];
    
    [bezierPath moveToPoint:CGPointMake(100, 60)];
    [bezierPath addLineToPoint:CGPointMake(80, 100)];
    [bezierPath addLineToPoint:CGPointMake(120, 100)];
    
    CAShapeLayer *shaperLayer = [CAShapeLayer new];
    shaperLayer.fillColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:shaperLayer];
    
    shaperLayer.path = bezierPath.CGPath;
    
    
    DialView *dial = [[DialView alloc] initWithFrame:CGRectMake(100, 400, 200, 200)
                                           tintColor:[UIColor redColor]
                                       selectedColor:[UIColor blueColor]
                                           dialValue:0.2
                                            animated:YES];
    [self.view addSubview:dial];
    dial.backgroundColor = [UIColor lightGrayColor];
    [dial setProgressValue:0.8];
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
    
    self.mylayer = ({
        
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
        
        layer;
    });
    
    [self.view.layer addSublayer:self.mylayer];
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(changeEnd)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
}

- (void)changeEnd {
    self.end = self.end + 0.01;
    self.mylayer.strokeEnd = self.end;
    if (self.end == 1) {
        [self.displayLink invalidate];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
