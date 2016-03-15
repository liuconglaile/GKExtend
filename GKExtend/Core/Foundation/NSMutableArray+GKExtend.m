//
//  NSMutableArray+GKExtend.m
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 caoxiaobo. All rights reserved.
//

#import "NSMutableArray+GKExtend.h"

@implementation NSMutableArray (GKExtend)
- (void)safeRemoveObjectAtIndex:(NSInteger)index
{
    if (index >(self.count-1) || index < 0)
    {
        NSLog(@"out of bound");
        return;
    }
    [self removeObjectAtIndex:index];
}

@end
