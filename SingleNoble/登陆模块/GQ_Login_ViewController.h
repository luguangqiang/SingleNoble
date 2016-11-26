//
//  GQ_Login_ViewController.h
//  SingleNoble
//
//  Created by Apple on 2016/11/19.
//  Copyright © 2016年 lu guangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GQ_LoginBackStyle) {
    GQ_LoginBackStyle_pop,
    GQ_LoginBackStyle_popToRoot,
    GQ_LoginBackStyle_dismiss,
    GQ_LoginBackStyle_dismissAndAction
};

typedef void(^GQ_LoginResult)(NSDictionary *dict);

@interface GQ_Login_ViewController : UIViewController

@property (nonatomic, assign) GQ_LoginBackStyle loginType;

@property (nonatomic, copy) GQ_LoginResult loginResult;

@property (nonatomic, assign) BOOL showBackButton;

@property (nonatomic, weak) UIViewController *positionVC;

-(void)hideLoginViewWithResult:(NSDictionary *)dict;

+(void)showLoginView:(void(^)(NSDictionary *dictionary))seccess andTarget:(UIViewController *)VC andBackType:(GQ_LoginBackStyle)style;

@end
