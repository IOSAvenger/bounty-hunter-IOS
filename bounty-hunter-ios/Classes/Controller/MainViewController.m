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

#define INDEX_URL @"http://localhost:1337/login"

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
    
    NSURL *index_URL = [NSURL URLWithString:INDEX_URL];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:index_URL];
    
    [request setHTTPMethod:@"GET"];
    //[request addValue:contentType forHTTPHeaderField:@"referer"];
    
    NSURLResponse *response;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString *pageSource = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",pageSource);
}

@end
