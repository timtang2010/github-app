//
//  ViewController.m
//  ToolBarSample
//
//  Created by yuxin tang on 14-2-18.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
- (IBAction)open:(id)sender;
- (IBAction)save:(id)sender;

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

- (IBAction)open:(id)sender {
    self.label.text = @"你点击的是Open";
}

- (IBAction)save:(id)sender {
    self.label.text = @"你点击的是Save";
}
@end
