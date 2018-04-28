
#import <UIKit/UIKit.h>

typedef void(^finishBlock)();

@interface LRButton : UIView

@property (nonatomic,copy) finishBlock translateBlock;

@end
