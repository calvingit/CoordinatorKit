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
    MainCoordinator *mainCoordinator = [[MainCoordinator alloc] init];
    [self startChildCoordinator:mainCoordinator];
    [self.router setRootModule:mainCoordinator];
}

@end
