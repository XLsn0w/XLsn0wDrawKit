
#import "CircularChart.h"

@interface CircularChart ()

@property (nonatomic, weak) UILabel *valueLabel;

@property (nonatomic, assign) CGFloat value;

@property (nonatomic, assign) CGFloat maxValue;

@property (nonatomic, strong) CAGradientLayer *colorLayer;

@property (nonatomic, strong) CAShapeLayer *insideShapelayer;

@property (nonatomic, strong) CAShapeLayer *outerShapelayer;

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation CircularChart

- (instancetype)initWithFrame:(CGRect)frame
                 withMaxValue:(CGFloat)maxValue
                        value:(CGFloat)value {
    
    if (self =  [super initWithFrame:frame]) {
        if (maxValue < value) {
            maxValue = value;
        }
        _value = value;
        _maxValue = maxValue;
        [self drawArc];
    }
    return self;
}

- (void)drawArc {
    UIBezierPath * arcPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
                                                            radius:self.frame.size.width / 2 - 15
                                                        startAngle:0
                                                          endAngle:2 * M_PI
                                                         clockwise:YES];
    
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    _insideShapelayer = shapelayer;
    shapelayer.lineWidth = 20.0;
    shapelayer.strokeColor = [UIColor colorWithRed:51.0/255.0 green:55.0/255.0 blue:60.0/255.0 alpha:1].CGColor;
    shapelayer.fillColor = [UIColor clearColor].CGColor;
    shapelayer.path = arcPath.CGPath;
    
    [self.layer addSublayer:shapelayer];
    
    ///顶层圆
    CGFloat outerRadius = self.frame.size.width / 2 - 15;
    
    NSLog(@"value:%f---maxValue:%f",_value,_maxValue);
    
    UIBezierPath *outerArcPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
                                                                radius:outerRadius
                                                            startAngle:-M_PI_2
                                                              endAngle:M_PI * 2 * (_value / _maxValue) - M_PI_2
                                                             clockwise:YES];
    
    CAShapeLayer *outerShapelayer = [CAShapeLayer layer];
    _outerShapelayer = outerShapelayer;
    outerShapelayer.lineWidth = 20.0;
    outerShapelayer.strokeColor = [UIColor clearColor].CGColor;
    outerShapelayer.fillColor = [UIColor clearColor].CGColor;
    outerShapelayer.path = outerArcPath.CGPath;
    [self.layer addSublayer:outerShapelayer];
    ///标注
    UILabel *valueLabel = [[UILabel alloc] init];
    
    [self addSubview:valueLabel];
    
    self.valueLabel = valueLabel;
    
    valueLabel.frame = CGRectMake(CGPointMake(self.frame.size.width/2, self.frame.size.height/2).x - 50, CGPointMake(self.frame.size.width/2, self.frame.size.height/2).y - 10, 100, 20);
    valueLabel.textColor = [UIColor whiteColor];
    valueLabel.font = [UIFont systemFontOfSize:24 weight:2];
    valueLabel.textAlignment = NSTextAlignmentCenter;

    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    _gradientLayer = gradientLayer;
    gradientLayer.frame = self.bounds;
    gradientLayer.backgroundColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:gradientLayer];
    
    CAGradientLayer *colorLayer = [CAGradientLayer layer];
    self.colorLayer = colorLayer;
    colorLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    colorLayer.locations = @[@0.1,@1.0];
    colorLayer.startPoint = CGPointMake(0, 0);
    colorLayer.endPoint = CGPointMake(1, 0);
    [gradientLayer addSublayer:colorLayer];
    
    
    CAShapeLayer *gressLayer = [CAShapeLayer layer];
    gressLayer.lineWidth = 20.0;
    gressLayer.strokeColor = [UIColor blueColor].CGColor;
    gressLayer.fillColor = [UIColor clearColor].CGColor;
    gressLayer.lineCap = @"bevel";
    gressLayer.path = outerArcPath.CGPath;
    gradientLayer.mask = gressLayer;
    
    CABasicAnimation *ani = [ CABasicAnimation animationWithKeyPath : NSStringFromSelector ( @selector (strokeEnd))];
    ani.fromValue = @0;
    ani.toValue = @1;
    ani.duration = 1.0;
    [gressLayer addAnimation:ani forKey:NSStringFromSelector(@selector(strokeEnd))];
}

#pragma mark set方法
- (void)setValueTitle:(NSString *)valueTitle{
    _valueLabel.text = valueTitle;
}

- (void)setValueFont:(UIFont *)valueFont{
    _valueLabel.font = valueFont;
}

- (void)setValueColor:(UIColor *)valueColor{
    _valueLabel.textColor = valueColor;
}

- (void)setInsideCircleColor:(UIColor *)insideCircleColor{
    _insideShapelayer.strokeColor = insideCircleColor.CGColor;
}

- (void)setColorArray:(NSArray *)colorArray{
    _colorArray = colorArray;
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (UIColor *color in colorArray) {
        [array addObject:(id)color.CGColor];
    }
    
    _colorLayer.colors = array.copy;
}

- (void)setLocations:(NSArray *)locations{
    _colorLayer.locations = locations;
}

- (void)setSingleColor:(UIColor *)singleColor{
    _outerShapelayer.strokeColor = singleColor.CGColor;
    [_gradientLayer removeFromSuperlayer];
    
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector (strokeEnd))];
    ani.fromValue = @0;
    ani.toValue = @1;
    ani.duration = 1.0;
    [_outerShapelayer addAnimation:ani forKey:NSStringFromSelector(@selector(strokeEnd))];
}

@end
