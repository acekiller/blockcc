//
//  BCApiManager.m
//  blockcc
//
//  Created by acekiller on 2018/8/21.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import "BCApiManager.h"
#import <MJExtension/MJExtension.h>
#import "BCHTTPManager.h"
#import "BCHTTPDefaultConfig.h"
#import "BCApi.h"

#define BCHTTPBASEURL @"https://data.block.cc/api/v1"

#define NilSafe(x) (x == nil) ? [NSNull null] : (x)

@interface BCApiManager ()
@property (nonatomic, strong, readonly) BCApi *api;
@end

@implementation BCApiManager

@synthesize httpManager=_httpManager;
@synthesize api=_api;

- (BCApi *)api {
    if (!_api) {
        _api = [[BCApi alloc] init];
    }
    return _api;
}

- (BCHTTPManager *)httpManager {
    if (!_httpManager) {
        BCHTTPDefaultConfig *config = [[BCHTTPDefaultConfig alloc] initWithBaseURL:BCHTTPBASEURL];
        [BCHTTPManager setConfig:config];
        _httpManager = [BCHTTPManager http];
    }
    return _httpManager;
}

+ (instancetype) blockcc {
    static id _instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}
//
//- (instancetype)init {
//    self = [super init];
//    if (self) {
//
//    }
//    return self;
//}

- (RACSignal *)getLocalIPLocation {
    return [[self getRequest:self.api.ip pairs:nil]
            map:^id _Nullable(id  _Nullable value) {
                return [BCLocation mj_objectWithKeyValues:value];
            }];
}

- (RACSignal *)getIPLocation:(BCIPRequestPair *)pairs {
    return [[self getRequest:self.api.ip_ip_address pairs:pairs]
            map:^id _Nullable(id  _Nullable value) {
                return [BCLocation mj_objectWithKeyValues:value];
            }];
}

- (RACSignal *)getMarkets {
    return [[self getRequest:self.api.markets pairs:nil]
            map:^id _Nullable(id  _Nullable value) {
                return [BCMarket mj_objectArrayWithKeyValuesArray:value];
            }];
}

- (RACSignal *) getSymbols {
    return [[self getRequest:self.api.symbols pairs:nil]
            map:^id _Nullable(id  _Nullable value) {
                return [BCMarket mj_objectArrayWithKeyValuesArray:value];
            }];
}
- (RACSignal *) getCurrencies {
    return [[self getRequest:self.api.currencies pairs:nil]
            map:^id _Nullable(id  _Nullable value) {
                return value;
//                return [BCMarket mj_objectArrayWithKeyValuesArray:value];
            }];
}

- (RACSignal *) getMarketPair {
    return [[self getRequest:self.api.market_pairs pairs:nil]
            map:^id _Nullable(id  _Nullable value) {
                return [BCMarketPair mj_objectArrayWithKeyValuesArray:value];
            }];
}

- (RACSignal *) getMarket {
    return [[self getRequest:self.api.market_pairs pairs:nil]
            map:^id _Nullable(id  _Nullable value) {
                return [BCMarket mj_objectWithKeyValues:value];
            }];
}

- (RACSignal *) getKLine:(BCMarketSymbolPair *)pair {
    return [[self getRequest:self.api.kline pairs:pair]
            map:^id _Nullable(id  _Nullable value) {
                if (![value isKindOfClass:[NSArray class]]) {
                    return value;
                }
                return [[[[(NSArray *)value rac_sequence] filter:^BOOL(id  _Nullable value) {
                    if ([value isKindOfClass:[NSArray class]]) {
                        return [(NSArray *)value count] >= 6;
                    }
                    return NO;
                }] map:^id _Nullable(id  _Nullable value) {
                    return [[BCKLine alloc] initWithIndexArray:value];
                }] array];
            }];
}

- (RACSignal *) getTrade:(BCMarketSymbolPair *)pair {
    return [[self getRequest:self.api.trade pairs:pair]
            map:^id _Nullable(id  _Nullable value) {
                return [BCTrade mj_objectArrayWithKeyValuesArray:value];
            }];
}

- (RACSignal *) getDepth:(BCMarketSymbolPair *)pair {
    return [[self getRequest:self.api.depth pairs:pair]
            map:^id _Nullable(id  _Nullable value) {
                return [BCDepth mj_objectArrayWithKeyValuesArray:value];
            }];
}

- (RACSignal *) getTicker:(BCMarketSymbolPair *)pair {
    return [[self getRequest:self.api.ticker pairs:pair]
            map:^id _Nullable(id  _Nullable value) {
                return [BCTicker mj_objectWithKeyValues:value];
            }];
}

- (RACSignal *) getTickers:(BCMarketSymbolPair *)pair {
    return [[self getRequest:self.api.tickers pairs:pair]
            map:^id _Nullable(id  _Nullable value) {
                return [BCTickerPage mj_objectWithKeyValues:value];
            }];
}

- (RACSignal *)getRequest:(NSString *)api pairs:(id<BCRequstPairs>)pairs {
    return [[self.httpManager getRequest:api parameters:pairs.pairJson]
            flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
                NSInteger code = [value[@"code"] integerValue];
                NSString *msg = value[@"message"];
                if (code == 0) {
                    return [RACSignal return:value[@"data"]];
                } else {
                    return [RACSignal error:[NSError errorWithDomain:@"cc.block.data" code:code userInfo:@{NSLocalizedDescriptionKey : NilSafe(msg)}]];
                }
            }];
}

@end
