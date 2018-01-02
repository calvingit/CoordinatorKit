//
//  FeedCoordinator.m
//  CoordinatorKit-Demo
//
//  Created by zhangwen on 2018/1/2.
//  Copyright © 2018年 zhangwen. All rights reserved.
//

#import "FeedCoordinator.h"
#import "FeedViewController.h"
#import "Feed.h"
#import <SafariServices/SafariServices.h>

@interface FeedCoordinator () <FeedViewControllerDelegate, SFSafariViewControllerDelegate>

@end

@implementation FeedCoordinator
- (void)start{
    FeedViewController *vc = [[FeedViewController alloc] initWithNibName:nil bundle:nil];
    vc.delegate = self;
    vc.parentCoordinator = self;
    
    [self.router setRootModule:vc hideNavigationBar:NO];
}


#pragma mark - FeedViewControllerDelegate
- (void)didClickedFeed:(Feed *)feed{
    SFSafariViewController *vc = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:feed.url]];
    vc.delegate = self;
    [self.router presentModule:vc animated:YES];
}

#pragma mark -

- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller{
    [self.router dismissModuleWithAnimated:YES completion:^{

    }];
}


@end
