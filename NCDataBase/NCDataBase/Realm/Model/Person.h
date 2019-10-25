//
//  Person.h
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/24.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import <Realm/Realm.h>
#import "Dog.h"
NS_ASSUME_NONNULL_BEGIN

@interface Person : RLMObject
@property NSInteger id;
@property NSString             *name;
@property NSDate               *birthdate;
@property RLMArray<Dog *><Dog> *dogs;
@end
RLM_ARRAY_TYPE(Person)

NS_ASSUME_NONNULL_END
