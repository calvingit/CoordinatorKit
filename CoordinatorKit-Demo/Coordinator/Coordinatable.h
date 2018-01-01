//
//  Coordinatable.h
//  Coordinator-OC
//
//  Created by zhangwen on 2018/1/1.
//  Copyright © 2018年 zhangwen. All rights reserved.
//

#ifndef Coordinatable_h
#define Coordinatable_h

#import <Foundation/Foundation.h>
#import "Routable.h"

@protocol Coordinatable <NSObject, Presentable>
@required

@property (nonatomic, readonly) id<Routable> router;

- (void)start;

@end

#endif /* Coordinatable_h */
