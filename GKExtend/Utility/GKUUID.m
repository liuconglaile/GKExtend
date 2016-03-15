//
//  GKUUID.m
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 凯旋 郭. All rights reserved.
//

#import "GKUUID.h"
#import "SSKeychain.h"


@implementation GKUUID
#define ServiceName @""
#define Account @""

+ (NSString *) getSerialNo {
    NSString *s = [self getSaveSerialNo];
    if (s) {
        s = [s stringByReplacingOccurrencesOfString:@"-" withString:@""];
        return s;
    }
    s = [self saveSerialNo];
    s = [s stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return s;
}

+ (NSString *) saveSerialNo {
    // 产生一个序列号
    NSString *uuid = [[NSUUID UUID] UUIDString];
    // Keychain
    [SSKeychain setPassword:uuid forService:ServiceName account:Account];
    return uuid;
}

+ (NSString *) getSaveSerialNo {
    NSString *s = [SSKeychain passwordForService:ServiceName account:Account];
    return s;
}

+ (NSArray *) getAllSerial {
    return [SSKeychain allAccounts];
}



@end
