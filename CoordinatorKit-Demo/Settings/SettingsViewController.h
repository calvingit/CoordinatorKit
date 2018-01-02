//
//  SettingsViewController.h
//  CoordinatorKit-Demo
//
//  Created by zhangwen on 2018/1/2.
//  Copyright © 2018年 zhangwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SettingsViewControllerDelegate <NSObject>
- (void)didClickedLogin;
@end

@interface SettingsViewController : UIViewController
@property (nonatomic, weak) id <SettingsViewControllerDelegate> delegate;
@end
