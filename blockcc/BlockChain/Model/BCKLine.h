//
//  BCKLine.h
//  blockcc
//
//  Created by fantasy on 2018/8/22.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCKLine : NSObject
- (instancetype) initWithIndexArray:(NSArray *)array;
@property (nonatomic, assign) long long timestamp;
@property (nonatomic, assign) double open;
@property (nonatomic, assign) double close;
@property (nonatomic, assign) double low;
@property (nonatomic, assign) double high;
@property (nonatomic, assign) double volume;
@end
