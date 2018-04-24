

#import "BaseEmitterLayerView.h"

@interface BaseEmitterLayerView () {
    CAEmitterLayer *emitterLayer;
}

@end

@implementation BaseEmitterLayerView

/**
 *  替换layer
 *
 *  @return 替换当前view的layer
 */
+ (Class)layerClass {
    
    return [CAEmitterLayer class];
}

/**
 *  模拟setter，getter方法
 *
 */
- (void)setEmitterLayer:(CAEmitterLayer *)layer {
    
    emitterLayer = layer;
}

- (CAEmitterLayer *)emitterLayer {
    
    return emitterLayer;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        emitterLayer = (CAEmitterLayer *)self.layer;
    }
    return self;
}

- (void)show {

}

- (void)hide {
    
}

- (void)initWithType:(EmitterType)type {

}

@end
