//
//  HandleRealmModel.h
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/24.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import "NCModel.h"
#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN
@interface HandleRealmModel : NCModel
//摈弃完整的 iOS 文件加密机制,防止锁屏访问不了数据
+ (void)forbidFileProtection;
+ (void)setDefaultRealmForUser:(NSString *)username;
+ (RLMRealm *)openRealmDataBase:(NSString *)username;
+ (RLMRealm *)openDefaultRealmDataBase;
+ (RLMRealm *)openLocRealmDataBase;
//在应用启动时、在打开 Realm 数据库之前完成，要么只在显式声明的自动释放池 中打开 Realm 数据库，然后在自动释放池后面进行删除
+ (void)deleteRealmDataBase;

+ (void)addDataToRealm:(id)model;
//updata添加对象必须含有 primary key
+ (void)addOrUpdateToRealm:(id)model;
+ (void)deleteData:(id)model;

+ (RLMResults *)objectsInRealm:(NSString *)className withWhere:(NSString *)filter;
@end

NS_ASSUME_NONNULL_END
