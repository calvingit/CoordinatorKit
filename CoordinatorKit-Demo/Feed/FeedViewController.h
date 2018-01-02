//
//  FeedViewController.h
//  CoordinatorKit-Demo
//
//  Created by zhangwen on 2018/1/2.
//  Copyright © 2018年 zhangwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Feed;

@protocol FeedViewControllerDelegate <NSObject>
- (void)didClickedFeed:(Feed *)feed;
@end

@interface FeedViewController : UIViewController
@property (nonatomic, weak) id<FeedViewControllerDelegate> delegate;
@end
