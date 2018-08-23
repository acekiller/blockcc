//
//  BCTicker.h
//  blockcc
//
//  Created by fantasy on 2018/8/23.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCTicker : NSObject
@property (nonatomic, assign) long long timestamps; //数据更新时间
@property (nonatomic, assign) long long last; //最新价格
@property (nonatomic, assign) double bid; //买一价
@property (nonatomic, assign) double ask; //卖一价
@property (nonatomic, assign) double high; //24小时最高价
@property (nonatomic, assign) double low; //24小时最低价
@property (nonatomic, assign) double vol; //24小时交易货币交易量
@property (nonatomic, assign) double base_volume; //24小时基础货币交易量
@property (nonatomic, assign) double change_daily; //24小时涨幅
@property (nonatomic, strong) NSString *market; //交易所名称
@property (nonatomic, strong) NSString *symbol_name; //币种名称
@property (nonatomic, strong) NSString *symbol_pair; //交易对
@property (nonatomic, assign) BOOL has_kline; //是否接入K线数据
@property (nonatomic, assign) double usd_rate; //基础转货币转美元的汇率
@end
