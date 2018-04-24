//
//  ViewController.h
//  XLsn0wDrawKit
//
//  Created by ginlong on 2018/4/19.
//  Copyright © 2018年 ginlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end

/*
 1.CAShapeLayer
 CAShapeLayer具有path属性，（是CGPath对象），可以使用这个属性与UIBezierPath画出想要的图形。该子类根据其fill color和strokeColor值对该路径填充或者描边，或二者都有，并显示结果。fillColor默认值是黑色，二strokenColor没有默认值。CAShapeLayer也可能有contents，该形状显示在内容图像的上方，但没有任何属性允许你指定合成模式（compositioning  mode）。
 
 普通CALayer在被初始化时是需要给一个frame值的,这个frame值一般都与给定view的bounds值一致,它本身是有形状的,而且是矩形.
 
 CAShapeLayer在初始化时也需要给一个frame值,但是,它本身没有形状,它的形状来源于你给定的一个path,然后它去取CGPath值,它与CALayer有着很大的区别
 
 CAShapeLayer有着几点很重要:
 
 1. 它依附于一个给定的path,必须给与path,而且,即使path不完整也会自动首尾相接
 
 2. strokeStart以及strokeEnd代表着在这个path中所占用的百分比
 
 3. CAShapeLayer动画仅仅限于沿着边缘的动画效果,它实现不了填充效果
 
 
 2.UIBezierPath
 UIBezierPath贝塞尔弧线常用方法记
 //根据一个矩形画曲线
 + (UIBezierPath *)bezierPathWithRect:(CGRect)rect
 
 //根据矩形框的内切圆画曲线
 + (UIBezierPath *)bezierPathWithOvalInRect:(CGRect)rect
 
 //根据矩形画带圆角的曲线
 + (UIBezierPath *)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius
 
 //在矩形中，可以针对四角中的某个角加圆角
 + (UIBezierPath *)bezierPathWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii
 
 参数：
 corners:枚举值，可以选择某个角
 cornerRadii:圆角的大小
 //以某个中心点画弧线  + (UIBezierPath *)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
 参数：
 center:弧线中心点的坐标
 radius:弧线所在圆的半径
 startAngle:弧线开始的角度值
 endAngle:弧线结束的角度值
 clockwise:是否顺时针画弧线
 
 
 //画二元曲线，一般和moveToPoint配合使用
 - (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint
 参数：
 endPoint:曲线的终点
 controlPoint:画曲线的基准点
 
 //以三个点画一段曲线，一般和moveToPoint配合使用
 - (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2
 参数：
 endPoint:曲线的终点
 controlPoint1:画曲线的第一个基准点
 controlPoint2:画曲线的第二个基准点
 */
