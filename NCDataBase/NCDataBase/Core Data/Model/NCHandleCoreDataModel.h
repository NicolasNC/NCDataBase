//
//  NCHandleCoreDataModel.h
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/29.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import "NCModel.h"
#import <CoreData/CoreData.h>

#define kNCHandleCoreDataModelInstance [NCHandleCoreDataModel shareInstance]

NS_ASSUME_NONNULL_BEGIN

@interface NCHandleCoreDataModel : NCModel
+(NCHandleCoreDataModel *)shareInstance;
@property(strong,nonatomic)NSManagedObjectContext *managerContenxt;
@property(strong,nonatomic)NSManagedObjectModel *managerModel;//模型对象
@property(strong,nonatomic)NSPersistentStoreCoordinator *maagerDinator; //存储调度器
-(void)save;
@end

NS_ASSUME_NONNULL_END
