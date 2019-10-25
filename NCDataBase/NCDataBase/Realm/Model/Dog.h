//
//  Dog.h
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/24.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN
@class Person;
@interface Dog : RLMObject
@property NSString *name;
@property Person   *owner;
@end
RLM_ARRAY_TYPE(Dog) // 定义 RLMArray<Dog> 类型

NS_ASSUME_NONNULL_END
