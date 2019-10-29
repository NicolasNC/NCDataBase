//
//  Teacher+CoreDataProperties.m
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/29.
//  Copyright © 2019 Nicolas. All rights reserved.
//
//

#import "Teacher+CoreDataProperties.h"

@implementation Teacher (CoreDataProperties)

+ (NSFetchRequest<Teacher *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Teacher"];
}

@dynamic t_id;
@dynamic t_name;
@dynamic t_sex;

@end
