
#import <UIKit/UIKit.h>

@interface DialView : UIView

/**
 设置进度值的显示的字体大小
 */
@property (nonatomic, strong) UIFont *progressLabelFont;

/**
 @param frame 坐标
 @param tintColor 一般状态下的颜色
 @param selectedColor 经过的进度条的颜色
 @param value 进度条的初始值, 0 - 1之间
 @param animated 动画(是否有动画只能在初始化时指定)
 */
- (instancetype)initWithFrame:(CGRect)frame
                    tintColor:(UIColor *)tintColor
                selectedColor:(UIColor *)selectedColor
                    dialValue:(CGFloat)dialValue
                     animated:(BOOL)animated;

/**
 设置进度条的值

 @param value 进度条的值
 */
- (void)setProgressValue:(CGFloat)value;

/**
 无限循环
 */
- (void)infineLoop;

@end
