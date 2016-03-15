//
//  NSArray+GKExtend.m
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 caoxiaobo. All rights reserved.
//

#import "NSArray+GKExtend.h"

@implementation NSArray (GKExtend)

- (id)objectAtSafeIndex:(NSInteger)index
{
    if (index >(self.count-1) || index < 0)
    {
        NSLog(@"out of bound");
        return nil;
    }
    
    return [self objectAtIndex:index];
}

- (NSArray *)sortedWithArray:(NSArray *)numbers
{
    return  [numbers sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSComparisonResult result = NSOrderedSame;
        NSInteger value1 = [obj1 floatValue];
        NSInteger value2 = [obj2 floatValue];
        if (value1 > value2) {
            result =  NSOrderedDescending;
        } else if (value1 > value2) {
            result = NSOrderedSame;
        } else if (value1 > value2) {
            result =  NSOrderedDescending;
        }
        return result;
    }];
    
}

- (NSArray *)reverseForArray:(NSArray *)array
{
    return array.reverseObjectEnumerator.allObjects;
}

- (NSString *)jsonString
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


@end
