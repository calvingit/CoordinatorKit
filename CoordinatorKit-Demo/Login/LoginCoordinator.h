//
//  LoginCoordinator.h
//  CoordinatorKit
//
//  Created by zhangwen on 2017/12/30.
//  Copyright © 2017年 zhangwen. All rights reserved.
//

@import CoordinatorKit;

@class LoginCoordinator;

@protocol LoginCoordinatorDelegate <NSObject>
- (void)cancelLogin:(LoginCoordinator *)coordinator;
- (void)didLoginSuccessful:(LoginCoordinator *)coordinator;
@end

@interface LoginCoordinator : NavigationCoordinator
@property (nonatomic, weak) id<LoginCoordinatorDelegate> delegate;
@end
