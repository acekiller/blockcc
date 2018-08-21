//
//  BCHTTPDefaultConfig.h
//  blockcc
//
//  Created by acekiller on 2018/8/21.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BCHTTPConfig.h"

@interface BCHTTPDefaultConfig : NSObject <BCHTTPConfig>
- (instancetype)initWithBaseURL:(NSString *) baseURL;

@end
