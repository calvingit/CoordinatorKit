//
//  Coordinator.h
//  Coordinator-OC
//
//  Created by zhangwen on 2018/1/1.
//  Copyright © 2018年 zhangwen. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol Coordinatable<NSObject>
@required

/**
 Tells the coordinator to create/display its initial view controller and take over the user flow.
 Use this method to configure your `rootViewController` (if it isn't already).
 Some examples:
 * instantiate and assign `viewControllers` for UINavigationController or UITabBarController
 * assign itself (Coordinator) as delegate for the shown UIViewController(s)
 
 To Be Overrided
 */
- (void)start;

/// call 'start' method of child coordinator, set it's parent, and add it to childCoordinators
- (void)startChildCoordinator:(id<Coordinatable>)coordinator;

/// remove child coordinator from childCoordinators
- (void)stopChildCoordinator:(id<Coordinatable>)coordinator;

@end

@class Coordinator;

@interface Coordinator:UIResponder <Coordinatable>

@property (nonatomic, weak, readonly) Coordinator *parent;
@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy, readonly) NSArray *childCoordinators;

@end

