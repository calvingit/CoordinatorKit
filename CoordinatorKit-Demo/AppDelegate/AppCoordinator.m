//
//  AppCoordinator.m
//  Coordinator-OC
//
//  Created by zhangwen on 2017/12/30.
//  Copyright © 2017年 zhangwen. All rights reserved.
//

#import "AppCoordinator.h"
#import "LoginCoordinator.h"

@interface AppCoordinator ()
@property (nonatomic) WindowRouter *router;
@end

@implementation AppCoordinator
- (instancetype)initWithWindowRouter:(WindowRouter *)router{
    if (self = [super init]) {
        _router = router;
    }
    return self;
}


- (void)start{
    UINavigationController *nav = [[UINavigationController alloc] init];
    Router *loginRouter = [[Router alloc] initWithNavigationController:nav];
    LoginCoordinator *loginCoordinator = [[LoginCoordinator alloc] initWithRouter:loginRouter];
    [self.router setRootModule:loginCoordinator];
    [self startChildCoordinator:loginCoordinator];
}

@end
