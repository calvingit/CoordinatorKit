//
//  LoginViewController.m
//  CoordinatorKit
//
//  Created by zhangwen on 2017/12/30.
//  Copyright © 2017年 zhangwen. All rights reserved.
//

#import "LoginViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"登录";
    
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelLogin)];
    self.navigationItem.leftBarButtonItem = cancel;
}

- (void)cancelLogin{
    [self.delegate cancelLogin];
}

- (IBAction)signUp:(id)sender {
    [self.delegate didTapSignUpButton:self];
}



@end
