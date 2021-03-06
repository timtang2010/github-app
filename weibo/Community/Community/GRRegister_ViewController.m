//
//  GRRegister_ViewController.m
//  Community
//
//  Created by WEB08-V5MCS006 on 14-3-31.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "GRRegister_ViewController.h"

@interface GRRegister_ViewController ()

@end

@implementation GRRegister_ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置按钮初始状态
    self.notAppearPasswordButton.hidden = NO;
    self.appearPasswordButton.hidden = YES;
    
    self.notAgreeProtocolButton.hidden = NO;
    self.agreeProtocolButton.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)TextFieldDone:(id)sender
{
    [self.nameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.surePasswordTextField resignFirstResponder];
}

- (IBAction)clickBackground:(id)sender
{
    [self.numberTextField resignFirstResponder];
}

- (IBAction)registerUser:(id)sender
{
    if (self.nameTextField.text.length == 0 |
        self.passwordTextField.text.length == 0 |
        self.surePasswordTextField.text.length == 0 |
        self.numberTextField.text.length == 0 |
        self.notAgreeProtocolButton.hidden == NO )
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"请输入完整信息" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
}

- (IBAction)toAppearPassword:(id)sender
{
    self.notAppearPasswordButton.hidden = YES;
    self.appearPasswordButton.hidden = NO;
    self.passwordTextField.secureTextEntry = NO;
    self.surePasswordTextField.secureTextEntry = NO;
}

- (IBAction)toDisappearPassword:(id)sender
{
    self.appearPasswordButton.hidden = YES;
    self.notAppearPasswordButton.hidden = NO;
    self.passwordTextField.secureTextEntry = YES;
    self.surePasswordTextField.secureTextEntry = YES;
}

- (IBAction)toAgreeProtocol:(id)sender
{
    self.notAgreeProtocolButton.hidden = YES;
    self.agreeProtocolButton.hidden = NO;
}

- (IBAction)toDoNotAgreeProtocol:(id)sender
{
    self.notAgreeProtocolButton.hidden = NO;
    self.agreeProtocolButton.hidden = YES;
}

@end
