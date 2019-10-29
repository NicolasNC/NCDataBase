//
//  NCHandleCoreDataModel.m
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/29.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import "NCHandleCoreDataModel.h"

@implementation NCHandleCoreDataModel
+ (NCHandleCoreDataModel *)shareInstance
{
  static NCHandleCoreDataModel *instance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[NCHandleCoreDataModel alloc]init];
  });

  return instance;
}
- (NSURL*)getDocumentUrlPath
{
 return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject]
  ;
}

-(NSManagedObjectContext *)managerContenxt
{
  if (_managerContenxt != nil) {

    return _managerContenxt;
  }

  _managerContenxt = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
  [_managerContenxt setPersistentStoreCoordinator:self.maagerDinator];

  return _managerContenxt;
}
-(NSManagedObjectModel *)managerModel
{

  if (_managerModel != nil) {

    return _managerModel;
  }

  _managerModel = [NSManagedObjectModel mergedModelFromBundles:nil];

  return _managerModel;
}
-(NSPersistentStoreCoordinator *)maagerDinator
{
  if (_maagerDinator != nil) {

    return _maagerDinator;
  }

  _maagerDinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:self.managerModel];

  NSURL *url = [[self getDocumentUrlPath]URLByAppendingPathComponent:@"nicolsDatabase.db" isDirectory:YES];

  [_maagerDinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:nil];

  return _maagerDinator;
}

-(void)save
{  
  [self.managerContenxt save:nil];
}
@end
