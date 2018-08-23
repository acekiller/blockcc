//
//  BCTickerPage.h
//  blockcc
//
//  Created by fantasy on 2018/8/23.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BCTicker.h"

@interface BCTickerPage : NSObject
@property (nonatomic, assign) NSUInteger page;   //当前页码
@property (nonatomic, assign) NSUInteger size;  //每页数据量
@property (nonatomic, assign) NSUInteger total_page;    //最大页码
@property (nonatomic, assign) NSUInteger total_count;   //总数据量
@property (nonatomic, copy) NSArray *list;  //ticker数据
@end
