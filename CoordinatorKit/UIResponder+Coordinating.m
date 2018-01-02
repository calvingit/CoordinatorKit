//
//  UIResponder+Coordinating.m
//  CoordinatorKit
//
//  Created by zhangwen on 2017/12/30.
//  Copyright © 2017年 zhangwen. All rights reserved.
//

#import "UIResponder+Coordinating.h"

@implementation UIResponder (Coordinating)
- (UIResponder *)coordinatingResponder{
    return self.nextResponder;
}

- (void)coordinateMessageName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo{
    [self.coordinatingResponder coordinateMessageName:name object:object userInfo:userInfo];
}

@end
