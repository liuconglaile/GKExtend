//
//  NSURL+GKExtend.m
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 caoxiaobo. All rights reserved.
//

#import "NSURL+GKExtend.h"
#import "NSObject+GKExtend.h"
#import "NSString+GKExtend.h"

@implementation NSURL (GKExtend)

- (NSDictionary *)queryDic
{
    return [self.absoluteString queryDic];
}

@end
