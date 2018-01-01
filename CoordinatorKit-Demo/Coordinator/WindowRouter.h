//
//  WindowRouter.h
//  Coordinator-OC
//
//  Created by zhangwen on 2018/1/1.
//  Copyright © 2018年 zhangwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Presentable.h"

@interface WindowRouter : NSObject

@property (nonatomic, weak, readonly) UIWindow *window;

- (instancetype)initWithWindow:(UIWindow *)window;

- (void)setRootModule:(id <Presentable>)module;

@end
