//
//  LoginViewController.h
//  CoordinatorKit
//
//  Created by zhangwen on 2017/12/30.
//  Copyright © 2017年 zhangwen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginViewController;
@protocol LoginViewControllerDelegate <NSObject>
- (void)cancelLogin;
- (void)didLoginSuccessful;
- (void)didTapSignUpButton:(LoginViewController *)viewController;
@end

@interface LoginViewController : UIViewController
@property (nonatomic, weak) id<LoginViewControllerDelegate> delegate;
@end
