//
//  XLsn0wAnimationLayer.h
//  XLsn0wDrawKit
//
//  Created by ginlong on 2018/4/24.
//  Copyright © 2018年 ginlong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, XLsn0wAnimationType) {
    XLsn0wAnimation_ReplicatorLayer,  // 复制动画
    XLsn0wAnimation_EmitterLayer,     // 粒子动画
    XLsn0wAnimation_GradientLayer,    // 渐变动画
};

// 动画类型
typedef NS_ENUM(NSUInteger, XLsn0wAnimationLayerType){
    XLsn0wAnimationLayer_Circle,
    XLsn0wAnimationLayer_Wave,
    XLsn0wAnimationLayer_Triangle,
    XLsn0wAnimationLayer_Grid,
    XLsn0wAnimationLayer_Shake,
    XLsn0wAnimationLayer_Round,
    XLsn0wAnimationLayer_Heart,
    XLsn0wAnimationLayer_Turn,
};

@interface XLsn0wAnimationLayer : NSObject

@property (nonatomic, assign) XLsn0wAnimationType layerType;

@property (nonatomic, assign) XLsn0wAnimationLayerType replicatorLayerType;

+ (CALayer *)replicatorLayerWithType:(XLsn0wAnimationLayerType)type;

+ (CALayer *)replicatorLayer_Circle;
+ (CALayer *)replicatorLayer_Wave;
+ (CALayer *)replicatorLayer_Triangle;
+ (CALayer *)replicatorLayer_Grid;
+ (CALayer *)replicatorLayer_Shake;
+ (CALayer *)replicatorLayer_Round;
+ (CALayer *)replicatorLayer_Heart;

@end
