//
//  GKConst.h
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 凯旋 郭. All rights reserved.
//

#import <Foundation/Foundation.h>

//重写NSLog,Debug模式下打印日志和当前行数
#import "DDLog.h"
#if DEBUG
//    static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#define NSLog(FORMAT, ...) fprintf(stderr,"  \n*** Function ->  %s \n       Lines ->  %d \n     Content ->  %s\n ", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
//    static const int ddLogLevel = LOG_LEVEL_OFF;
#define NSLog(FORMAT, ...) nil
#endif

#define GKAssertNoReturn(condition, msg) \
if (condition) {\
NSLog(@"%@",msg);\
return;\
}

#define GKAssertReturn(condition, msg, returnValue) \
if (condition) {\
NSLog(@"%@",msg);\
return returnValue;\
}
