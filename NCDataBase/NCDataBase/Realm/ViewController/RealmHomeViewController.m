//
//  RealmHomeViewController.m
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/24.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import "RealmHomeViewController.h"
#import "HandleRealmModel.h"
#import "Person.h"

@interface RealmHomeViewController ()

@end

@implementation RealmHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Realm 数据库简单实使用(见代码)";
    

    Person *p = [[Person alloc]init];
    p.name = @"nicolas";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    NSDate *date =  [dateFormatter dateFromString:@"1993-02-21"];
    p.birthdate = date;
    p.id = 1;
    Dog *dog = [[Dog alloc]init];
    dog.name = @"peter";
    dog.owner = p;
    
    p.dogs = @[dog];
    
    [HandleRealmModel addOrUpdateToRealm:p];
    
    Dog *dog2 = [[Dog alloc]init];
    dog2.name = @"peter2";
    dog2.owner = nil;
    [HandleRealmModel addDataToRealm:dog2];
    
    NSString *filter = @"name = 'nicolas'";
    RLMResults *rr = [HandleRealmModel objectsInRealm:@"Person" withWhere:filter];
    
    
    NSLog(@"=====");
    Person *pp = [rr firstObject];
    [[HandleRealmModel openDefaultRealmDataBase] beginWriteTransaction];
    pp.name = @"nicolas New";
    [[HandleRealmModel openDefaultRealmDataBase] commitWriteTransaction];
    
    [HandleRealmModel deleteData:[rr firstObject]];
    
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
