//
//  TaskListViewController.m
//  bounty-hunter-ios
//
//  Created by xiaojia on 6/1/14.
//  Copyright (c) 2014 IOSAvenger. All rights reserved.
//

#import "TaskListViewController.h"
#import "TaskListTableView.h"

@interface TaskListViewController ()

@end

@implementation TaskListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    TaskListTableView *tasklistTB = [[TaskListTableView alloc] initWithFrame:CGRectMake(0, 70, 320, 451)];
    //[tasklistTB reloadData];
    [self.view addSubview:tasklistTB];
}

@end
