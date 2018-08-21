//
//  BCHTTPManager.m
//  blockcc
//
//  Created by acekiller on 2018/8/21.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import "BCHTTPManager.h"

@implementation BCHTTPManager

+ (instancetype)http {
    static id _instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        //
    }
    return self;
}

@end
