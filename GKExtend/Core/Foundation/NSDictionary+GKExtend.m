//
//  NSDictionary+GKExtend.m
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 caoxiaobo. All rights reserved.
//

#import "NSDictionary+GKExtend.h"

@implementation NSDictionary (GKExtend)

- (id)objectAtKeyPath:(NSString *)keyPath
{
    if (!keyPath.isNoEmpty) return nil;
    
    NSObject *result = [self valueForKeyPath:keyPath];
    return result;
}

- (id)objectAtKeyPath:(NSString *)keyPath otherwise:(NSObject *)other
{
    NSObject *obj = [self objectAtKeyPath:keyPath];
    
    if ([obj isKindOfClass:[NSNull class]] || obj == nil) {
        return other;
    }
    
    return obj;
}

- (NSString *)keyValueString
{
    NSMutableString *string = [NSMutableString stringWithString:@"?"];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [string appendFormat:@"%@=%@&",key,obj];
    }];
    
    NSRange range = [string rangeOfString:@"&" options:NSBackwardsSearch];
    [string deleteCharactersInRange:range];
    
    return string;
}

- (NSString *)jsonString
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end

@implementation NSMutableDictionary (GKExtend)

@end
