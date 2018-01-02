//
//  Feed.m
//  CoordinatorKit-Demo
//
//  Created by zhangwen on 2018/1/2.
//  Copyright © 2018年 zhangwen. All rights reserved.
//

#import "Feed.h"

@implementation Feed


+ (NSArray *)fakeFeeds{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:4];
    Feed *feed1 = [Feed new];
    feed1.title = @"Title 1";
    feed1.date = @"2017-12-28";
    feed1.url = @"http://www.qq.com";
    
    Feed *feed2 = [Feed new];
    feed2.title = @"Title 2";
    feed2.date = @"2017-12-29";
    feed2.url = @"http://www.baidu.com";
    
    Feed *feed3 = [Feed new];
    feed3.title = @"Title 3";
    feed3.date = @"2017-12-30";
    feed3.url = @"http://www.sina.com.cn";

    Feed *feed4 = [Feed new];
    feed4.title = @"Title 4";
    feed4.date = @"2017-12-31";
    feed4.url = @"http://www.zhihu.com";

    [array addObjectsFromArray:@[feed1,feed2, feed3, feed4]];
    return [array copy];
}
@end
