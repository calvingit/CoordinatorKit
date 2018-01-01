//
//  SignUpViewController.m
//  Coordinator-OC
//
//  Created by zhangwen on 2017/12/30.
//  Copyright © 2017年 zhangwen. All rights reserved.
//

#import "SignUpViewController.h"

@import CoordinatorKit;

#define kCoordinatingMessageForTest @"kCoordinatingMessageForTest"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"注册";


}


- (IBAction)targetAction:(id)sender {
    [self.parentCoordinator coordinateMessageName:kCoordinatingMessageForTest object:@"Test" userInfo:@{@"user": @"Info"}];
}

@end
