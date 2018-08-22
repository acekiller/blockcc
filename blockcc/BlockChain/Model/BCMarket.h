//
//  BCMarket.h
//  blockcc
//
//  Created by fantasy on 2018/8/22.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCMarket : NSObject  //市场 or 交易所
@property (nonatomic, strong) NSString *name;       //交易所名称(ID)
@property (nonatomic, strong) NSString *display_name;       //交易所显示名称
@property (nonatomic, strong) NSString *home_url;       //交易所链接
@property (nonatomic, assign) double volume;       //根据加权计算出的交易量(USD)
@property (nonatomic, assign) double display_volume;       //未经加权计算出的交易量(USD)
@property (nonatomic, copy) NSArray *symbol_pairs;       //该交易所支持的交易对列表
@property (nonatomic, strong) NSString *status;       //状态: [enable, disable]. disable为停止更新数据
@property (nonatomic, assign) Float32 ping;       //服务器ping值
@property (nonatomic, assign) BOOL has_kline;       //是否接入K线数据
@end
