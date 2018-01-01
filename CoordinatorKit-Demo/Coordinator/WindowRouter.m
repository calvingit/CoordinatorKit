//
//  WindowRouter.m
//  Coordinator-OC
//
//  Created by zhangwen on 2018/1/1.
//  Copyright © 2018年 zhangwen. All rights reserved.
//

#import "WindowRouter.h"

@interface WindowRouter ()
@property (nonatomic, weak) UIWindow *window;
@end

@implementation WindowRouter
- (instancetype)initWithWindow:(UIWindow *)window{
    if (self = [super init]) {
        _window = window;
    }
    return self;
}

- (void)setRootModule:(id <Presentable>)module{
    _window.rootViewController = module.presentableViewController;
}


@end
