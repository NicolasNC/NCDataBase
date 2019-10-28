//
//  HandleFMDBModel.m
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/28.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import "HandleFMDBModel.h"
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

//https://sqlitemanager.en.softonic.com/mac

@implementation HandleFMDBModel
+ (NSString *)obtainBasePath{
    return [NSTemporaryDirectory() stringByAppendingPathComponent:@"nicolas.db"];
}
+ (FMDatabase *)openDatabase{
    //1 创建路径
    NSString *path = [HandleFMDBModel obtainBasePath];
    //2 创建数据库
    FMDatabase *db = [FMDatabase databaseWithPath:path];
    //3 是否可以打开
    if ([db open]) {
        //4.创表
        BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_people (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL,sex text, age integer NOT NULL);"];
        if (result)
        {
            NSLog(@"创建表成功");
        }
    }
    return db;
}
+ (bool)insertData:(int)Id withName:(NSString *)name withAge:(int)age{
    __block bool suc = false;
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[HandleFMDBModel obtainBasePath]];
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
    //1.executeUpdate:不确定的参数用？来占位（后面参数必须是oc对象，；代表语句结束）
         NSString *sql = @"INSERT INTO t_people (id, name, age) VALUES (?,?,?);";
         suc = [db executeUpdate:sql,@(Id),name,@(age)];
         
//         //2.executeUpdateWithForamat：不确定的参数用%@，%d等来占位 （参数为原始数据类型，执行语句不区分大小写）
//         suc = [db executeUpdateWithFormat:@"insert into t_people (id,name,age) values (%i,%@,%i);",Id,name,age];
//        
//         //3.参数是数组的使用方式
//         suc = [db executeUpdate:@"INSERT INTO t_people(id,name,age) VALUES  (?,?,?);"withArgumentsInArray:@[@(Id),name,@(age)]];
    }];
    return suc;
}

+ (bool)deleteDataWithId:(int)id{
    __block bool suc = false;
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[HandleFMDBModel obtainBasePath]];
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
        //1.不确定的参数用？来占位 （后面参数必须是oc对象,需要将int包装成OC对象）
        suc = [db executeUpdate:@"delete from t_people where id = ?;",@(id)];

         //2.不确定的参数用%@，%d等来占位
        suc =  [db executeUpdateWithFormat:@"delete from t_people where name = %@;",@"nicolas"];
    }];
    return suc;
   
}
+ (bool)editData:(NSString *)name withNewName:(NSString *)newName{
    __block bool suc = false;
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[HandleFMDBModel obtainBasePath]];
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
       suc = [db executeUpdate:@"update t_people set name = ? where name = ?",newName,name];
    }];
    return suc;
}

+ (FMResultSet *)executeDataBase{
    __block FMResultSet *resultSet;
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[HandleFMDBModel obtainBasePath]];
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
        //查询整个表
           resultSet = [db executeQuery:@"select * from t_people;"];
            
            //根据条件查询
//           FMResultSet *resultSet2 = [db executeQuery:@"select * from t_people where id<?;",@(14)];
    }];
    return resultSet;
}
+ (bool)deleteTableData{
   __block bool suc = false;
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[HandleFMDBModel obtainBasePath]];
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
       suc = [db executeUpdate:@"drop table if exists t_people;"];
    }];
    return suc;
}
@end
