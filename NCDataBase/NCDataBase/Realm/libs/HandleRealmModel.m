//
//  HandleRealmModel.m
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/24.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import "HandleRealmModel.h"


@implementation HandleRealmModel

+ (void)forbidFileProtection{
    RLMRealm *realm = [RLMRealm defaultRealm];

    // 获取 Realm 文件的父目录
    NSString *folderPath = realm.configuration.fileURL.URLByDeletingLastPathComponent.path;

    // 禁用此目录的文件保护
    [[NSFileManager defaultManager] setAttributes:@{NSFileProtectionKey: NSFileProtectionNone}
                                     ofItemAtPath:folderPath error:nil];
}

//设置 [RLMRealm defaultRealm]要返回的数据库
+ (void)setDefaultRealmForUser:(NSString *)username {
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    
    // 使用默认的目录，但是请将文件名替换为用户名
    config.fileURL = [[[config.fileURL URLByDeletingLastPathComponent]
                            URLByAppendingPathComponent:username]
                            URLByAppendingPathExtension:@"realm"];

    // 将该配置设置为默认 Realm 配置
    [RLMRealmConfiguration setDefaultConfiguration:config];
}

+ (RLMRealm *)openRealmDataBase:(NSString *)username {
    NSLog(@"===1%@====",[NSDate date]);
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];

   // 使用默认的目录，但是请将文件名替换为用户名
   config.fileURL = [[[config.fileURL URLByDeletingLastPathComponent]
                               URLByAppendingPathComponent:username]
                               URLByAppendingPathExtension:@"realm"];
    
    //在某些情况下，您可能想要限制某些类只能够存储在指定 Realm 数据库中。
    config.objectClasses = @[NSClassFromString(@"Person").class, NSClassFromString(@"Dog").class];
    
    //对 shouldCompactOnLaunch 属性进行配置，来决定首次打开该 Realm 文件时是否对其进行压缩
    //原理：压缩操作将会读取 Realm 文件的全部内容，然后在另一个地方重新写成一个新的文件，最后将原文件进行替换。耗时！
    config.shouldCompactOnLaunch = ^BOOL(NSUInteger totalBytes, NSUInteger usedBytes){
        // totalBytes 指的是硬盘上文件的大小（以字节为单位）(数据 + 可用空间)
        // usedBytes 指的是文件中数据所使用的字节数

        // 如果文件的大小超过 100 MB且已用空间低于 50%时，进行压缩
        NSUInteger oneHundredMB = 100 * 1024 * 1024;
        return (totalBytes > oneHundredMB) && (usedBytes / totalBytes) < 0.5;
    };
    NSLog(@"===2%@====",[NSDate date]);
    NSError *error = nil;
    RLMRealm *realm = [RLMRealm realmWithConfiguration:config error:&error];
    NSLog(@"===2%@====",[NSDate date]);
    if (!realm) {
        // 错误处理
    }
    return realm;
}
+ (RLMRealm *)openLocRealmDataBase{
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];

   // 使用默认的目录，但是请将文件名替换为用户名
   config.fileURL =  [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"Realmname"ofType:@"realm"]];
    NSError *error = nil;
    RLMRealm *realm = [RLMRealm realmWithConfiguration:config error:&error];
    if (!realm) {
        // 错误处理
    }
    return realm;
}
//在应用启动时、在打开 Realm 数据库之前完成，要么只在显式声明的自动释放池 中打开 Realm 数据库，然后在自动释放池后面进行删除
+ (void)deleteRealmDataBase{
    @autoreleasepool {
        NSFileManager *manager = [NSFileManager defaultManager];
        RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
        NSArray<NSURL *> *realmFileURLs = @[
            config.fileURL,
            [config.fileURL URLByAppendingPathExtension:@"lock"],
            [config.fileURL URLByAppendingPathExtension:@"note"],
            [config.fileURL URLByAppendingPathExtension:@"management"]
        ];
        for (NSURL *URL in realmFileURLs) {
            NSError *error = nil;
            [manager removeItemAtURL:URL error:&error];
            if (error) {
                // 错误处理
            }
        }
    }
}

+ (RLMRealm *)openDefaultRealmDataBase{
    return [HandleRealmModel openRealmDataBase:@"nicolas"];
}

#pragma mark========
#pragma mark========
+ (void)addDataToRealm:(id)model{
    @autoreleasepool {
        if (model) {
            RLMRealm *realm = [HandleRealmModel openDefaultRealmDataBase];
            if (!realm) {
                return;
            }
            [realm beginWriteTransaction];
            [realm addObject:model];
            [realm commitWriteTransaction];
        }
    }
}
+ (void)addOrUpdateToRealm:(id)model{
    @autoreleasepool {
        if (model) {
            RLMRealm *realm = [HandleRealmModel openDefaultRealmDataBase];
            if (!realm) {
                return;
            }
            [realm beginWriteTransaction];
            [realm addOrUpdateObject:model];
            [realm commitWriteTransaction];
        }
    }
}

+ (void)deleteData:(id)model{
   @autoreleasepool {
       if (model) {
           RLMRealm *realm = [HandleRealmModel openDefaultRealmDataBase];
           if (!realm) {
               return;
           }
           [realm beginWriteTransaction];
           [realm deleteObject:model];
           [realm commitWriteTransaction];
       }
   }
}
+ (RLMResults *)objectsInRealm:(NSString *)className withWhere:(NSString *)filter{
    @autoreleasepool {
        RLMRealm *realm = [HandleRealmModel openDefaultRealmDataBase];
        if (!realm) {
            return nil;
        }
        return [NSClassFromString(className) objectsInRealm:realm where:filter];
    }
}
@end
