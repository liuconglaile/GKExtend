//
//  GKCacheManager.h
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 凯旋 郭. All rights reserved.
//

/*该类基于FMDB，进行二次迭代。需要导入libsqlite3.dylib或者cocoapods导入FMDB*/

#import <Foundation/Foundation.h>
#import "GKDataBaseManager.h"

/**缓存管理类，单例对象*/
@interface GKCacheManager : NSObject

/**有效时长，单位秒*/
@property (nonatomic, assign) NSTimeInterval validTime;

/**类方法创建单例对象*/
+ (GKCacheManager *)defaultManager;

/**写入缓存*/
- (void)insertCacheWithURL:(NSString *)url data:(NSData *)data;

/**删除缓存*/
- (void)removeCacheWithURL:(NSString *)url;

/**判断缓存是否存在，是否过期*/
- (NSData *)dataFromCachesWithURL:(NSString *)url;

@end
