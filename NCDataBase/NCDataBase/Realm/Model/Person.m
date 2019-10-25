//
//  Person.m
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/24.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import "Person.h"

@implementation Person
//表示name不能置为nil
+ (NSArray *)requiredProperties {
    return @[@"name"];
}
//主键 允许对象的查询和更新更加高效，并且会强制要求每个值保持唯一性
//一旦将带有主键的对象添加到 Realm 数据库，那么该对象的主键将无法更改。
+ (NSString *)primaryKey {
    return @"id";
}
//默认属性值
+ (NSDictionary *)defaultPropertyValues {
    return @{@"name":@"nicolas"};
}
//要为某个属性建立索引
//Realm 支持为字符串、整型、布尔值以及 NSDate 属性建立索引。
+ (NSArray *)indexedProperties {
    return @[@"name"];
}
@end
