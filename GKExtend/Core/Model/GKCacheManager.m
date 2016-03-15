//
//  GKCacheManager.m
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 凯旋 郭. All rights reserved.
//

#import "GKCacheManager.h"

#define CACHES_TABLE_NAME @"caches"
#define URL_COLUME @"url"
#define DATA_COLUME @"data"
#define DATE_COLUME @"insertDate"

//缓存的默认有效时长
#define DEFAULT_VALID_TIME 3600 * 24

@implementation GKCacheManager
{
    //数据库管理
    GKDataBaseManager * _dataBaseManager;
}

/**类方法创建单例对象*/
+ (GKCacheManager *)defaultManager
{
    //因为静态变量会保留上一次执行的结果，所以只有第一次调用创建对象，以后调用直接返回manager，即上一次执行的结果，即同一个对象的地址。
    //另外，单例对象不释放。
    static GKCacheManager * manager = nil;
    if (manager == nil) {
        manager = [[GKCacheManager alloc] init];
    }
    return manager;
}

//构造方法
- (instancetype)init
{
    if (self = [super init]) {
        
        //获取应用程序的路径
        NSArray * searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentFolderPath = [searchPaths objectAtIndex:0];
        //        NSLog(@"docoumentFolderPath=%@",documentFolderPath);
        
        //往应用程序路径中添加数据库文件名称，把它们拼接起来， 这里用到了宏定义（目的是不易出错)
        NSString * dbFilePath = [documentFolderPath stringByAppendingPathComponent:@"cache.db"];
        //        NSLog(@"dbFilePath = %@",dbFilePath);
        //实例化数据库管理对象
        _dataBaseManager = [[GKDataBaseManager alloc] initWithDataBasePath:dbFilePath];
        self.validTime = DEFAULT_VALID_TIME;
        [self createTable];
    }
    return self;
}

//创建数据库的表单
- (void)createTable
{
    NSDictionary * colums = @{DATA_COLUME:@"text", DATE_COLUME:@"datetime"};
    [_dataBaseManager createTable:CACHES_TABLE_NAME primaryKey:URL_COLUME primaryType:@"varchar(256)" otherColums:colums];
}

/**写入缓存*/
- (void)insertCacheWithURL:(NSString *)url data:(NSData *)data
{
    [_dataBaseManager insertRecordIntoTable:CACHES_TABLE_NAME withColumsAndValues:@{URL_COLUME:url, DATA_COLUME:data, DATE_COLUME:[NSDate date]}];
}

/**删除缓存*/
- (void)removeCacheWithURL:(NSString *)url
{
    [_dataBaseManager deleteRecordFromTable:CACHES_TABLE_NAME where:@{URL_COLUME:url}];
}

/**判断缓存是否存在，是否过期*/
- (NSData *)dataFromCachesWithURL:(NSString *)url
{
    FMResultSet * set = [_dataBaseManager select:@[DATA_COLUME, DATE_COLUME] fromTable:CACHES_TABLE_NAME where:@{URL_COLUME:url}];
    
    //判断set中是否存在元素
    if ([set next] == NO)
        return nil;
    
    //如果存在，取出时间
    NSDate * date = [set dateForColumn:DATE_COLUME];
    NSTimeInterval timeInterval = [date timeIntervalSinceNow];
    if (-timeInterval > self.validTime) {
        //将过时的缓存清除
        [self removeCacheWithURL:url];
        return nil;
    }
    
    //存在且有效
    NSData * data = [set dataForColumn:DATA_COLUME];
    return data;
}


@end
