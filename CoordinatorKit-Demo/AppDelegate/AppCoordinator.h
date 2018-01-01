//
//  AppCoordinator.h
//  Coordinator-OC
//
//  Created by zhangwen on 2017/12/30.
//  Copyright © 2017年 zhangwen. All rights reserved.
//
#import <Foundation/Foundation.h>
@import CoordinatorKit;

@interface AppCoordinator : WindowCoordinator
- (instancetype)initWithWindowRouter:(WindowRouter *)router;
@end
