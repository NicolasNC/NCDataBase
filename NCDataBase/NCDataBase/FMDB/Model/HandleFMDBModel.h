//
//  HandleFMDBModel.h
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/28.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import "NCModel.h"

NS_ASSUME_NONNULL_BEGIN
@class FMDatabase;
@class FMResultSet;
@interface HandleFMDBModel : NCModel
+ (FMDatabase *)openDatabase;
+ (bool)insertData:(int)Id withName:(NSString *)name withAge:(int)age;
+ (bool)deleteDataWithId:(int)id;
+ (bool)editData:(NSString *)name withNewName:(NSString *)newName;
+ (FMResultSet *)executeDataBase;
+ (bool)deleteTableData;
@end

NS_ASSUME_NONNULL_END
