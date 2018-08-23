//
//  BCIPRequestPair.h
//  blockcc
//
//  Created by fantasy on 2018/8/23.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BCRequstPairs.h"

@interface BCIPRequestPair : NSObject <BCRequstPairs>
@property (nonatomic, strong) NSString *ip_address;
@end
