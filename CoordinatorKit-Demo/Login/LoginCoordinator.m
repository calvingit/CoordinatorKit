//
//  LoginCoordinator.m
//  Coordinator-OC
//
//  Created by zhangwen on 2017/12/30.
//  Copyright © 2017年 zhangwen. All rights reserved.
//

#import "LoginCoordinator.h"
#import "LoginViewController.h"
#import "SignUpCoordinator.h"

@interface LoginCoordinator ()<LoginViewControllerDelegate>

@end

@implementation LoginCoordinator

- (void)start{
    LoginViewController *vc = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
    vc.delegate = self;
    vc.parentCoordinator = self;
    
    [self.router pushModule:vc animated:YES completion:nil];
}

#pragma mark - LoginViewControllerDelegate

- (void)didTapSignUpButton:(LoginViewController *)viewController{
    SignUpCoordinator *coordinator = [[SignUpCoordinator alloc] initWithRouter:self.router];
    __weak LoginCoordinator *weakSelf = self;
    [self.router pushModule:coordinator animated:YES completion:^{
        NSLog(@"Releasing %@", coordinator);
        [weakSelf stopChildCoordinator:coordinator];
    }];
    [self startChildCoordinator:coordinator];
}


- (void)coordinateMessageName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo{
    NSLog(@"%@: %@  %@  %@", self, name, object, userInfo);
}


@end
