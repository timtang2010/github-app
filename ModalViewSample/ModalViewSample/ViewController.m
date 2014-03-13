//
//  ViewController.m
//  ModalViewSample
//
//  Created by yuxin tang on 14-3-3.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)regonclick:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(registerCompletion:)
                                                 name:@"RegisterCompletionNotification"
                                               object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (IBAction)regonclick:(id)sender {
    UIStoryboard *mailStoryboard = [UIStoryboard storyboardWithName:@"MailStoryboard"
                                                             bundle:nil];
    UIViewController *registerViewController = [mailStoryboard instantiateViewControllerWithIdentifier:@"registerViewController"];
    
    registerViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:registerViewController animated:YES completion:^{
        NSLog(@"Present Modal View");
    }];
}

- (void)registerCompletion:(NSNotification *)notification
{
    NSDictionary *theData = [notification userInfo];
    NSString *username = [theData objectForKey:@"username"];
    
    NSLog(@"username = %@", username);
}
@end
