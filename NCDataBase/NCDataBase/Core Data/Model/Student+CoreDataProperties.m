//
//  Student+CoreDataProperties.m
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/29.
//  Copyright © 2019 Nicolas. All rights reserved.
//
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Student"];
}

@dynamic s_id;
@dynamic s_name;
@dynamic s_sex;
@dynamic s_age;

@end
