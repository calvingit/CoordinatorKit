//
//  UIResponder+Coordinating.h
//  CoordinatorKit
//
//  Created by zhangwen on 2017/12/30.
//  Copyright © 2017年 zhangwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Coordinating)
@property (nonatomic, readonly) UIResponder *coordinatingResponder;

- (void)coordinateMessageName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo;
@end
