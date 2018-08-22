//
//  BCMarketSymbolPair.h
//  blockcc
//
//  Created by fantasy on 2018/8/22.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCMarketSymbolPair : NSObject
@property (nonatomic, strong) NSString *market; //是    交易所名称
@property (nonatomic, strong) NSString *symbol_pair; //是    交易对
@property (nonatomic, strong) NSString *type; //否    K线类型ENUM[5m,15m,30m,1h,6h,1d],默认5m
@property (nonatomic, assign) NSUInteger limit; //否    返回数据量,默认1000

- (NSDictionary *) pairJson;

@end
