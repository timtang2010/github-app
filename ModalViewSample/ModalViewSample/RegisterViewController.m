//
//  RegisterViewController.m
//  ModalViewSample
//
//  Created by yuxin tang on 14-3-3.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
- (IBAction)done:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;

@end

@implementation RegisterViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Modal View done");
        
        NSDictionary *dataDict = [NSDictionary dictionaryWithObject:self.txtUsername.text forKey:@"username"];
        
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"RegisterCompletionNotification"
         object:nil
         userInfo:dataDict];
    }];
}
@end
