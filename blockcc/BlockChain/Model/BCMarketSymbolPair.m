//
//  BCMarketSymbolPair.m
//  blockcc
//
//  Created by fantasy on 2018/8/22.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import "BCMarketSymbolPair.h"
#import <MJExtension/MJExtension.h>

@implementation BCMarketSymbolPair

- (NSDictionary *) pairJson {
    return [self mj_keyValues];
}

- (NSDictionary *) pairJson:(NSArray *)contains {
    if (contains.count <= 0) {
        return nil;
    }
    
    NSMutableDictionary *pairs = [[self pairJson] mutableCopy];
    NSArray *keys = pairs.allKeys;
    for (NSString *key in keys) {
        if (![contains containsObject:key]) {
            [pairs removeObjectForKey:key];
        }
    }
    return pairs;
}

@end
