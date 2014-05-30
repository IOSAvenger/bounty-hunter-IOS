//
//  ViewController.h
//  login
//
//  Created by 谢阳晴 on 14-5-30.
//  Copyright (c) 2014年 谢阳晴. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)login:(id)sender;
@property(nonatomic,retain) UIActivityIndicatorView *activityview;
@end
