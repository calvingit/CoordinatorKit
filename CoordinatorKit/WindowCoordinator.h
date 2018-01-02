//
//  WindowCoordinator.h
//  CoordinatorKit
//
//  Created by zhangwen on 2018/1/1.
//  Copyright © 2018年 zhangwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinator.h"

@class WindowRouter;

@interface WindowCoordinator : Coordinator

@property (nonatomic, readonly) WindowRouter *router;

- (instancetype)initWithWindowRouter:(WindowRouter *)router;

@end
