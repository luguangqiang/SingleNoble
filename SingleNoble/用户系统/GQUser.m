//
//  GQUser.m
//  SingleNoble
//
//  Created by Apple on 2016/11/26.
//  Copyright © 2016年 lu guangqiang. All rights reserved.
//

#import "GQUser.h"
#import "GQhttp.h"
@implementation GQUser

+(instancetype)user{
    static GQUser *currentUser;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        currentUser=[[self alloc] init];
    });
    return currentUser;
}

+(NSURLSessionTask *)loginWithUser:(GQUser *)user andResult:(void(^)(NSDictionary *result))result{
    NSDictionary *sendDict=@{@"name":user.name,
                             @"pwd":user.password};
    return [[GQhttp network] POST:@"aaa/bbb/ccc"
                       parameters:sendDict
                         progress:nil
                          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                              NSLog(@"%@",responseObject);
                              if (result) {
                                  result(@{@"title":@"返回成功"});
                              }
    }
                          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                              NSLog(@"%@",error.domain);
    }];
}

@end
