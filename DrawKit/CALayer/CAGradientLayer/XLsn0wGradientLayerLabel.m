
#import "XLsn0wGradientLayerLabel.h"

@implementation XLsn0wGradientLayerLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.textColor = [UIColor blueColor];
        self.font = [UIFont systemFontOfSize:35];
        self.text = [NSString string];
    }
    return self;
}


- (void)showSuperview:(UIView *)view
                 text:(NSString *)text {
    if (text) {
        self.text = text;
    }
    [self showSuperview:view];
}


/**
 colors
 var colors: [AnyObject]?
 一个内部是CGColorRef的数组,规定所有的梯度所显示的颜色,默认为nil
 
 locations
 var locations: [NSNumber]?
 一个内部是NSNumber的可选数组,规定所有的颜色梯度的区间范围,选值只能在0到1之间,并且数组的数据必须单增,默认值为nil
 
 endPoint
 var endPoint: CGPoint
 图层颜色绘制的终点坐标,也就是阶梯图层绘制的结束点,默认值是(0.5,1.0)
 
 startPoint
 var startPoint: CGPoint
 与endPoint相互对应,就是绘制阶梯图层的起点坐标,绘制颜色的起点,默认值是(0.5,0.0)
 
 type
 var type:String
 绘制类型,默认值是kCAGradientLayerAxial,也就是线性绘制,各个颜色阶层直接的变化是线性的
 */
- (void)showSuperview:(UIView *)view {
    [view addSubview:self];
    [self sizeToFit];
    
    // 创建渐变效果的layer
    CAGradientLayer *graLayer = [CAGradientLayer layer];
    graLayer.frame = self.bounds;
    graLayer.colors = @[(__bridge id)[[UIColor greenColor] colorWithAlphaComponent:0.3].CGColor,
                        (__bridge id)[UIColor yellowColor].CGColor,
                        (__bridge id)[[UIColor yellowColor] colorWithAlphaComponent:0.3].CGColor];
    
    graLayer.startPoint = CGPointMake(0, 0.1);//设置渐变方向起点
    graLayer.endPoint = CGPointMake(1, 0);  //设置渐变方向终点
    graLayer.locations = @[@(0.0), @(0.0), @(0.1)]; //colors中各颜色对应的初始渐变点
    
    // 创建动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
    animation.duration = 1.0f;
    animation.toValue = @[@(0.9), @(1.0), @(1.0)];
    animation.removedOnCompletion = NO;
    animation.repeatCount = HUGE_VALF;
    animation.fillMode = kCAFillModeForwards;
    
    [graLayer addAnimation:animation forKey:nil];  ///  Layer addAnimation
    
    // 将graLayer设置成textLabel的遮罩
    self.layer.mask = graLayer;                    ///  Layer addLayer
}

- (void)hide {
    [self removeFromSuperview];
}

@end
