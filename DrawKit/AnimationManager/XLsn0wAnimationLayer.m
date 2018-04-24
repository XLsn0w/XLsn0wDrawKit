//
//  XLsn0wAnimationLayer.m
//  XLsn0wDrawKit
//
//  Created by ginlong on 2018/4/24.
//  Copyright © 2018年 ginlong. All rights reserved.
//

#import "XLsn0wAnimationLayer.h"

@implementation XLsn0wAnimationLayer

+ (CALayer *)initWithType:(XLsn0wAnimationLayerType)type {
    CALayer *layer = nil;
    
    switch (type) {
        case XLsn0wAnimationLayer_Circle:
        {
            layer = [self drawCircle];
        }
            break;
        case XLsn0wAnimationLayer_Wave:
        {
            layer = [self drawWave];
        }
            break;
        case XLsn0wAnimationLayer_Triangle:
        {
            layer = [self drawTriangle];
        }
            break;
        case XLsn0wAnimationLayer_Grid:
        {
            layer = [self drawGrid];
        }
            break;
        case XLsn0wAnimationLayer_Shake:
        {
            layer = [self drawShake];
        }
            break;
        case XLsn0wAnimationLayer_Round:
        {
            layer = [self drawRound];
        }
            break;
        case XLsn0wAnimationLayer_Heart: {
            layer = [self drawHeart];
        }
            break;
            
        case XLsn0wAnimationLayer_Turn: {
            layer = [self drawTurn];
        }
            break;
            
        default: {
            layer = [self drawCircle];
        }
            break;
    }
    
    return layer;
}

#pragma mark -----------------------  复制层

// 圆圈动画 波纹
+ (CALayer *)drawCircle{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, 0, 80, 80);
    shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 80, 80)].CGPath;
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    shapeLayer.opacity = 0.0;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[[self alphaAnimation],[self scaleAnimation]];
    animationGroup.duration = 4.0;
    animationGroup.autoreverses = NO;
    animationGroup.repeatCount = HUGE;
    [shapeLayer addAnimation:animationGroup forKey:@"animationGroup"];
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(0, 0, 80, 80);
    replicatorLayer.instanceDelay = 0.5;
    replicatorLayer.instanceCount = 8;
    [replicatorLayer addSublayer:shapeLayer];
    return replicatorLayer;
}

// 波动动画
+ (CALayer *)drawWave {
    CGFloat between = 5.0;
    CGFloat radius = (100-2*between)/3;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, (100-radius)/2, radius, radius);
    shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, radius, radius)].CGPath;
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    [shapeLayer addAnimation:[self scaleAnimation1] forKey:@"scaleAnimation"];
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(0, 0, 100, 100);
    replicatorLayer.instanceDelay = 0.2;
    replicatorLayer.instanceCount = 3;
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(between*2+radius,0,0);
    [replicatorLayer addSublayer:shapeLayer];
    
    return replicatorLayer;
}

// 三角形动画
+ (CALayer *)drawTriangle {
    CGFloat radius = 100/4;
    CGFloat transX = 100 - radius;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, 0, radius, radius);
    shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, radius, radius)].CGPath;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    shapeLayer.lineWidth = 1;
    [shapeLayer addAnimation:[self rotationAnimation:transX] forKey:@"rotateAnimation"];
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(0, 0, radius, radius);
    replicatorLayer.instanceDelay = 0.0;
    replicatorLayer.instanceCount = 3;
    CATransform3D trans3D = CATransform3DIdentity;
    trans3D = CATransform3DTranslate(trans3D, transX, 0, 0);
    trans3D = CATransform3DRotate(trans3D, 120.0*M_PI/180.0, 0.0, 0.0, 1.0);
    replicatorLayer.instanceTransform = trans3D;
    [replicatorLayer addSublayer:shapeLayer];
    
    return replicatorLayer;
}

// 网格动画
+ (CALayer *)drawGrid {
    NSInteger column = 3;
    CGFloat between = 5.0;
    CGFloat radius = (100 - between * (column - 1))/column;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, 0, radius, radius);
    shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, radius, radius)].CGPath;
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[[self scaleAnimation1], [self alphaAnimation]];
    animationGroup.duration = 1.0;
    animationGroup.autoreverses = YES;
    animationGroup.repeatCount = HUGE;
    [shapeLayer addAnimation:animationGroup forKey:@"groupAnimation"];
    
    CAReplicatorLayer *replicatorLayerX = [CAReplicatorLayer layer];
    replicatorLayerX.frame = CGRectMake(0, 0, 100, 100);
    replicatorLayerX.instanceDelay = 0.3;
    replicatorLayerX.instanceCount = column;
    replicatorLayerX.instanceTransform = CATransform3DTranslate(CATransform3DIdentity, radius+between, 0, 0);
    [replicatorLayerX addSublayer:shapeLayer];
    
    CAReplicatorLayer *replicatorLayerY = [CAReplicatorLayer layer];
    replicatorLayerY.frame = CGRectMake(0, 0, 100, 100);
    replicatorLayerY.instanceDelay = 0.3;
    replicatorLayerY.instanceCount = column;
    replicatorLayerY.instanceTransform = CATransform3DTranslate(CATransform3DIdentity, 0, radius+between, 0);
    [replicatorLayerY addSublayer:replicatorLayerX];
    
    return replicatorLayerY;
}

// 震动条动画
+ (CALayer *)drawShake {
    
    CALayer *layer = [[CALayer alloc]init];
    layer.frame = CGRectMake(0, 0, 10, 80);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.anchorPoint = CGPointMake(0.5, 1);
    // 添加一个基本动画
    [layer addAnimation:[self scaleYAnimation] forKey:@"scaleAnimation"];
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(0, 0, 80, 80);
    
    replicatorLayer.instanceCount = 6;
    replicatorLayer.instanceTransform =  CATransform3DMakeTranslation(45, 0, 0);
    replicatorLayer.instanceDelay = 0.2;
    replicatorLayer.instanceGreenOffset = -0.3;
    [replicatorLayer addSublayer:layer];
    return replicatorLayer;
}

// 转圈动画
+ (CALayer *)drawRound {
    
    CALayer *layer = [[CALayer alloc]init];
    layer.frame = CGRectMake(0, 0, 12, 12);
    layer.cornerRadius = 6;
    layer.masksToBounds = YES;
    layer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
    layer.backgroundColor = [UIColor purpleColor].CGColor;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 1;
    animation.repeatCount = MAXFLOAT;
    animation.fromValue = @(1);
    animation.toValue = @(0.01);
    [layer addAnimation:animation forKey:nil];
    
    NSInteger instanceCount = 9;
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(0, 0, 50, 50);
    replicatorLayer.preservesDepth = YES;
    replicatorLayer.instanceColor = [UIColor whiteColor].CGColor;
    replicatorLayer.instanceRedOffset = 0.1;
    replicatorLayer.instanceGreenOffset = 0.1;
    replicatorLayer.instanceBlueOffset = 0.1;
    replicatorLayer.instanceAlphaOffset = 0.1;
    replicatorLayer.instanceCount = instanceCount;
    replicatorLayer.instanceDelay = 1.0/instanceCount;
    replicatorLayer.instanceTransform = CATransform3DMakeRotation((2 * M_PI) /instanceCount, 0, 0, 1);
    [replicatorLayer addSublayer:layer];
    
    return replicatorLayer;
}

// 心动画
+ (CALayer *)drawHeart {
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    
    CALayer *subLayer = [CALayer layer];
    subLayer.bounds = CGRectMake(60, 205, 10, 10);
    subLayer.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
    subLayer.borderColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
    subLayer.borderWidth = 1.0;
    subLayer.cornerRadius = 5.0;
    subLayer.shouldRasterize = YES;
    subLayer.rasterizationScale = [UIScreen mainScreen].scale;
    
    CAKeyframeAnimation *move = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    move.path = [self heartPath];
    move.repeatCount = INFINITY;
    move.duration = 6.0;
    [subLayer addAnimation:move forKey:nil];
    
    [replicatorLayer addSublayer:subLayer];
    replicatorLayer.instanceDelay = 6/50.0;
    replicatorLayer.instanceCount = 50;
    replicatorLayer.instanceColor = [UIColor redColor].CGColor;
    replicatorLayer.instanceGreenOffset = -0.03;
    
    return replicatorLayer;
}

// 翻转动画
+ (CALayer *)drawTurn {
    CGFloat margin = 8.0;
    CGFloat width = 80;
    CGFloat dotW = (width - 2 * margin) / 3;
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, (width - dotW) * 0.5, dotW, dotW);
    shapeLayer.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, dotW, dotW)].CGPath;
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(0, 0, width, width);
    replicatorLayer.instanceDelay = 0.1;
    replicatorLayer.instanceCount = 3;
    CATransform3D transform = CATransform3DMakeTranslation(margin + dotW, 0, 0);
    
    replicatorLayer.instanceTransform = transform;
    [replicatorLayer addSublayer:shapeLayer];
    
    CABasicAnimation *basicAnima = [CABasicAnimation animationWithKeyPath:@"transform"];
    basicAnima.fromValue = [NSValue valueWithCATransform3D:CATransform3DRotate(CATransform3DIdentity, 0, 0, 1.0, 0)];
    basicAnima.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(CATransform3DIdentity, M_PI, 0, 1.0, 0)];
    basicAnima.repeatCount = HUGE;
    basicAnima.duration = 0.6;
    
    [shapeLayer addAnimation:basicAnima forKey:nil];
    
    return replicatorLayer;
}

#pragma mark -----------------------  基础动画

+ (CGPathRef)heartPath
{
    CGFloat W = 25;
    CGFloat marginX = 10;
    CGFloat marginY = 15/25.0 * W;
    CGFloat space = 5/25.0 * W;
    
    UIBezierPath *bezierPath = [UIBezierPath new];
    
    [bezierPath moveToPoint:(CGPointMake(marginX + W * 2, W * 4 + space))];
    [bezierPath addQuadCurveToPoint:CGPointMake(marginX, W * 2) controlPoint:CGPointMake(W, W * 4 - space)];
    [bezierPath addCurveToPoint:CGPointMake(marginX + W * 2, W * 2) controlPoint1:CGPointMake(marginX, marginY) controlPoint2:CGPointMake(marginX + W * 2, marginY)];
    [bezierPath addCurveToPoint:CGPointMake(marginX + W * 4, W * 2) controlPoint1:CGPointMake(marginX + W * 2, marginY) controlPoint2:CGPointMake(marginX + W * 4, marginY)];
    [bezierPath addQuadCurveToPoint:CGPointMake(marginX + W * 2, W * 4 + space) controlPoint:CGPointMake(marginX * 2 + W * 3, W * 4 - space)];
    
    [bezierPath closePath];
    
    CGAffineTransform T = CGAffineTransformMakeScale(3.0, 3.0);
    return CGPathCreateCopyByTransformingPath(bezierPath.CGPath, &T);
}


+ (CABasicAnimation *)scaleYAnimation{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    anim.toValue = @0.1;
    anim.duration = 0.4;
    anim.autoreverses = YES;//往返都有动画
    anim.repeatCount = MAXFLOAT;//执行次数
    return anim;
}

+ (CABasicAnimation *)alphaAnimation{
    CABasicAnimation *alpha = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alpha.fromValue = @(1.0);
    alpha.toValue = @(0.0);
    return alpha;
}

+ (CABasicAnimation *)scaleAnimation{
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform"];
    scale.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.0, 0.0, 0.0)];
    scale.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1.0, 1.0, 0.0)];
    return scale;
}

+ (CABasicAnimation *)scaleAnimation1{
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform"];
    scale.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1.0, 1.0, 0.0)];
    scale.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.2, 0.2, 0.0)];
    scale.autoreverses = YES;
    scale.repeatCount = HUGE;
    scale.duration = 0.6;
    return scale;
}

+ (CABasicAnimation *)rotationAnimation:(CGFloat)transX{
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D fromValue = CATransform3DRotate(CATransform3DIdentity, 0.0, 0.0, 0.0, 0.0);
    scale.fromValue = [NSValue valueWithCATransform3D:fromValue];
    
    CATransform3D toValue = CATransform3DTranslate(CATransform3DIdentity, transX, 0.0, 0.0);
    toValue = CATransform3DRotate(toValue,120.0*M_PI/180.0, 0.0, 0.0, 1.0);
    
    scale.toValue = [NSValue valueWithCATransform3D:toValue];
    scale.autoreverses = NO;
    scale.repeatCount = HUGE;
    scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    scale.duration = 0.8;
    return scale;
}


@end
