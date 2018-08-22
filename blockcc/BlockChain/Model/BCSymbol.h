//
//  BCSymbol.h
//  blockcc
//
//  Created by fantasy on 2018/8/22.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCSymbol : NSObject  //币种
@property (nonatomic, strong) NSString *name;       //币种名称（ID）
@property (nonatomic, strong) NSString *symbol;       //币种符号
@property (nonatomic, assign) double volume_usd;       //交易量(USD)
@property (nonatomic, copy) NSArray *alias;       //其他符号列表
@property (nonatomic, strong) NSString *status;       //状态: [enable, disable]. disable为停止更新数据
@end
