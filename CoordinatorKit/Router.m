//
//  Router.m
//  Coordinator-OC
//
//  Created by zhangwen on 2018/1/1.
//  Copyright © 2018年 zhangwen. All rights reserved.
//

#import "Router.h"

@interface Router () <UINavigationControllerDelegate>
@property (nonatomic) UINavigationController *navigationController;
@property (nonatomic) NSMutableDictionary *completions;
@end

@implementation Router
+ (instancetype)routerWithNewNavigationController{
    return [[Router alloc] initWithNavigationController:[[UINavigationController alloc] init]];
}

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController{
    if (self = [super init]) {
        _navigationController = navigationController;
        _navigationController.delegate = self;
        _completions = [NSMutableDictionary dictionary];
    }
    return self;
}

- (UIViewController *)rootViewController{
    return _navigationController.viewControllers.firstObject;
}

/// 垂直 flow
- (void)presentModule:(id<Presentable>)module animated:(BOOL)animated{
    [self.navigationController presentViewController:module.presentableViewController animated:animated completion:nil];
}

- (void)dismissModuleWithAnimated:(BOOL)animated completion:(RouterCompletion)completion{
    [_navigationController dismissViewControllerAnimated:animated completion:completion];
}

/// 水平 flow
- (void)pushModule:(id<Presentable>)module animated:(BOOL)animated completion:(RouterCompletion)completion{
    UIViewController *vc = module.presentableViewController;
    if (!vc) {
        return;
    }
    NSAssert(![vc isKindOfClass:[UINavigationController class]], @"Avoid pushing UINavigationController onto stack");
    if (completion) {
        [_completions setObject:completion forKey:@(vc.hash)];
    }
    
    [_navigationController pushViewController:vc animated:animated];
}

- (void)popModuleWithAnimated:(BOOL)animated{
    UIViewController *vc = [_navigationController popViewControllerAnimated:animated];
    if (vc) {
        [self runCompletionForViewController:vc];
    }
}

/// 修改 flow
- (void)setRootModule:(id<Presentable>)module hideNavigationBar:(BOOL)hideNavigationBar{
    for (RouterCompletion completion in _completions.allValues) {
        completion();
    }
    [_completions removeAllObjects];
    [_navigationController setViewControllers:@[module.presentableViewController] animated:NO];
    _navigationController.navigationBarHidden = hideNavigationBar;
}

- (void)popToRootModuleWithAnimated:(BOOL)animated{
    NSArray *viewControllers = [_navigationController popToRootViewControllerAnimated:animated];
    for(UIViewController *viewController in viewControllers){
        [self runCompletionForViewController:viewController];
    }
}

#pragma mark - Private Methods

- (void)runCompletionForViewController:(UIViewController *)viewController{
    RouterCompletion completion = [_completions objectForKey:@(viewController.hash)];
    if (completion) {
        completion();
        [_completions removeObjectForKey:@(viewController.hash)];
    }
}

#pragma mark - Presentable
- (UIViewController *)presentableViewController{
    return _navigationController;
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    UIViewController *fromViewController = [navigationController.transitionCoordinator viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (!fromViewController) {
        return;
    }
    
    if ([navigationController.viewControllers containsObject:fromViewController]) {
        return;
    }
    
    [self runCompletionForViewController:fromViewController];
}

@end
