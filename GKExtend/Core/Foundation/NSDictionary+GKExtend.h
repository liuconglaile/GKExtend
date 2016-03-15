//
//  NSDictionary+GKExtend.h
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 caoxiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+GKExtend.h"

@interface NSDictionary (GKExtend)

- (id)objectAtKeyPath:(NSString *)keyPath;

- (id)objectAtKeyPath:(NSString *)path  otherwise:(NSObject *)other;

//查询字符串
- (NSString *)keyValueString;   //返回简单的查询字符串 如:?name=xzh&age=21

//jsonString
- (NSString *)jsonString;

@end

@interface NSMutableDictionary (GKExtend)


@end
