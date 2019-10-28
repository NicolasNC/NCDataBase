//
//  FMDBViewController.m
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/28.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import "FMDBViewController.h"
#import "HandleFMDBModel.h"
#import "FMResultSet.h"
@interface FMDBViewController ()

@end

@implementation FMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"FMDB 具体见代码实现";
    
    [HandleFMDBModel openDatabase];
    

    [HandleFMDBModel insertData:1 withName:@"nicoals" withAge:26];
    [HandleFMDBModel insertData:2 withName:@"nicoals1" withAge:27];
    [HandleFMDBModel insertData:3 withName:@"nicoals2" withAge:28];
    [self executeData:1];
    
    [HandleFMDBModel deleteDataWithId:1];
    [self executeData:2];
     
    [HandleFMDBModel editData:@"nicoals1" withNewName:@"nicolas Zhou"];
    [self executeData:3];
    
     [HandleFMDBModel deleteTableData];
}
- (void)executeData:(NSInteger)idex{
  FMResultSet *resultSet = [HandleFMDBModel executeDataBase];
  NSInteger column = resultSet.columnCount;
    while ([resultSet  next])
     {
        int idNum = [resultSet intForColumn:@"id"];

       NSString *name = [resultSet
       objectForColumn:@"name"];
      
       int age = [resultSet intForColumn:@"age"];
         
        NSLog(@"==%ld==id：%d name:%@ age:%d",idex,idNum,name,age);
     }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
