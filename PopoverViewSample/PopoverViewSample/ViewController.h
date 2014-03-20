//
//  ViewController.h
//  PopoverViewSample
//
//  Created by yuxin tang on 14-3-20.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectViewController.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) UIPopoverController *poc;

- (IBAction)Show:(id)sender;

@end
