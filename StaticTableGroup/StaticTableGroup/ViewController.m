//
//  ViewController.m
//  StaticTableGroup
//
//  Created by yuxin tang on 14-2-26.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *txtuser;
@property (strong, nonatomic) IBOutlet UITextField *txtPassWord;
- (IBAction)logIn:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logIn:(id)sender {
    if ([self.txtPassWord.text isEqualToString:@"123"] && [_txtuser.text isEqualToString:@"tong"])
    {
        NSLog(@"登录成功");
        [self.txtPassWord resignFirstResponder];
        [self.txtuser resignFirstResponder];
    } else {
        NSLog(@"密码错误，请重试");

    }
}
@end
