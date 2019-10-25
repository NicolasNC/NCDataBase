//
//  ViewController.m
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/23.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import "ViewController.h"
#import "RealmHomeViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"NCDataBase";
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    RealmHomeViewController *rhvc = [[RealmHomeViewController alloc]init];
    [self.navigationController pushViewController:rhvc animated:true];
}

@end
