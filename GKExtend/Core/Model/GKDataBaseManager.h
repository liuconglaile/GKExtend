//
//  GKDataBaseManager.h
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 凯旋 郭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

/*
 该类基于FMDB，进行二次迭代。需要导入libsqlite3.dylib或者cocoapods导入FMDB
 */

/**数据库管理类，负责数据库操作，一个manager负责一个数据库*/
@interface GKDataBaseManager : NSObject

/**构造方法，参数是数据库的路径*/
- (instancetype)initWithDataBasePath:(NSString *)path;

/**创建表单，传入表单名，主键列和其他健列*/
- (void)createTable:(NSString *)tableName primaryKey:(NSString *)keyName primaryType:(NSString *)colType otherColums:(NSDictionary *)colums;

/**删除表单，根据表单名*/
- (void)dropTable:(NSString *)tableName;

/**插入记录，参数是字典，键是列名，值是列值*/
- (void)insertRecordIntoTable:(NSString *)tableName withColumsAndValues:(NSDictionary *)dict;

/**删除记录，参数是字典，是筛选的条件*/
- (void)deleteRecordFromTable:(NSString *)tableName where:(NSDictionary *)whereDict;

/**删除记录，参数是字符串，允许用户，自定义删选条件*/
- (void)deleteRecordFromTable:(NSString *)tableName whereString:(NSString *)whereStr;

/**查看记录，参数是数组和字典，是筛选条件*/
- (FMResultSet *)select:(NSArray *)columNames fromTable:(NSString *)tableName where:(NSDictionary *)whereDict;

/**更新记录，参数是两个字典，更新的记录，和筛选条件*/
- (void)updateTable:(NSString *)tableName records:(NSDictionary *)updateDict where:(NSDictionary *)whereDict;


@end
