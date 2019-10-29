//
//  AppDelegate.m
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/23.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Magicalrecord.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self initMagicalrecord];
    return YES;
}

@end
