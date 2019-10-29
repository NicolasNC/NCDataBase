//
//  AppDelegate+Magicalrecord.m
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/29.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import "AppDelegate+Magicalrecord.h"
#import "MagicalRecord.h"
@implementation AppDelegate(Magicalrecord)
- (void)initMagicalrecord{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    path = [path stringByAppendingPathComponent:@"nicolas.sqlite"];
    NSURL *url = [NSURL fileURLWithPath:path];
    [MagicalRecord setLoggingLevel:MagicalRecordLoggingLevelWarn];
    [MagicalRecord setupCoreDataStackWithStoreAtURL:url];
}
@end
