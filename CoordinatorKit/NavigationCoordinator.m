//
//  Coordinator.m
//  CoordinatorKit
//
//  Created by zhangwen on 2017/12/30.
//  Copyright © 2017年 zhangwen. All rights reserved.
//

#import "NavigationCoordinator.h"
#import "NavigationRouter.h"
#import "UIResponder+Coordinating.h"

@interface NavigationCoordinator ()
@property (nonatomic) NavigationRouter *router;
@end

@implementation NavigationCoordinator

- (instancetype)initWithRouter:(NavigationRouter *)router{
    if (self = [super init]) {
        _router = router;
    }
    
    return self;
}

#pragma mark - Presentable
- (UIViewController *)presentableViewController{
    return _router.presentableViewController;
}

#pragma mark - Lazy properties

@end
