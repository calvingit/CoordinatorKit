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

/// 垂直导航，创建一个新的导航管理器
+ (instancetype)routerWithNewNavigationController;

/// 水平导航，共享一个导航管理器
- (instancetype)initWithNavigationController:(UINavigationController *)navigationController;

@end
