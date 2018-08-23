//
//  BCTickerPage.m
//  blockcc
//
//  Created by fantasy on 2018/8/23.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import "BCTickerPage.h"
#import <MJExtension/MJExtension.h>

@implementation BCTickerPage

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"list" : NSStringFromClass([BCTicker class])};
}

@end
