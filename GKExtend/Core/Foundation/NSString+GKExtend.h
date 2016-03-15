//
//  NSString+GKExtend.h
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 caoxiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+GKExtend.h"

@interface NSString (GKExtend)

- (NSString *)md5;

/************查询字符串************/
- (NSString *)urlEncode;
- (NSString *)urlDecode;
- (NSString *)schema;
- (NSString *)host;
- (NSString *)allPath;
- (NSString *)path;
- (NSString *)keyValues;
- (NSDictionary *)queryDic;

@end
