//
//  BCHTTPDefaultConfig.m
//  blockcc
//
//  Created by acekiller on 2018/8/21.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import "BCHTTPDefaultConfig.h"

@interface BCHTTPDefaultConfig ()
@property(nonatomic, strong) NSString *baseURL;
@end

@implementation BCHTTPDefaultConfig

- (instancetype)initWithBaseURL:(NSString *)baseURL {
    self = [super init];
    if (self) {
        self.baseURL = baseURL;
    }
    return self;
}

- (NSDictionary *)cookies {
    //    TODO:
    return nil;
}
- (NSDictionary *)headerFields {
    //    TODO:
    return nil;
}
- (NSDictionary *)defaultParams {
    //    TODO:
    return nil;
}
- (BOOL) isFormData {
    //    TODO:
    return YES;
}
- (id) cacaheData:(NSString *)url {
    //    TODO:
    return nil;
}
- (void) updateCache:(id)cache forURL:(NSString *)url {
    //    TODO:
}

@end
