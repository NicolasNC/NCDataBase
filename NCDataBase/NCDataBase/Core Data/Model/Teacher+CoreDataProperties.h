//
//  Teacher+CoreDataProperties.h
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/29.
//  Copyright © 2019 Nicolas. All rights reserved.
//
//

#import "Teacher+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Teacher (CoreDataProperties)

+ (NSFetchRequest<Teacher *> *)fetchRequest;

@property (nonatomic) int32_t t_id;
@property (nullable, nonatomic, copy) NSString *t_name;
@property (nonatomic) int32_t t_sex;

@end

NS_ASSUME_NONNULL_END
