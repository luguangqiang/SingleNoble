//
//  GQUser.h
//  SingleNoble
//
//  Created by Apple on 2016/11/26.
//  Copyright © 2016年 lu guangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GQUser : NSObject

@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *userid;

+(instancetype)user;

+(NSURLSessionTask *)loginWithUser:(GQUser *)user andResult:(void(^)(NSDictionary *result))result;

@end
