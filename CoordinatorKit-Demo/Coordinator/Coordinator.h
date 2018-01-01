//
//  Coordinator.h
//  Coordinator-OC
//
//  Created by zhangwen on 2017/12/30.
//  Copyright © 2017年 zhangwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIResponder+CoordinatingResponder.h"
#import "Coordinatable.h"
#import "Router.h"

/*
 Coordinators are a design pattern that encourages decoupling view controllers
 such that they know as little as possible about how they are presented.
 
 As such, view controllers should never directly push/pop or present other VCs.
 They should either use:
 1. Delegate pattern to indicate such action is needed and owning Coordinator will assign itself delegate
 2. Specific closures that owning Coordinator will populate and thus respond to
 3. Custom actions implemented using `targetViewController(for:sender:)` API
 
 Coordinators can be “nested” such that child coordinators encapsulate different flows
 and prevent any one of them from becoming too large.
 
 Each coordinator has an identifier to simplify logging and debugging.
 Identifier is also used as key for the childCoordinators dictionary
 
 You can either use Coordinator instances directly or – far more likely –
 subclass them to add specific behavior for the given particular usage.
 
 Note: Don't overthink this. Idea is to have fairly small number of coordinators in the app.
 If you embed controllers into other VC (thus using them as simple UI components),
 then keep that flow inside the given container controller.
 Expose to Coordinator only those behaviors that cause push/pop/present to bubble up
 */



@interface Coordinator : UIResponder <Routable>

@property (nonatomic, copy, readonly) NSString *identifier;

@property (nonatomic, weak) Coordinator *parent;

- (instancetype)initWithRouter:(id<Routable>)router;

/**
 Tells the coordinator to create/display its initial view controller and take over the user flow.
    Use this method to configure your `rootViewController` (if it isn't already).
    Some examples:
    * instantiate and assign `viewControllers` for UINavigationController or UITabBarController
    * assign itself (Coordinator) as delegate for the shown UIViewController(s)
 
 To Be Overrided
 */
- (void)start;

/// Adds new child coordinator and starts it.
- (void)startChildCoordinator:(Coordinator *)coordinator;

///Stops the given child coordinator and removes it from the `childCoordinators` buffer
- (void)stopChildCoordinator:(Coordinator *)coordinator;

@end
