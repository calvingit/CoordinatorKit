//
//  Routable.h
//  Coordinator-OC
//
//  Created by zhangwen on 2018/1/1.
//  Copyright © 2018年 zhangwen. All rights reserved.
//

#ifndef Routable_h
#define Routable_h

#import <Foundation/Foundation.h>
#import "Presentable.h"

typedef void(^RouterCompletion)(void);

/// Routable 协议
@protocol Routable <Presentable>
@required

@property (nonatomic, readonly) UINavigationController *navigationController;
@property (nonatomic, readonly) UIViewController *rootViewController;

/// 垂直 flow
- (void)presentModule:(id<Presentable>)module animated:(BOOL)animated;
- (void)dismissModuleWithAnimated:(BOOL)animated completion:(RouterCompletion)completion;

/// 水平 flow
- (void)pushModule:(id<Presentable>)module animated:(BOOL)animated completion:(RouterCompletion)completion;
- (void)popModuleWithAnimated:(BOOL)animated;

/// 修改 flow
- (void)setRootModule:(id<Presentable>)module hideNavigationBar:(BOOL)hideNavigationBar;
- (void)popToRootModuleWithAnimated:(BOOL)animated;

@end


#endif /* Routable_h */
