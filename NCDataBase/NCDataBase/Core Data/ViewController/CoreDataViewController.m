//
//  CoreDataViewController.m
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/29.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import "CoreDataViewController.h"
#import "Student+CoreDataClass.h"
#import "Teacher+CoreDataClass.h"
#import "MagicalRecord.h"
#import "NCHandleCoreDataModel.h"

@interface CoreDataViewController ()

@end

@implementation CoreDataViewController
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //增
    Student *s = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:kNCHandleCoreDataModelInstance.managerContenxt];
    s.s_id = 12;
    s.s_name = @"尼古";
    s.s_age = 26;
    s.s_sex = 1;
    [kNCHandleCoreDataModelInstance save];
    
      //查
     NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Student"];
     NSPredicate *predicate = [NSPredicate predicateWithFormat:@"s_name == %@",@"尼古"];
     request.predicate = predicate;
     NSArray<Student*> *arr = [kNCHandleCoreDataModelInstance.managerContenxt executeFetchRequest:request error:nil];
    
      //改
      arr.firstObject.s_name = @"尼古新";
      arr.firstObject.s_age = 25;
      [kNCHandleCoreDataModelInstance save];
    
     //删
     [kNCHandleCoreDataModelInstance.managerContenxt deleteObject:arr.firstObject];
     [kNCHandleCoreDataModelInstance save];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"CoreData MagicalRecord使用 详情见代码";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //增
    for (NSInteger i = 0; i < 10; i ++) {
        Student *student = [Student MR_createEntity];
        student.s_id = i;
        student.s_name = [@"小名" stringByAppendingString:@(i).stringValue];
        student.s_age = arc4random() % 6 +10;
        student.s_sex = arc4random() % 2;
    }
    
    for (NSInteger i = 0; i < 10; i ++) {
        Teacher *teacher = [Teacher MR_createEntity];
        teacher.t_id = i;
        teacher.t_name = [@"张老师" stringByAppendingString:@(i).stringValue];
        teacher.t_sex = arc4random() % 2;
        
    }
    
    //查
    NSArray *allStudent = [Student MR_findAll];
    for (Student *s in allStudent) {
   NSLog(@"===1=Student=s_id:%ld=s_name:%@=s_age:%ld=s_sex:%ld",s.s_id,s.s_name,s.s_age,s.s_sex);
    }
    
    NSArray *teacherArr = [Teacher MR_findByAttribute:@"t_sex" withValue:@(0)];
    NSLog(@"===2==%@",teacherArr);
    
    //删
    for (Teacher *t in teacherArr) {
        [t MR_deleteEntity];
    }
    [[NSManagedObjectContext MR_defaultContext] MR_saveOnlySelfAndWait];
    
    //改
    NSArray *student = [Student MR_findByAttribute:@"s_age" withValue:@(12)];
    for (Student *s in student) {
        s.s_name = @"小屁孩";
     }
    [[NSManagedObjectContext MR_defaultContext] MR_saveOnlySelfAndWait];
    
    NSArray *allStu = [Student MR_findAll];
     for (Student *s in allStu) {
   NSLog(@"===2=Student=s_id:%ld=s_name:%@=s_age:%ld=s_sex:%ld",s.s_id,s.s_name,s.s_age,s.s_sex);
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
