//
//  SettingsCoordinator.m
//  CoordinatorKit-Demo
//
//  Created by zhangwen on 2018/1/2.
//  Copyright © 2018年 zhangwen. All rights reserved.
//

#import "SettingsCoordinator.h"
#import "SettingsViewController.h"
#import "LoginCoordinator.h"
#import "ProfileViewController.h"

@interface SettingsCoordinator () <SettingsViewControllerDelegate, LoginCoordinatorDelegate>

@end

@implementation SettingsCoordinator

- (void)start{
    SettingsViewController *vc = [[SettingsViewController alloc] initWithNibName:nil bundle:nil];
    vc.parentCoordinator = self;
    vc.delegate = self;
    
    [self.router setRootModule:vc hideNavigationBar:NO];
}

#pragma mark - SettingsViewControllerDelegate
- (void)didClickedLogin{
    NavigationRouter *router = [NavigationRouter createNewInstance];
    LoginCoordinator *loginCoordinator = [[LoginCoordinator alloc] initWithRouter:router];
    loginCoordinator.delegate = self;
    [self startChildCoordinator:loginCoordinator];
    [self.router presentModule:loginCoordinator animated:YES];
}

- (void)didClickedProfile{
    ProfileViewController *vc = [[ProfileViewController alloc] initWithNibName:nil bundle:nil];
    vc.parentCoordinator = self;
    vc.hidesBottomBarWhenPushed = YES;
    [self.router pushModule:vc animated:YES completion:nil];
}

#pragma mark - LoginCoordinatorDelegate

- (void)didLoginSuccessful:(LoginCoordinator *)coordinator{
    __weak SettingsCoordinator *weakSelf = self;
    [self.router dismissModuleWithAnimated:YES completion:^{
        [weakSelf stopChildCoordinator:coordinator];
    }];
}

- (void)cancelLogin:(LoginCoordinator *)coordinator{
    __weak SettingsCoordinator *weakSelf = self;
    [self.router dismissModuleWithAnimated:YES completion:^{
        [weakSelf stopChildCoordinator:coordinator];
    }];
}

@end
