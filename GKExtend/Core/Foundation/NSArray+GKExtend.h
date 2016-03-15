//
//  NSArray+GKExtend.h
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 caoxiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+GKExtend.h"

@interface NSArray (GKExtend)

//防止越界
- (id)objectAtSafeIndex:(NSInteger)index;

//数字排序
- (NSArray *)sortedWithArray:(NSArray *)numbers;

//倒序数组
- (NSArray *)reverseForArray:(NSArray *)array;

//jsonString
- (NSString *)jsonString;

@end
