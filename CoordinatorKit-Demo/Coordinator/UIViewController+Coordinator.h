//
//  UIViewController+Coordinator.h
//  Coordinator-OC
//
//  Created by zhangwen on 2017/12/30.
//  Copyright © 2017年 zhangwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Presentable.h"

@class Coordinator;

@interface UIViewController (Coordinator)

@property (weak, nonatomic) Coordinator *parentCoordinator;

@end
