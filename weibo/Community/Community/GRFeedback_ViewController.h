//
//  GRFeedback_ViewController.h
//  Community
//
//  Created by WEB08-V5MCS006 on 14-3-31.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPTextViewPlaceholder.h"

@interface GRFeedback_ViewController : UIViewController

@property (strong, nonatomic) IBOutlet CPTextViewPlaceholder *textView;
@property (strong, nonatomic) IBOutlet UITextField *textField;

- (IBAction)clickBackground:(id)sender;
- (IBAction)textDone:(id)sender;

@end