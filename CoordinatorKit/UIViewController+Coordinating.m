//
//  UIViewController+Coordinating.m
//  CoordinatorKit
//
//  Created by zhangwen on 2017/12/30.
//  Copyright © 2017年 zhangwen. All rights reserved.
//

#import "UIViewController+Coordinating.h"
#import "NavigationCoordinator.h"
#import <objc/runtime.h>

static NSString *const kParentCoordinatorKey = @"kParentCoordinatorKey";

@implementation UIViewController (Coordinating)

- (NavigationCoordinator *)parentCoordinator{
    return objc_getAssociatedObject(self, &kParentCoordinatorKey);
}

- (void)setParentCoordinator:(NavigationCoordinator *)parentCoordinator{
    objc_setAssociatedObject(self, &kParentCoordinatorKey, parentCoordinator, OBJC_ASSOCIATION_ASSIGN);
}

- (UIResponder *)coordinatingResponder{
    /// 如果当前存在父Coordinator，立即返回；否则到父view controller里面找，或者view的 super view找。
    if (self.parentCoordinator) {
        return self.parentCoordinator;
    }
    
    if (self.parentViewController) {
        return self.parentViewController;
    }else{
        return self.view.superview;
    }
}

- (UIViewController *)presentableViewController{
    return self;
}

@end
