//
//  DrawView.m
//  DrawLayer
//
//  Created by ginlong on 2018/4/19.
//  Copyright © 2018年 ginlong. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


/**
 // 创建基本路径
 + (instancetype)bezierPath;
 // 创建矩形路径
 + (instancetype)bezierPathWithRect:(CGRect)rect;
 // 创建椭圆路径
 + (instancetype)bezierPathWithOvalInRect:(CGRect)rect;
 // 创建圆角矩形
 + (instancetype)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius; // rounds all corners with the same horizontal and vertical radius
 // 创建指定位置圆角的矩形路径
 + (instancetype)bezierPathWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;
 // 创建弧线路径
 + (instancetype)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
 // 通过CGPath创建
 + (instancetype)bezierPathWithCGPath:(CGPathRef)CGPath;
 
 // 与之对应的CGPath
 @property(nonatomic) CGPathRef CGPath;
 - (CGPathRef)CGPath NS_RETURNS_INNER_POINTER CF_RETURNS_NOT_RETAINED;
 // 是否为空
 @property(readonly,getter=isEmpty) BOOL empty;
 // 整个路径相对于原点的位置及宽高
 @property(nonatomic,readonly) CGRect bounds;
 // 当前画笔位置
 @property(nonatomic,readonly) CGPoint currentPoint;
 // 线宽
 @property(nonatomic) CGFloat lineWidth;
 
 // 终点类型
 @property(nonatomic) CGLineCap lineCapStyle;
 typedef CF_ENUM(int32_t, CGLineCap) {
 kCGLineCapButt,
 kCGLineCapRound,
 kCGLineCapSquare
 };
 
 // 交叉点的类型
 @property(nonatomic) CGLineJoin lineJoinStyle;
 typedef CF_ENUM(int32_t, CGLineJoin) {
 kCGLineJoinMiter,
 kCGLineJoinRound,
 kCGLineJoinBevel
 };
 
 // 两条线交汇处内角和外角之间的最大距离,需要交叉点类型为kCGLineJoinMiter是生效，最大限制为10
 @property(nonatomic) CGFloat miterLimit;
 // 个人理解为绘线的精细程度，默认为0.6，数值越大，需要处理的时间越长
 @property(nonatomic) CGFloat flatness;
 // 决定使用even-odd或者non-zero规则
 @property(nonatomic) BOOL usesEvenOddFillRule;
 
 // 反方向绘制path
 - (UIBezierPath *)bezierPathByReversingPath;
 // 设置画笔起始点
 - (void)moveToPoint:(CGPoint)point;
 // 从当前点到指定点绘制直线
 - (void)addLineToPoint:(CGPoint)point;
 // 添加弧线
 - (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise NS_AVAILABLE_IOS(4_0);
 center弧线圆心坐标 radius弧线半径 startAngle弧线起始角度 endAngle弧线结束角度 clockwise是否顺时针绘制


 // 添加贝塞尔曲线
 - (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint;
  endPoint终点 controlPoint控制点
- (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2;
 endPoint终点 controlPoint1、controlPoint2控制点
// 移除所有的点，删除所有的subPath
- (void)removeAllPoints;
// 将bezierPath添加到当前path
- (void)appendPath:(UIBezierPath *)bezierPath;
// 填充
- (void)fill;
// 路径绘制
- (void)stroke;

 // 在这以后的图形绘制超出当前路径范围则不可见
 - (void)addClip;

*/
- (void)drawRect:(CGRect)rect {
    // Drawing code
    /// path color
    [UIColor.redColor set];
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(30, 130, 100, 100)];
//    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 220, 100, 80)];
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 100, 100)
//                                                    cornerRadius:100/2];///圆角矩形
    
    ///指定位置圆角矩形
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 100, 100)
                                               byRoundingCorners:UIRectCornerTopRight///有一个角是圆角 的矩形
                                                     cornerRadii:CGSizeMake(60, 60)];///corners：圆角位置 cornerRadii：圆角大小
    
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;


    /// Curve 曲线
    [path moveToPoint:CGPointMake(200.0, 50.0)];
//    [path addCurveToPoint:CGPointMake(260, 200)
//            controlPoint1:CGPointMake(140, 0)
//            controlPoint2:CGPointMake(140, 400)];
    
//    [path addQuadCurveToPoint:CGPointMake(60, 110)
//                 controlPoint:CGPointMake(100, 200)];
    
    
    
    // Draw the lines
//    [path addLineToPoint:CGPointMake(300.0, 100.0)];
//    [path addLineToPoint:CGPointMake(260, 200)];
//    [path addLineToPoint:CGPointMake(100.0, 200)];
//    [path addLineToPoint:CGPointMake(100, 70.0)];
//    [path closePath];//第五条线通过调用closePath方法得到的
    
    

    [path closePath]; // 封闭未形成闭环的路径
    [path stroke];///路径绘制
//    [path fill];///填充颜色
}

- (void)config2 {
    /*
     1、kCGLineCapButt
     A line with a squared-off end. Quartz draws the line to extend only to the exact endpoint of the path. This is the default.
     该属性值指定不绘制端点， 线条结尾处直接结束。这是默认值。
     2、kCGLineCapRound
     A line with a rounded end. Quartz draws the line to extend beyond the endpoint of the path. The line ends with a semicircular arc with a radius of 1/2 the line’s width, centered on the endpoint.
     该属性值指定绘制圆形端点， 线条结尾处绘制一个直径为线条宽度的半圆
     3、kCGLineCapSquare
     A line with a squared-off end. Quartz extends the line beyond the endpoint of the path for a distance equal to half the line widt
     该属性值指定绘制方形端点。
     线条结尾处绘制半个边长为线条宽度的正方形。需要
     说明的是，这种形状的端点与“butt”形状的端点十分相似，
     只是采用这种形式的端点的线条略长一点而已
     
     */
    /*设置两条线连结点的样式(
     kCGLineJoinMiter, 斜接
     kCGLineJoinRound, 圆滑衔接
     kCGLineJoinBevel  斜角连接)
     */
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:(CGPointMake(100, 100))
                                                        radius:50
                                                    startAngle:0
                                                      endAngle:M_PI
                                                     clockwise:NO];
    
    
    [[UIColor redColor] set];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    [path stroke];
    
    path.lineWidth = 5;
}

- (void)config {
    UIBezierPath* path = [UIBezierPath bezierPath];
    path.lineWidth = 5.0;
    
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineJoinRound; //终点处理
    
    [path moveToPoint:CGPointMake(200.0, 50.0)];//起点
    
    // Draw the lines
    [path addLineToPoint:CGPointMake(30.0, 30.0)];
    [path addLineToPoint:CGPointMake(60, 50)];
    [path addLineToPoint:CGPointMake(50.0, 60)];
    [path addLineToPoint:CGPointMake(30, 70.0)];
    [path closePath];//第五条线通过调用closePath方法得到的
    
    [path stroke];//Draws line 根据坐标点连线
    
    [[UIColor blueColor] set]; //设置线条颜色
    //    [path fill];//颜色填充
    
}


@end
