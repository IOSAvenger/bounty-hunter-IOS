//
//  ViewController.m
//  login
//
//  Created by 谢阳晴 on 14-5-30.
//  Copyright (c) 2014年 谢阳晴. All rights reserved.
//

#import "LoginViewController.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"

//定义URL
#define LOGIN_URL @"http://localhost:1337/do/login"
@interface LoginViewController ()<MBProgressHUDDelegate>
{
    MBProgressHUD *HUD;
}
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property(nonatomic,retain) UIActivityIndicatorView *activityview;
@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *image=[UIImage imageNamed:@"login.png"];
    self.view.backgroundColor=[UIColor colorWithPatternImage:image];
    self.username.delegate=self;
    self.password.delegate=self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    NSString *usernametext=self.username.text;
    
    NSString *passwordtext=self.password.text;
    
    [self.username resignFirstResponder];
    
    [self.password resignFirstResponder];
    
    if (usernametext.length==0||passwordtext.length==0) {
        
        UIAlertView *alertview=[[UIAlertView alloc] initWithTitle:@"提示！" message:@"账号或者密码不能为空！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alertview show];
        
    }else{
        
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
        HUD.delegate = self;
        HUD.labelText = @"登录中···";
        [HUD showWhileExecuting:@selector(Connection) onTarget:self withObject:nil animated:YES];

        
        /*
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
         */
        
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

- (void)Connection {
	
    NSURL *index_URL = [NSURL URLWithString:LOGIN_URL];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:index_URL];
    
    NSString *postString = [NSString stringWithFormat:@"username=%@&password=%@&option=user",self.username.text,self.password.text];
    NSData   *postData = [postString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postData];
    //[request addValue:contentType forHTTPHeaderField:@"referer"];
    NSURLResponse *response;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString *pageSource = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",pageSource);
    
    if (responseData) {
        if ([pageSource rangeOfString:@"游客请先"].location != NSNotFound ) {
            UIAlertView *failalert = [[UIAlertView alloc] initWithTitle:@"登陆失败" message:@"账号或者密码错误，请重新登陆" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [failalert show];
        }else{
            dispatch_async(dispatch_get_main_queue(),^{
                [self performSegueWithIdentifier:@"Login Succ" sender:self];
            });
        }
    }else{
        UIAlertView *nointeralert = [[UIAlertView alloc] initWithTitle:@"连接失败" message:@"请检查网络，稍后再试" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [nointeralert show];
    }
}

@end
