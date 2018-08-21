//
//  BCApiManager.h
//  blockcc
//
//  Created by acekiller on 2018/8/21.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "BCApi.h"

@interface BCApiManager : NSObject

@property (nonatomic, strong, readonly) BCHTTPManager *httpManager;

+ (instancetype) blockcc;
- (instancetype)init NS_UNAVAILABLE;

- (RACSignal *) getDataWithApi:(NSString *)api;

@end
