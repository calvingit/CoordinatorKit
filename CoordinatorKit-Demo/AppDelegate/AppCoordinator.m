//
//  AppCoordinator.m
//  CoordinatorKit
//
//  Created by zhangwen on 2017/12/30.
//  Copyright © 2017年 zhangwen. All rights reserved.
//

#import "AppCoordinator.h"
#import "MainCoordinator.h"

@interface AppCoordinator ()

@end

@implementation AppCoordinator

- (void)start{
    MainCoordinator *mainCoordinator = [[MainCoordinator alloc] initWithRouter:[NavigationRouter createNewInstance]];
    [self startChildCoordinator:mainCoordinator];
    [self.router setRootModule:mainCoordinator];
}

@end
