//
//  WindowCoordinator.m
//  CoordinatorKit
//
//  Created by zhangwen on 2018/1/1.
//  Copyright © 2018年 zhangwen. All rights reserved.
//

#import "WindowCoordinator.h"
#import "WindowRouter.h"

@interface WindowCoordinator ()
@property (nonatomic) WindowRouter *router;

@end

@implementation WindowCoordinator
- (instancetype)initWithWindowRouter:(WindowRouter *)router{
    if (self = [super init]) {
        _router = router;
    }
    return self;
}

@end
