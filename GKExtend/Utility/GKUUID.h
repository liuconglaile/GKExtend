//
//  GKUUID.h
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 凯旋 郭. All rights reserved.
//

/**
 *  @author HC, 15-08-24 11:08:51
 *
 *  cocoapods导入SSKeychain: pod 'SSKeychain', '~> 1.2.3'
 *  或者导入压缩包内内容
 *      1. Add `Security.framework` to your target
 *      2. Add `SSKeychain.h`, `SSKeychain.m`, `SSKeychainQuery.h`, and `SSKeychainQuery.m` to your project.
 *
 *  使用
 *      NSLog(@"My iPhone Serial is : %@", [HCUUID getSerialNo]);
 *      NSLog(@"All Count is : %@", [HCUUID getAllSerial]);
 *
 */

#import <Foundation/Foundation.h>

@interface GKUUID : NSObject

// 取得手机唯一序列号,一旦安装了, 哪怕是App删除，下次得到的序列号也是唯一的

+ (NSString *) getSerialNo;

+ (NSArray *) getAllSerial;

@end
