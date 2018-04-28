
#import <UIKit/UIKit.h>

typedef void(^finishBlock)(void);

@interface XLDKButton : UIView

@property (nonatomic, copy) finishBlock translateBlock;

@end
