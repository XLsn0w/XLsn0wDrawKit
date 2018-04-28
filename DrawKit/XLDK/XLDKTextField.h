
#import <UIKit/UIKit.h>

@interface XLDKTextField : UIView

@property (nonatomic, copy) NSString *lr_placeholder;//注释信息
@property (nonatomic, strong) UIColor *cursorColor;//光标颜色
@property (nonatomic, strong) UIColor *placeholderNormalStateColor;//注释普通状态下颜色
@property (nonatomic, strong) UIColor *placeholderSelectStateColor;//注释选中状态下颜色

@end
