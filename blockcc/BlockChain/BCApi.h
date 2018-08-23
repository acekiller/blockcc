//
//  BCApi.h
//  blockcc
//
//  Created by acekiller on 2018/8/22.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCApi : NSObject

//IP Location
- (NSString *)ip;   //Your IP to Location
- (NSString *)ip_ip_address;  //IP to Location

//Exchange Rate
- (NSString *)exrate;   //Exchange Rate

- (NSString *)currencies;   //currencies

//BlockChain Data
- (NSString *)tx_txhash;   //BlockChain Transaction Data
- (NSString *)address_address;  //BlockChain Address Data

//Market List
- (NSString *)markets;  //Markets
- (NSString *)symbols;  //Symbols
- (NSString *)market_pairs; //MarketPairs;
- (NSString *)market_market;    // Market

//Market Data
- (NSString *)ticker;   //Market Ticker
- (NSString *)tickers;  //Market Tickers
- (NSString *)depth;    //Market Depth
- (NSString *)kline;    //Market Kline;
- (NSString *)price; //Price Index
- (NSString *)price_history;    //Price Index
- (NSString *)new_pairs; // New SymbolPairs
- (NSString *)trade;

- (NSString *) relativePath:(NSString *)api;
- (NSDictionary *) parameterNames:(NSString *)api;
@end
