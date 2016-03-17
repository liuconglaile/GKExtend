//
//  GKNetworking.h
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/25/16.
//  Copyright © 2016 凯旋 郭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GKNetworking : NSObject

+ (void)getWithURLString:(NSString *)URLString getParam:(NSDictionary *)getParam finish:(void (^)(id responseObject, NSError *error))postBack;

/**
 *
 *  post请求
 *
 *  @param URLString  你的接口地址
 *  @param postDict   传入的参数
 */
+ (void)postWithURLString:(NSString *)URLString postParam:(NSDictionary *)postParam finish:(void (^)(id responseObject, NSError *error))postBack;

+ (void)post2WithURLString:(NSString *)URLString postParam:(NSDictionary *)postParam finish:(void (^)(id responseObject, NSError *error))postBack;

+ (void)postByTokenWithURLString:(NSString *)URLString WithParameters:(NSDictionary *)parameters finish:(void (^)(id responseObject, NSError *error))postBack;


@end
