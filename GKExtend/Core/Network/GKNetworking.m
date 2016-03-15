//
//  GKNetworking.m
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/25/16.
//  Copyright © 2016 凯旋 郭. All rights reserved.
//

#import "GKNetworking.h"
#import "AFNetworking.h"

@implementation GKNetworking

+ (void)getWithURLString:(NSString *)URLString getParam:(NSDictionary *)getParam finish:(void (^)(id, NSError *))postBack {
    //创建管理器
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    //发送请求
    [manager GET:URLString parameters:getParam success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (postBack) postBack(responseObject,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (postBack) postBack(nil,error);
    }];
}

+ (void)postWithURLString:(NSString *)URLString postParam:(NSDictionary *)postParam finish:(void (^)(id responseObject, NSError *error))postBack {
    //创建管理器
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    //发送请求
    [manager POST:URLString parameters:postParam success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (postBack) postBack(responseObject,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (postBack) postBack(nil,error);
    }];
}

+ (void)post2WithURLString:(NSString *)URLString postParam:(NSDictionary *)postParam finish:(void (^)(id responseObject, NSError *error))postBack {
    //创建管理器
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    //    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //    //如果报接受类型不一致请替换一致text/html或别的
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    //发送请求
    [manager POST:URLString parameters:postParam success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (postBack) postBack(responseObject,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (postBack) postBack(nil,error);
    }];
}

+ (void)postByTokenWithURLString:(NSString *)URLString WithParameters:(NSDictionary *)parameters finish:(void (^)(id responseObject, NSError *error))postBack {
    //创建管理器
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    //获取用户信息
    NSDictionary * _userInfo =[NSJSONSerialization JSONObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"userInfo" ] options:NSJSONReadingMutableLeaves error:nil];
    //设置token
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@",_userInfo[@"access_token"]] forHTTPHeaderField:@"Authorization"];
    //发送请求
    [manager POST:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) postBack(responseObject,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error) postBack(nil,error);
    }];
}


@end
