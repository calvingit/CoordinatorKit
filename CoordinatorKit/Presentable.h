//
//  Presentable.h
//  Coordinator-OC
//
//  Created by zhangwen on 2018/1/1.
//  Copyright © 2018年 zhangwen. All rights reserved.
//
#ifndef Presentable_h
#define Presentable_h

#import <UIKit/UIKit.h>

@protocol Presentable <NSObject>
@required
- (UIViewController *)presentableViewController;
@end

#endif /* Presentable_h */
