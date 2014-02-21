//
//  ViewController.m
//  ActionSheetPicker
//
//  Created by yuxin tang on 14-2-20.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void)measurementWasSelectedWithBigUnit:(NSNumber *)bigUnit smallUnit:(NSNumber *)smallUnit element:(id)element;
- (void)dateWasSelected:(NSData *)selectedDate element:(id)element;
- (void)animalWasSelected:(NSNumber *)selectedindex element:(id)element;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.animals = [NSArray arrayWithObjects:
                    @"AardVark",
                    @"beaver",
                    @"cheetah",
                    @"Deer",
                    @"Elephant",
                    @"Frog",
                    @"Gopher",
                    @"Horse",
                    @"Impala",
                    @"...",
                    @"Zebra",nil];
    self.selectedDate = [NSDate date];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}
- (IBAction)selectABlock:(id)sender {
}

- (IBAction)selectAnAnimal:(id)sender {
}

- (IBAction)selectADate:(id)sender {
}

- (IBAction)selectAMeasurement:(id)sender {
}

- (IBAction)selectAMusicalScale:(id)sender {
}
@end
