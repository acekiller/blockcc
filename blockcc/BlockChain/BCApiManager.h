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
- (RACSignal *) getIPLocation:(BCIPRequestPair *)pairs;
//交易所列表
- (RACSignal *) getMarkets;
- (RACSignal *) getSymbols;
- (RACSignal *) getCurrencies;
- (RACSignal *) getMarketPair;
- (RACSignal *) getMarket;  //获取制定交易所信息

- (RACSignal *) getKLine:(BCMarketSymbolPair *)pairs;
- (RACSignal *) getTrade:(BCMarketSymbolPair *)pairs;
- (RACSignal *) getDepth:(BCMarketSymbolPair *)pairs;

- (RACSignal *) getExchange_rate:(BCMarketSymbolPair *)pairs;
- (RACSignal *) getExrate:(BCMarketSymbolPair *) pairs;

- (RACSignal *) getTicker:(BCMarketSymbolPair *)pairs;
- (RACSignal *) getTickers:(BCMarketSymbolPair *)pairs;
- (RACSignal *) getPrice:(BCMarketSymbolPair *)pairs;
- (RACSignal *) getPriceHistory:(BCMarketSymbolPair *)pairs;

- (RACSignal *) getTxTxhash:(BCMarketSymbolPair *)pairs;
- (RACSignal *) getAddress:(BCMarketSymbolPair *)pairs;

- (RACSignal *) getNewPairs:(BCNodeRequestPairs *)pairs;

@end
