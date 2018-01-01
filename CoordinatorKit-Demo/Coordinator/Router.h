//
//  Router.h
//  Coordinator-OC
//
//  Created by zhangwen on 2018/1/1.
//  Copyright © 2018年 zhangwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Routable.h"
#import "Presentable.h"
/**
 路由，管理导航流
 */
@interface Router : NSObject<Routable>

//@property (nonatomic, readonly) UINavigationController *navigationController;
//@property (nonatomic, readonly) UIViewController *rootViewController;
//
///// 垂直 flow
//- (void)presentModule:(id<Presentable>)module animated:(BOOL)animated;
//- (void)dismissModuleWithAnimated:(BOOL)animated completion:(void(^)(void))completion;
//
///// 水平 flow
//- (void)pushModule:(id<Presentable>)module animated:(BOOL)animated;
//- (void)popModuleWithAnimated:(BOOL)animated;
//
///// 修改 flow
//- (void)setRootModule:(id<Presentable>)module hideNavigationBar:(BOOL)hideNavigationBar;
//- (void)popToRootModuleWithAnimated:(BOOL)animated;

@end
