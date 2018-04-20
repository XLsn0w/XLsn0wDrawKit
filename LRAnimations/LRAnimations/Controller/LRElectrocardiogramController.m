//
//  LRElectrocardiogramController.m
//  LRAnimations
//
//  Created by LeiLuRong on 2017/12/11.
//  Copyright © 2017年 LeiLuRong. All rights reserved.
//

#import "LRElectrocardiogramController.h"

@implementation LRElectrocardiogramController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 界面缩小系数
    CGFloat scale = 1;
    
    if (iPhone4_4s || iPhone5_5s) {
        
        scale = 0.65f;
        
    } else if (iPhone6_6s || iPhoneX_X) {
        
        scale = 0.75f;
        
    } else if (iPhone6_6sPlus) {
        
        scale = 0.8f;
    }
}

@end
