//
//  BCMarketPair.h
//  blockcc
//
//  Created by fantasy on 2018/8/22.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCMarketPair : NSObject    //交易所以及支持的交易对列表
@property (nonatomic, strong) NSString *name;       //交易所名称(ID)
@property (nonatomic, strong) NSString *display_name;       //交易所显示名称
@property (nonatomic, strong) NSString *home_url;       //交易所链接
@property (nonatomic, copy) NSArray *symbol_pairs;       //该交易所支持的交易对列表
@property (nonatomic, copy) NSArray *base_currencies;       //该交易所支持的币种列表
@end
