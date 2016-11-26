//
//  GQhttp.m
//  SingleNoble
//
//  Created by Apple on 2016/11/26.
//  Copyright © 2016年 lu guangqiang. All rights reserved.
//

#import "GQhttp.h"

@implementation GQhttp

+(instancetype)network{
    static GQhttp *currentWork;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        currentWork=[[GQhttp alloc] initWithBaseURL:[NSURL URLWithString:@""]];
        currentWork.securityPolicy=[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    return currentWork;
}

@end
