//
//  blockccTests.m
//  blockccTests
//
//  Created by acekiller on 2018/8/21.
//  Copyright © 2018年 acekiller. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface blockccTests : XCTestCase

@end

@implementation blockccTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *urlPath = @"http://baidu.com/app/api/v1/address/{ip_address}/aflda";
    NSDictionary *parameters = @{@"ip_address" : @"abcdes"};
    NSString *pattern = @"\\{[a-z,_,A-Z,0-9]+\\}";
    NSError *error = nil;
    NSRegularExpression *regExp = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionAnchorsMatchLines error:&error];
    NSArray *checkResults = [regExp matchesInString:urlPath options:NSMatchingReportCompletion range:NSMakeRange(0, urlPath.length)];
    NSString *adapterURLStr = [NSString stringWithString:urlPath];
    for (NSTextCheckingResult *check in checkResults) {
        NSString *fetchText = [urlPath substringWithRange:check.range];
        NSString *key = [fetchText substringWithRange:NSMakeRange(1, fetchText.length - 2)];
        adapterURLStr = [adapterURLStr stringByReplacingOccurrencesOfString:fetchText withString:[parameters[key] description]];
    }
    NSLog(@"%@", adapterURLStr);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
