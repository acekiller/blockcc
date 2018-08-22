//
//  BCApiManager.h
//  blockcc
//
//  Created by acekiller on 2018/8/21.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "BCHTTPManager.h"
#import "BCModelHeader.h"
#import "BCApi.h"

@interface BCApiManager : NSObject

@property (nonatomic, strong, readonly) BCHTTPManager *httpManager;

+ (instancetype) blockcc;
- (instancetype)init NS_UNAVAILABLE;

- (RACSignal *) getLocalIPLocation;
- (RACSignal *) getIPLocation:(NSString *)ip_address;
//交易所列表
- (RACSignal *) getMarkets;
- (RACSignal *) getSymbols;
- (RACSignal *) getCurrencies;
- (RACSignal *) getMarketPair;
- (RACSignal *) getMarket;  //获取制定交易所信息

- (RACSignal *) getKLine:(BCMarketSymbolPair *)pair;
- (RACSignal *) getTrade:(BCMarketSymbolPair *)pair;
- (RACSignal *) getDepth:(BCMarketSymbolPair *)pair;
//- (RACSignal *) getTrade:(BCMarketSymbolPair *)pair;

@end
