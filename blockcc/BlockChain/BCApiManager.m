//
//  BCApiManager.m
//  blockcc
//
//  Created by acekiller on 2018/8/21.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import "BCApiManager.h"
#import "BCHTTPManager.h"
#import "BCHTTPDefaultConfig.h"

#define BCHTTPBASEURL @"https://data.block.cc/api/v1"

@interface BCApiManager ()

@end

@implementation BCApiManager

@synthesize httpManager=_httpManager;

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

@end
