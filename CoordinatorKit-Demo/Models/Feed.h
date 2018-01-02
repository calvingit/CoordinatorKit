//
//  Feed.h
//  CoordinatorKit-Demo
//
//  Created by zhangwen on 2018/1/2.
//  Copyright © 2018年 zhangwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feed : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *url;

+ (NSArray *)fakeFeeds;
@end
