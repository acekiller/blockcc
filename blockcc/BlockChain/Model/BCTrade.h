//
//  BCTrade.h
//  blockcc
//
//  Created by fantasy on 2018/8/22.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCTrade : NSObject

@property (nonatomic, strong) NSString *trade_id;   //交易ID
@property (nonatomic, assign) long long time;   //交易成交时间戳
@property (nonatomic, assign) double price;   //成交价格
@property (nonatomic, assign) double amount;   //成交量
@property (nonatomic, strong) NSString *type;   //成交类型ENUM[buy,sell,none]，为taker操作方向

@end
