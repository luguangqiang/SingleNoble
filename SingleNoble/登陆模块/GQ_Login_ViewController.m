//
//  GQ_Login_ViewController.m
//  SingleNoble
//
//  Created by Apple on 2016/11/19.
//  Copyright © 2016年 lu guangqiang. All rights reserved.
//

#import "GQ_Login_ViewController.h"

@interface GQ_Login_ViewController ()

@end

@implementation GQ_Login_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)hideLoginViewWithResult:(NSDictionary *)dict{
    if (self.loginType==GQ_LoginBackStyle_pop) {
        if (self.positionVC) {
            [self.navigationController popToViewController:self.positionVC animated:YES];
        }else{
            [self.navigationController popViewControllerAnimated:YES];
        }
        if (self.loginResult) {
            self.loginResult(dict);
        }
    }else if (self.loginType==GQ_LoginBackStyle_popToRoot){
        [self.navigationController popToRootViewControllerAnimated:YES];
    }else if (self.loginType==GQ_LoginBackStyle_dismiss){
        [self dismissViewControllerAnimated:YES completion:^{
            if (self.loginResult) {
                self.loginResult(dict);
            }
        }];
    }else{
        //默认为：GQ_LoginBackStyle_dismissAndAction
        [self dismissViewControllerAnimated:YES completion:^{
            if (self.loginResult) {
                self.loginResult(dict);
            }
        }];
    }
}

+(void)showLoginView:(void(^)(NSDictionary *dictionary))seccess andTarget:(UIViewController *)VC andBackType:(GQ_LoginBackStyle)style{
    
    GQ_Login_ViewController *login=[[GQ_Login_ViewController alloc] init];
    login.loginType=style;
    login.loginResult=^(NSDictionary *result){
        if (seccess) {
            seccess(result);
        }
    };
    if (style==GQ_LoginBackStyle_pop||style==GQ_LoginBackStyle_popToRoot) {
        login.positionVC=VC;
        [VC.navigationController pushViewController:login animated:YES];
    }else{
        UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:login];
        nav.navigationBarHidden=YES;
        [VC presentViewController:nav animated:YES completion:^{
            
        }];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
