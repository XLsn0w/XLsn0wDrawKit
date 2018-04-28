//
//  JHShowInfoView.h
//  JHChartDemo
//
//  Created by leilurong on 16/5/4.
//  Copyright © 2016年 leilurong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHShowInfoView : UIView



@property (copy, nonatomic) NSString * showContentString;


- (void)updateFrameTo:(CGRect)frame
           andBGColor:(UIColor *)bgColor
 andShowContentString:(NSString *)contentString;

@end
