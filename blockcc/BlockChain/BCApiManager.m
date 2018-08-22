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
    return [[self getRequest:self.api.ip parameters:nil]
            map:^id _Nullable(id  _Nullable value) {
                return [BCLocation mj_objectWithKeyValues:value];
            }];
}

- (RACSignal *)getIPLocation:(NSString *)ip_address {
    return [[self getRequest:self.api.ip_ip_address parameters:@{@"ip_address" : NilSafe(ip_address)}]
            map:^id _Nullable(id  _Nullable value) {
                return [BCLocation mj_objectWithKeyValues:value];
            }];
}

- (RACSignal *)getMarkets {
    return [[self getRequest:self.api.markets parameters:nil]
            map:^id _Nullable(id  _Nullable value) {
                return [BCMarket mj_objectArrayWithKeyValuesArray:value];
            }];
}

- (RACSignal *) getSymbols {
    return [[self getRequest:self.api.symbols parameters:nil]
            map:^id _Nullable(id  _Nullable value) {
                return [BCMarket mj_objectArrayWithKeyValuesArray:value];
            }];
}
- (RACSignal *) getCurrencies {
    return [[self getRequest:self.api.currencies parameters:nil]
            map:^id _Nullable(id  _Nullable value) {
                return value;
//                return [BCMarket mj_objectArrayWithKeyValuesArray:value];
            }];
}

- (RACSignal *) getMarketPair {
    return [[self getRequest:self.api.market_pairs parameters:nil]
            map:^id _Nullable(id  _Nullable value) {
                return [BCMarketPair mj_objectArrayWithKeyValuesArray:value];
            }];
}

- (RACSignal *) getMarket {
    return [[self getRequest:self.api.market_pairs parameters:nil]
            map:^id _Nullable(id  _Nullable value) {
                return [BCMarket mj_objectWithKeyValues:value];
            }];
}

- (RACSignal *) getKLine:(BCMarketSymbolPair *)pair {
    return [[self getRequest:self.api.kline parameters:pair.pairJson]
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
    return [[self getRequest:self.api.trade parameters:pair.pairJson]
            map:^id _Nullable(id  _Nullable value) {
                return [BCTrade mj_objectArrayWithKeyValuesArray:value];
            }];
}

- (RACSignal *) getDepth:(BCMarketSymbolPair *)pair {
    return [[self getRequest:self.api.depth parameters:pair.pairJson]
            map:^id _Nullable(id  _Nullable value) {
                return [BCDepth mj_objectArrayWithKeyValuesArray:value];
            }];
}

- (RACSignal *)getRequest:(NSString *)api parameters:(NSDictionary *)parameters {
    return [[self.httpManager getRequest:api parameters:parameters]
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
