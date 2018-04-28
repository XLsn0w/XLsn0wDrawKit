//
//  JHTableDataRowModel.h
//  JHChartDemo
//
//  Created by leilurong on 16/8/25.
//  Copyright © 2016年 leilurong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface JHTableDataRowModel : NSObject

/**
 *  The maximum number of columns in the model.
 */
@property (nonatomic, assign) NSInteger maxCount;


/**
 *  Data Source Array
 */
@property (nonatomic, strong) NSArray * dataArr;



@end
