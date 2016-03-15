//
//  NSMutableArray+GKExtend.h
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 caoxiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+GKExtend.h"

@interface NSMutableArray (GKExtend)

/**
 *  防止越界crash
 */
- (void)safeRemoveObjectAtIndex:(NSInteger)index;

@end
