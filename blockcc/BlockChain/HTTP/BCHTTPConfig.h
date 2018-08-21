//
//  BCHTTPConfig.h
//  blockcc
//
//  Created by acekiller on 2018/8/21.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BCHTTPConfig <NSObject>
- (NSString *) baseURL;
- (NSDictionary *)cookies;  //TODO:
- (NSDictionary *)headerFields;  //header fields
- (NSDictionary *)defaultParams;  //header fields
- (BOOL) isFormData;
- (id) cacaheData:(NSString *)url;  //用于获取缓存
- (void) updateCache:(id)cache forURL:(NSString *)url;  //用于缓存数据
@end
