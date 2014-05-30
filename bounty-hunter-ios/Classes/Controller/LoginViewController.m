//
//  ViewController.m
//  login
//
//  Created by 谢阳晴 on 14-5-30.
//  Copyright (c) 2014年 谢阳晴. All rights reserved.
//

#import "LoginViewController.h"
#import "AFNetworking.h"
//定义URL
#define Base_url @"eqeqweqwqwq"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *image=[UIImage imageNamed:@"background1.jpg"];
    self.view.backgroundColor=[UIColor colorWithPatternImage:image];
    self.username.delegate=self;
    self.password.delegate=self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)login:(id)sender {
    NSString *usernametext=self.username.text;
    
    NSString *passwordtext=self.password.text;
    
    [self.username resignFirstResponder];
    
    [self.password resignFirstResponder];
    
    if (usernametext.length==0||passwordtext.length==0) {
        
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"提示！" message:@"账号或者密码不能为空！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alertview show];
        
    }else{
        //数据字典
        //        self.logindic=[[NSMutableDictionary alloc]initWithObjectsAndKeys:usernametext,@"username",passwordtext,@"password",nil];
        _activityview=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        
        _activityview.center=self.view.center;
        
        [self.view addSubview:_activityview];
        
        
        _activityview.backgroundColor=[UIColor grayColor];
        
        _activityview.alpha=0.3;
        
        [_activityview startAnimating];
        
        NSString *urlstring=[Base_url stringByAppendingFormat:@"%@&%@.html",usernametext,passwordtext];
        
        NSURL *url=[NSURL URLWithString:urlstring];
        
        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"POST"];
        
        AFHTTPRequestOperation *operation=[[AFHTTPRequestOperation alloc]initWithRequest:request];
        
        operation.responseSerializer=[AFJSONResponseSerializer serializer];
        
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            //处理连接成功
            NSDictionary *resultdic=(NSDictionary *)responseObject;
            
            NSLog(@"%@",resultdic);
            
            [_activityview stopAnimating];
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            //处理连接失败
            
            [_activityview stopAnimating];
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"登陆出错，请检查网络和密码账号！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            
            [alert show];
        }];
        
        [operation start];
        
        //        loginaccessViewController *lv=[[loginaccessViewController alloc]init];
        //        [self presentViewController:lv animated:NO completion:NULL];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.returnKeyType==UIReturnKeyNext) {
        
        [self.password becomeFirstResponder];
        
    }else{
        
        [textField resignFirstResponder];
    }
    return YES;
}

@end
