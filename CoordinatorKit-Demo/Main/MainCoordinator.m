//
//  MainCoordinator.m
//  CoordinatorKit
//
//  Created by zhangwen on 2017/12/30.
//  Copyright © 2017年 zhangwen. All rights reserved.
//
#import "MainCoordinator.h"
#import "FeedCoordinator.h"
#import "SettingsCoordinator.h"

@interface MainCoordinator ()<UITabBarControllerDelegate>

@property (nonatomic) UITabBarController *tabBarController;

@end

@implementation MainCoordinator

- (instancetype)init{
    if (self = [super init]) {
        _tabBarController = [[UITabBarController alloc] init];
        _tabBarController.delegate = self;
    }
    return self;
}

- (void)start{
    UINavigationController *feedNav = [UINavigationController new];
    feedNav.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:0];
    FeedCoordinator *feedCoordinator = [[FeedCoordinator alloc] initWithRouter:[[NavigationRouter alloc] initWithNavigationController:feedNav]];
    [self startChildCoordinator:feedCoordinator];
    
    
    UINavigationController *settingsNav = [UINavigationController new];
    settingsNav.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
    SettingsCoordinator *settingsCoordinator = [[SettingsCoordinator alloc] initWithRouter:[[NavigationRouter alloc] initWithNavigationController:settingsNav]];
    [self startChildCoordinator:settingsCoordinator];
    
    self.tabBarController.viewControllers = @[feedCoordinator.presentableViewController,
                                             settingsCoordinator.presentableViewController];
    self.tabBarController.selectedIndex = 0;
}

- (UIViewController *)presentableViewController{
    return _tabBarController;
}




@end
