//
//  BCApi.m
//  blockcc
//
//  Created by acekiller on 2018/8/22.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import "BCApi.h"

@interface BCApi ()
@end

@implementation BCApi
{
    NSDictionary *apis;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        apis = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"BCApi" ofType:@"plist"]];
    }
    return self;
}

- (NSString *) relativePath:(NSString *)api {
    NSString *relativePath = [apis valueForKey:@"api"];
    NSAssert(relativePath, @"api can not null");
    return relativePath;
}

- (NSString *)ip {
    return [self url:NSStringFromSelector(_cmd)];
}

- (NSString *)ip_ip_address {
    return [self url:NSStringFromSelector(_cmd)];
}

//Exchange Rate
- (NSString *)exrate {
    return [self url:NSStringFromSelector(_cmd)];
}

//BlockChain Data
- (NSString *)tx_txhash {
    return [self url:NSStringFromSelector(_cmd)];
}
- (NSString *)address_address {
    return [self url:NSStringFromSelector(_cmd)];
}

//Market List
- (NSString *)markets {
    return [self url:NSStringFromSelector(_cmd)];
}
- (NSString *)symbols {
    return [self url:NSStringFromSelector(_cmd)];
}
- (NSString *)market_pairs {
    return [self url:NSStringFromSelector(_cmd)];
}
- (NSString *)market_market {
    return [self url:NSStringFromSelector(_cmd)];
}

//Market Data
- (NSString *)ticker {
    return [self url:NSStringFromSelector(_cmd)];
}
- (NSString *)tickers {
    return [self url:NSStringFromSelector(_cmd)];
}
- (NSString *)depth {
    return [self url:NSStringFromSelector(_cmd)];
}
- (NSString *)kline {
    return [self url:NSStringFromSelector(_cmd)];
}
- (NSString *)price {
    return [self url:NSStringFromSelector(_cmd)];
}
- (NSString *)price_history {
    return [self url:NSStringFromSelector(_cmd)];
}
- (NSString *)new_pairs {
    return [self url:NSStringFromSelector(_cmd)];
}

@end
