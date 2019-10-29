//
//  Student+CoreDataProperties.h
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/29.
//  Copyright © 2019 Nicolas. All rights reserved.
//
//

#import "Student+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest;

@property (nonatomic) int32_t s_id;
@property (nullable, nonatomic, copy) NSString *s_name;
@property (nonatomic) int32_t s_sex;
@property (nonatomic) int32_t s_age;

@end

NS_ASSUME_NONNULL_END
