//
//  People.h
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/28.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import "NCModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface People : NCModel
@property(nonatomic)int id;
@property(nonatomic)int age;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *sex;
@end

NS_ASSUME_NONNULL_END
