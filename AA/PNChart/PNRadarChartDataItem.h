//
//  PNRadarChartDataItem.h
//  PNChartDemo
//
//  Created by Lei on 15/7/1.
//  Copyright (c) 2015年 kevinzhow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PNRadarChartDataItem : NSObject

+ (instancetype)dataItemWithValue:(CGFloat)value
                      description:(NSString *)description;

@property (nonatomic,assign) CGFloat   value;
@property (nonatomic,copy) NSString *textDescription;

@end
