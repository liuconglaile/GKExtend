//
//  GKHttpEngine.h
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/25/16.
//  Copyright © 2016 凯旋 郭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GKHttpEngine : NSObject

//判断是否有网络
// 启动网络监听
+ (BOOL)isNetWorkingResponse:(void(^)())response orNotResponse:(void(^)())responseNot;

// 返回值是 void, 参数是NSData *data, NSError *error
// void (^) (NSData *data, NSError *error)
// cb callback回调
//普通GET请求
+ (void) get:(NSString *)urlpath param:(NSDictionary *)params finish:(void (^)(NSData *data, NSDictionary *obj, NSError *error))cb;
//普通POST请求
+(void)post:(NSString *)urlpath param:(NSDictionary *)params finish:(void (^)(NSData *data, NSDictionary *obj, NSError *error))cb;
//同步请求
+ (void) postWithURLString:(NSString * )URLString body:(NSDictionary *)body header:(NSDictionary *)header finish:(  void (^)(NSData *data, NSDictionary *obj, NSError *error))cb;
+ (void) postLoginWithURLString:(NSString * )URLString body:(NSDictionary *)body header:(NSDictionary *)header finish:(  void (^)(NSData *data, NSDictionary *obj, NSError *error))cb;



@end
