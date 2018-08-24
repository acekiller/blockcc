//
//  BCMarketSymbolPair.h
//  blockcc
//
//  Created by fantasy on 2018/8/22.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BCRequstPairs.h"

@interface BCMarketSymbolPair : BCRequstPairs
@property (nonatomic, strong) NSString *market; //是    交易所名称，可传多个，逗号分割
@property (nonatomic, strong) NSString *symbol_pair; //是    交易所-交易对，可传多个，逗号分割
@property (nonatomic, strong) NSString *symbol; //是    币种符号，可传多个，逗号分割
@property (nonatomic, strong) NSString *symbol_name;    //否    币种名称，可传多个，逗号分割
@property (nonatomic, strong) NSString *currency;   //否    基础货币，可传多个，逗号分割
@property (nonatomic, strong) NSString *type; //否    K线类型ENUM[5m,15m,30m,1h,6h,1d],默认5m
@property (nonatomic, assign) NSUInteger limit; //否    返回数据量,默认1000
@property (nonatomic, assign) NSUInteger page;   //否    当前页数，默认 1, (>=1)
@property (nonatomic, assign) NSUInteger size;   //否    每页数据量，默认 20 (>=1)

@end
