//
//  Coordinator.m
//  Coordinator-OC
//
//  Created by zhangwen on 2017/12/30.
//  Copyright © 2017年 zhangwen. All rights reserved.
//

#import "Coordinator.h"
#import "UIResponder+CoordinatingResponder.h"

@interface Coordinator ()
@property (nonatomic) id<Routable> router;
@property (nonatomic, copy, readwrite) NSString *identifier;
@property (nonatomic) NSMutableArray *childCoordinators;
@end

@implementation Coordinator

- (instancetype)initWithRouter:(id<Routable>)router{
    if (self = [super init]) {
        _router = router;
    }
    
    return self;
}


- (void)start{
    NSAssert(NO, @"Need to be overrided");
}

- (void)startChildCoordinator:(Coordinator *)coordinator{
    [self.childCoordinators addObject:coordinator];
    coordinator.parent = self;
    [coordinator start];
}

- (void)stopChildCoordinator:(Coordinator *)coordinator{
    coordinator.parent = nil;
    [self.childCoordinators removeObject:coordinator];
}

- (NSDictionary *)allChildCoordinators{
    return [_childCoordinators copy];
}

#pragma mark - Presentable
- (UIViewController *)presentableViewController{
    return _router.presentableViewController;
}

#pragma mark - Default Method
- (UIResponder *)coordinatingResponder{
    return self.parent;
}

#pragma mark - Lazy properties
- (NSString *)identifier{
    if (!_identifier) {
        _identifier = NSStringFromClass([self class]);
    }
    return _identifier;
}

- (NSMutableArray *)childCoordinators{
    if (!_childCoordinators) {
        _childCoordinators = [NSMutableArray array];
    }
    return _childCoordinators;
}


@end
