//
//  BCDepth.h
//  blockcc
//
//  Created by fantasy on 2018/8/22.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCDepth : NSObject

@property (nonatomic, assign) long long timestamps; //更新时间戳
@property (nonatomic, copy) NSArray *bids;  //买单列表
@property (nonatomic, copy) NSArray *asks;  //卖单列表
//---------    -----------
//0    价格
//1    挂单量

@end
