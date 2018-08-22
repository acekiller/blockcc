//
//  BCLocation.h
//  blockcc
//
//  Created by fantasy on 2018/8/22.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface BCLocation : NSObject
@property (nonatomic, strong) NSString *ip;     //当前查询的IP
@property (nonatomic, strong) NSString *country_code;     //国家代码
@property (nonatomic, strong) NSString *country_name;     //国家全称
@property (nonatomic, strong) NSString *region_name;     //省/州 名称
@property (nonatomic, strong) NSString *city_name;     //城市名称
@property (nonatomic, assign) CLLocationDegrees latitude;     //纬度
@property (nonatomic, assign) CLLocationDegrees longitude;     //经度
@property (nonatomic, strong) NSString *zip_code;     //邮政编码
@property (nonatomic, strong) NSString *time_zone;     //时区
@end
