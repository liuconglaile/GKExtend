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
+ (void) get:(NSString *)urlpath param:(NSDictionary *)dict finish:(  void (^)(NSData *data, NSDictionary *obj, NSError *error)      )cb;
+ (void) postWithNSString:(NSString *)urlpath param:(NSDictionary *)strParam finish:(  void (^)(NSData *data, NSDictionary *obj, NSError *error)      )cb;
+ (void) postWithDictionary:(NSString *)urlpath param:(NSDictionary *)dictParam finish:(  void (^)(NSData *data, NSDictionary *obj, NSError *error)      )cb;
+ (void) postWithURLString:(NSString * )URLString body:(NSDictionary *)body header:(NSDictionary *)header finish:(  void (^)(NSData *data, NSDictionary *obj, NSError *error))cb;
+ (void) postLoginWithURLString:(NSString * )URLString body:(NSDictionary *)body header:(NSDictionary *)header finish:(  void (^)(NSData *data, NSDictionary *obj, NSError *error))cb;
+ (void)postWithHeader:(NSString *)urlPath param:(NSString *)strParam header:(NSString *)strHeader finish:(void (^)(NSData *data, NSDictionary *obj, NSError *error))cb;


@end
