//
//  ViewController.m
//  PopoverViewSample
//
//  Created by yuxin tang on 14-3-20.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (IBAction)Show:(id)sender {
    SelectViewController *popoverViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SelectViewController"];
    
    if (self.poc == nil) {
        popoverViewController.title = @"选择你喜欢的颜色";
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:popoverViewController];
        self.poc = [[UIPopoverController alloc] initWithContentViewController:nav];
    }
    [self.poc presentPopoverFromBarButtonItem:sender
                     permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}
@end
