//
//  GKHttpEngine.m
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/25/16.
//  Copyright © 2016 凯旋 郭. All rights reserved.
//

#import "GKHttpEngine.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"

@interface GKHttpEngine ()

@end


@implementation GKHttpEngine

+ (BOOL)isNetWorkingResponse:(void (^)())response orNotResponse:(void (^)())responseNot {
    // 1.获得网络监控的管理者
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    
    // 2.设置网络状态改变后的处理
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态改变了, 就会调用这个block
        
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: // 未知网络
                NSLog(@"未知网络");
                break;
                
            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                NSLog(@"没有网络(断网)");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                NSLog(@"手机自带网络");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                NSLog(@"WIFI");
                break;
        }
    }];
    
    // 3.开始监控
    [mgr startMonitoring];
    
    if ([AFNetworkReachabilityManager sharedManager].isReachable) {
        if (response) {
            response();
        }
    } else {
        if (responseNot) {
            responseNot();
        }
    }
    
    return [AFNetworkReachabilityManager sharedManager].isReachable;
}

#pragma mark --- 普通GET请求

+ (void) get:(NSString *)urlpath param:(NSDictionary *)params finish:(void (^)(NSData *data, NSDictionary *obj, NSError *error))cb {
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
   
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [SVProgressHUD show];
    
    [manager GET:urlpath parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [SVProgressHUD dismiss];
        NSData *backData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
        if (cb) cb(backData, responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error : %@",[error localizedDescription]);
        [SVProgressHUD showErrorWithStatus:[error localizedDescription]];
        if (cb) cb(nil, nil, error);
    }];
    
}

#pragma mark --- 普通POST请求
+(void)post:(NSString *)urlpath param:(NSDictionary *)params finish:(void (^)(NSData *data, NSDictionary *obj, NSError *error))cb {
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [SVProgressHUD show];
    [manager POST:urlpath parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        [SVProgressHUD dismiss];
        NSData *backData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
        if (cb) cb(backData, responseObject, nil);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"error : %@",[error localizedDescription]);
        [SVProgressHUD showErrorWithStatus:[error localizedDescription]];
        if (cb) cb(nil, nil, error);
    }];
    
}

#pragma mark --- 同步请求
//注册请求
+ (void) postWithURLString:(NSString * )URLString body:(NSDictionary *)body header:(NSDictionary *)header finish:(  void (^)(NSData *data, NSDictionary *obj, NSError *error))cb {
    
    NSURL * URL = [NSURL URLWithString:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * postBody = [NSJSONSerialization dataWithJSONObject:body options:NSJSONWritingPrettyPrinted error:nil];
    
    //    NSLog(@"postBody : %@",[[NSString alloc]initWithData:postBody encoding:NSUTF8StringEncoding]);
    
    NSData * postHeader = [NSJSONSerialization dataWithJSONObject:header options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString * postHeaderString = [[NSString alloc]initWithData:postHeader encoding:NSUTF8StringEncoding];
    
    //    NSLog(@"______1______postHeaderString : %@",postHeaderString);
    
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc]init];
    
    [request setHTTPMethod:@"post"]; //指定请求方式
    
    [request setURL:URL]; //设置请求的地址
    
    [request setHTTPBody:postBody];  //设置请求的参数
    
    
    //    postHeaderString =  @"{    \"app_id\" : \"1024387637\",    \"app_version\" : \"1\",    \"net_id\" : \"BA551698-5871-4A77-B99C-1D38AB5C80A7\",    \"app_key\" : \"b7a70f1560e37086cceee7e46a4df9e2\",    \"mac\" : \"BA551698-5871-4A77-B99C-1D38AB5C80A7\",    \"device_id\" : \"BA551698-5871-4A77-B99C-1D38AB5C80A7\",    \"imeid\" : \"BA551698-5871-4A77-B99C-1D38AB5C80A7\",    \"access_token\" : \"\",    \"client_id\" : \"6725063e575b34ea1f6da9c444d54e14\"}";
    
    postHeaderString = [NSString stringWithFormat:@"{\"app_id\" : \"%@\",\"app_version\" : \"%@\",\"net_id\" : \"%@\",\"app_key\" : \"%@\",\"mac\" : \"%@\",\"device_id\" : \"%@\",\"imeid\" : \"%@\",\"access_token\" : \"%@\",\"client_id\" : \"%@\"}",header[@"app_id"],header[@"app_version"],header[@"net_id"],header[@"app_key"],header[@"mac"],header[@"device_id"],header[@"imeid"],header[@"access_token"],header[@"client_id"]];
    
    //    NSLog(@"______2______postHeaderString : %@",postHeaderString);
    
    
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:postHeaderString forHTTPHeaderField:@"Device"];
    
    
    //    NSDictionary * heear = request.allHTTPHeaderFields;
    
    //    NSData * heearDa = [NSJSONSerialization dataWithJSONObject:heear options:NSJSONWritingPrettyPrinted error:nil];
    
    //    NSLog(@"header : %@",[[NSString alloc]initWithData:heearDa encoding:NSUTF8StringEncoding]);
    
    
    NSURLResponse * response;
    NSError * error;
    NSData * backData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (error) {
        //        NSLog(@"error : %@",[error localizedDescription]);
        if (cb) cb(nil, nil, error);
    }else{
        //        NSLog(@"response : %@",response);
        //        NSLog(@"backData : %@",[[NSString alloc]initWithData:backData encoding:NSUTF8StringEncoding]);
        NSDictionary * obj = [NSJSONSerialization JSONObjectWithData:backData options:NSJSONReadingMutableContainers error:nil];
        if (cb) cb(backData, obj, nil);
    }
}
//登陆请求
+ (void) postLoginWithURLString:(NSString * )URLString body:(NSDictionary *)body header:(NSDictionary *)header finish:(  void (^)(NSData *data, NSDictionary *obj, NSError *error))cb {
    
    NSURL * URL = [NSURL URLWithString:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * postBody = [NSJSONSerialization dataWithJSONObject:body options:NSJSONWritingPrettyPrinted error:nil];
    
    NSLog(@"postBody : %@",[[NSString alloc]initWithData:postBody encoding:NSUTF8StringEncoding]);
    
    NSData * postHeader = [NSJSONSerialization dataWithJSONObject:header options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString * postHeaderString = [[NSString alloc]initWithData:postHeader encoding:NSUTF8StringEncoding];
    
    NSLog(@"______1______postHeaderString : %@",postHeaderString);
    
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc]init];
    
    [request setHTTPMethod:@"post"]; //指定请求方式
    
    [request setURL:URL]; //设置请求的地址
    
    [request setHTTPBody:postBody];  //设置请求的参数
    
    postHeaderString = [NSString stringWithFormat:@"{\"app_id\" : \"%@\",\"app_version\" : \"%@\",\"net_id\" : \"%@\",\"app_key\" : \"%@\",\"mac\" : \"%@\",\"device_id\" : \"%@\",\"imeid\" : \"%@\",\"access_token\" : \"%@\",\"client_id\" : \"%@\"}",header[@"app_id"],header[@"app_version"],header[@"net_id"],header[@"app_key"],header[@"mac"],header[@"device_id"],header[@"imeid"],header[@"access_token"],header[@"client_id"]];
    
    NSLog(@"______2______postHeaderString : %@",postHeaderString);
    
    
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:postHeaderString forHTTPHeaderField:@"Device"];
    
    
    NSDictionary * heear = request.allHTTPHeaderFields;
    
    NSData * heearDa = [NSJSONSerialization dataWithJSONObject:heear options:NSJSONWritingPrettyPrinted error:nil];
    
    NSLog(@"header : %@",[[NSString alloc]initWithData:heearDa encoding:NSUTF8StringEncoding]);
    
    
    NSURLResponse * response;
    NSError * error;
    NSData * backData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (error) {
        NSLog(@"error : %@",[error localizedDescription]);
        if (cb) cb(nil, nil, error);
    }else{
        NSLog(@"response : %@",response);
        NSLog(@"backData : %@",[[NSString alloc]initWithData:backData encoding:NSUTF8StringEncoding]);
        if (cb) cb(backData, nil, nil);
    }
}



@end
