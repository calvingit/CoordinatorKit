//
//  Coordinator.m
//  CoordinatorKit
//
//  Created by zhangwen on 2018/1/1.
//  Copyright © 2018年 zhangwen. All rights reserved.
//

#import "Coordinator.h"
#import "UIResponder+Coordinating.h"
#import "UIViewController+Coordinating.h"

@interface Coordinator ()
@property (nonatomic, weak, readwrite) Coordinator *parent;
@property (nonatomic, copy, readwrite) NSString *identifier;
@property (nonatomic) NSMutableDictionary *childCoordinatorContainer;
@end

@implementation Coordinator
- (NSString *)identifier{
    if (!_identifier) {
        _identifier = NSStringFromClass([self class]);
    }
    return _identifier;
}

- (NSArray *)childCoordinators{
    return [_childCoordinatorContainer allValues];
}

- (void)start{
    NSAssert(NO, @"%@ not implementated '-(void)start'", [self class]);
}

- (void)startChildCoordinator:(Coordinator *)coordinator{
    [self.childCoordinatorContainer setObject:coordinator forKey:coordinator.identifier];
    coordinator.parent = self;
    [coordinator start];
}

- (void)stopChildCoordinator:(Coordinator *)coordinator{
    coordinator.parent = nil;
    [self.childCoordinatorContainer removeObjectForKey:coordinator.identifier];
}

- (NSMutableDictionary *)childCoordinatorContainer{
    if (!_childCoordinatorContainer) {
        _childCoordinatorContainer = [NSMutableDictionary dictionary];
    }
    return _childCoordinatorContainer;
}

- (UIResponder *)coordinatingResponder{
    return self.parent;
}

@end
