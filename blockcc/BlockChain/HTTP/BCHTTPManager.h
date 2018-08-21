//
//  BCHTTPManager.h
//  blockcc
//
//  Created by acekiller on 2018/8/21.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "BCHTTPConfig.h"

typedef void(^CompletionHandle)(NSURLSessionTask *, id);
typedef void(^FailureHandle)(NSURLSessionTask *, NSError *);


@interface BCHTTPManager : NSObject
@property (nonatomic, strong, class) id<BCHTTPConfig> config;
@property (nonatomic, strong) id<BCHTTPConfig> config;
+ (instancetype) http;
- (instancetype)init NS_UNAVAILABLE;

//urlPath可以为相对路径，也可为绝对路径，若为相对路径将依赖于config配置的路径信息.
- (RACSignal *)getRequest:(NSString *)urlPath parameters:(NSDictionary *)parameters;

@end
