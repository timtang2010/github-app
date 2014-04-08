//
//  ViewController.h
//  PlistTutorial
//
//  Created by yuxin tang on 14-4-6.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameEntered;
@property (weak, nonatomic) IBOutlet UITextField *homePhone;
@property (weak, nonatomic) IBOutlet UITextField *workPhone;
@property (weak, nonatomic) IBOutlet UITextField *cellPhone;

@property (strong, nonatomic) NSString *personeName;
@property (strong, nonatomic) NSMutableArray *phoneNumbers;

- (IBAction)saveData:(id)sender;

@end
