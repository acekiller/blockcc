//
//  BCRequstPairs.h
//  blockcc
//
//  Created by fantasy on 2018/8/23.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BCRequstPairs <NSObject>

- (NSDictionary *) pairJson;
- (NSDictionary *) pairJson:(NSArray *)contains;

@end

@interface BCRequstPairs : NSObject <BCRequstPairs>

@end
