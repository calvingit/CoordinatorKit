//
//  SettingsViewController.m
//  CoordinatorKit-Demo
//
//  Created by zhangwen on 2018/1/2.
//  Copyright © 2018年 zhangwen. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"设置";
    
    UIBarButtonItem *profileItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(goToPrifile)];
    self.navigationItem.rightBarButtonItem = profileItem;
    
}

- (void)goToPrifile{
    [self.delegate didClickedProfile];
}

- (IBAction)login:(id)sender {
    if ([self.delegate respondsToSelector:@selector(didClickedLogin)]) {
        [self.delegate didClickedLogin];
    }
}

@end
