//
//  BCHTTPManager.m
//  blockcc
//
//  Created by acekiller on 2018/8/21.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import "BCHTTPManager.h"
#import <AFNetworking/AFNetworking.h>
#import "BCHTTPDefaultConfig.h"

@interface BCHTTPManager ()
@property (nonatomic, strong, readonly) AFHTTPSessionManager *manager;
@end

static id<BCHTTPConfig> httpConfig = nil;
@implementation BCHTTPManager

@dynamic config;
@synthesize manager=_manager;

+ (void)setConfig:(id<BCHTTPConfig>)config {
    httpConfig = config;
}

+ (id<BCHTTPConfig>)config {
    return httpConfig;
}

+ (instancetype)http {
    static id _instance = nil;
    static dispatch_once_t once;
    NSAssert([self config], @"config must be set");
    dispatch_once(&once, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (AFHTTPSessionManager *)manager {
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
        
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [_manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        _manager.requestSerializer.timeoutInterval = 20.;
        [_manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        [_manager.requestSerializer setValue:@"application/x-www-form-urlencoded;application/json" forHTTPHeaderField:@"Content-Type"];
        _manager.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithObjects:@"GET", @"POST", nil];
    }
    return _manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.config = [[self class] config];
    }
    return self;
}

- (NSURLSessionDataTask *)getRequestWithURLPath:(NSString *)urlPath parameters:(NSDictionary *)parameters success:(CompletionHandle)completion failure:(FailureHandle)failure {
    NSString *urlStr = urlPath;
    if (![self isFullUrl:urlPath]) {
        urlStr = [[[self class].config baseURL] stringByAppendingPathComponent:urlPath];
    }
    urlStr = [self adapterURLPath:urlStr parameters:parameters];
    NSDictionary *filteredParameters = [self ignoreRestfulParameters:parameters forUrlPath:urlPath];
    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];;
    return [self.manager GET:urlStr parameters:filteredParameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completion ? completion(task, responseObject) : nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure ? failure(task, error) : nil;
    }];
}

- (BOOL) isFullUrl:(NSString *)url {
    return [url hasPrefix:@"http"] || [url hasPrefix:@"file:"];
}

- (RACSignal *)getRequest:(NSString *)urlPath parameters:(NSDictionary *)parameters {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        id cache = [self.config cacaheData:urlPath];
        if (cache) {
            [subscriber sendNext:cache];
        }
        [self getRequestWithURLPath:urlPath parameters:parameters
                            success:^(NSURLSessionTask *task, id data) {
                                [self.config updateCache:data forURL:urlPath];
                                [subscriber sendNext:data];
                                [subscriber sendCompleted];
                            }
                            failure:^(NSURLSessionTask *task, NSError *error) {
                                [subscriber sendError:error];
                            }];
        return [RACDisposable disposableWithBlock:^{}];
    }];
}

- (NSDictionary *)ignoreRestfulParameters:(NSDictionary *)parameters forUrlPath:(NSString *)urlPath {
    NSString *pattern = @"\\{[a-z,_,A-Z,0-9]+\\}";
    NSError *error = nil;
    NSRegularExpression *regExp = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionAnchorsMatchLines error:&error];
    NSArray *checkResults = [regExp matchesInString:urlPath options:NSMatchingReportCompletion range:NSMakeRange(0, urlPath.length)];
    NSMutableDictionary *dic = [parameters mutableCopy];
    for (NSTextCheckingResult *check in checkResults) {
        NSString *fetchText = [urlPath substringWithRange:check.range];
        NSString *key = [fetchText substringWithRange:NSMakeRange(1, fetchText.length - 2)];
        [dic removeObjectForKey:key];
    }
    return dic;
}

- (NSString *)restfulAdapter:(NSString *)urlPath parameters:(NSDictionary *)parameters {
    NSString *pattern = @"\\{[a-z,_,A-Z,0-9]+\\}";
    NSError *error = nil;
    NSRegularExpression *regExp = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionAnchorsMatchLines error:&error];
    NSArray *checkResults = [regExp matchesInString:urlPath options:NSMatchingReportCompletion range:NSMakeRange(0, urlPath.length)];
    NSString *adapterURLStr = [NSString stringWithString:urlPath];
    for (NSTextCheckingResult *check in checkResults) {
        NSString *fetchText = [urlPath substringWithRange:check.range];
        NSString *key = [fetchText substringWithRange:NSMakeRange(1, fetchText.length - 2)];
        adapterURLStr = [adapterURLStr stringByReplacingOccurrencesOfString:fetchText withString:[parameters[key] description]];
    }
    return adapterURLStr;
}

@end
