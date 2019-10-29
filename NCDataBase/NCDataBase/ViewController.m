//
//  ViewController.m
//  NCDataBase
//
//  Created by lishengfeng on 2019/10/23.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import "ViewController.h"
#import "RealmHomeViewController.h"
#import "FMDBViewController.h"
#import "CoreDataViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"NCDataBase";
    self.dataArr = @[@"Realm",
                     @"FMDB SQLite3",
                     @"Core Data",
    ];
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:tableView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    RealmHomeViewController *rhvc = [[RealmHomeViewController alloc]init];
    [self.navigationController pushViewController:rhvc animated:true];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            RealmHomeViewController *rhvc = [[RealmHomeViewController alloc]init];
            [self.navigationController pushViewController:rhvc animated:true];
        }
            break;
        case 1:
            {
                FMDBViewController *fbvc = [[FMDBViewController alloc]init];
                [self.navigationController pushViewController:fbvc animated:true];
            }
                break;
        case 2:
        {
            CoreDataViewController *cdvc = [[CoreDataViewController alloc]init];
            [self.navigationController pushViewController:cdvc animated:true];
        }
            break;
            
        default:
            break;
    }
}
@end
