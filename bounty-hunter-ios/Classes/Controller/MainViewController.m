//
//  MainViewController.m
//  bounty-hunter-ios
//
//  Created by xiaojia on 5/17/14.
//  Copyright (c) 2014 IOSAvenger. All rights reserved.
//

#import "MainViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPRequestOperation.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /*
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{ @"username" :
                                  @"password" : @"19922020a"};
    [manager POST:@"http://localhost:1337/do/login" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    */
    
    NSString *URLString = [NSString stringWithFormat:@"http://jwc.wyu.edu.cn/student/logon.asp"];
    NSDictionary *parameters = @{@"UserCode": @"11080734", @"UserPwd" :;
    [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:parameters];
    
}


@end
