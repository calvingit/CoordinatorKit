//
//  SignUpCoordinator.m
//  CoordinatorKit
//
//  Created by zhangwen on 2017/12/31.
//  Copyright © 2017年 zhangwen. All rights reserved.
//

#import "SignUpCoordinator.h"
#import "SignUpViewController.h"

@interface SignUpCoordinator ()
@property (nonatomic) SignUpViewController *signUpViewController;
@end

@implementation SignUpCoordinator

- (void)start{

}

- (UIViewController *)presentableViewController{
    return self.signUpViewController;
}

// 如果这里拦截了消息传递方法，loginCoordinator将无法收到
//- (void)coordinateMessageName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo{
//    NSLog(@"%@: %@  %@  %@", self, name, object, userInfo);
//}

- (SignUpViewController *)signUpViewController{
    if(!_signUpViewController){
        _signUpViewController = [[SignUpViewController alloc] initWithNibName:nil bundle:nil];
        _signUpViewController.parentCoordinator = self;
    }
    return _signUpViewController;
}


@end
