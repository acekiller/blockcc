//
//  BCKLine.m
//  blockcc
//
//  Created by fantasy on 2018/8/22.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import "BCKLine.h"

@implementation BCKLine

- (instancetype) initWithIndexArray:(NSArray *)array {
    self = [super init];
    if (self) {
        self.timestamp = [array[0] longLongValue];
        self.open = [array[1] doubleValue];
        self.close = [array[2] doubleValue];
        self.low = [array[3] doubleValue];
        self.high = [array[4] doubleValue];
        self.volume = [array[5] doubleValue];
    }
    return self;
}

@end
