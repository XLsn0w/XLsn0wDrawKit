//
//  JHPieForeBGView.h
//  JHCALayer
//
//  Created by leilurong on 16/4/28.
//  Copyright © 2016年 leilurong. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Each click of the pie chart callback block
 */
typedef void(^selectBlock)(CGFloat angle,CGPoint p);



@interface JHPieForeBGView : UIView

/**
 *  Current pie chart callback block
 */
@property (copy, nonatomic) selectBlock select;


@end
