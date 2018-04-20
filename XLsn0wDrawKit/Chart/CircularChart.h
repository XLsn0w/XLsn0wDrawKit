
#import <UIKit/UIKit.h>

@interface CircularChart : UIView

///值相关
@property (nonatomic, copy) NSString *valueTitle;
@property (nonatomic, weak) UIColor *valueColor;
@property (nonatomic, weak) UIFont *valueFont;

@property (nonatomic, strong) NSArray *colorArray;///渐变色数组
@property (nonatomic, strong) NSArray *locations;///渐变色数组所占位置
@property (nonatomic, strong) UIColor *insideCircleColor;///底圆颜色

@property (nonatomic, strong) UIColor *singleColor;///单色

///初始化方法
- (instancetype)initWithFrame:(CGRect)frame
                 withMaxValue:(CGFloat)maxValue
                        value:(CGFloat)value;

@end
