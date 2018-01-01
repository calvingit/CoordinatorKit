//
//  UIViewController+Presentable.h
//  Coordinator-OC
//
//  Created by zhangwen on 2018/1/1.
//  Copyright © 2018年 zhangwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Presentable.h"
@interface UIViewController (Presentable) <Presentable>
- (UIViewController *)presentableViewController;
@end
