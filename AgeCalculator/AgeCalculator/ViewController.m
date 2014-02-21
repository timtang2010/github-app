//
//  ViewController.m
//  AgeCalculator
//
//  Created by yuxin tang on 14-2-19.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
{
    NSDate *bitchDate;
    UIActionSheet *dateSheet;
}
@property (weak, nonatomic) IBOutlet UITextField *birthTextField;
@property (weak, nonatomic) IBOutlet UILabel *ageLaebl;

@property (retain, nonatomic) NSDate *birthDate;

- (void)setBirth;
- (void)dismissDateSet;
- (void)cancelDateSet;

@end

@implementation ViewController

@synthesize birthTextField;
@synthesize ageLaebl;

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

- (void)setBirth
{
    dateSheet = [[UIActionSheet alloc]initWithTitle:nil
                                           delegate:nil
                                  cancelButtonTitle:nil
                             destructiveButtonTitle:nil
                                  otherButtonTitles:nil];
    
    [dateSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    
    CGRect pickerFrame = CGRectMake(0, 44, 0, 0);
    UIDatePicker *birthDayPicker = [[UIDatePicker alloc]initWithFrame:pickerFrame];
    [birthDayPicker setDatePickerMode:UIDatePickerModeDate];
    
    [dateSheet addSubview:birthDayPicker];
    
    UIToolbar *controlToolBar = [[UIToolbar alloc]
                                 initWithFrame:
                                 CGRectMake(0, 0, dateSheet.bounds.size.width, 44)];
    [controlToolBar setBarStyle:UIBarStyleBlack];
    [controlToolBar sizeToFit];
    
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc]
                               initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                               target:nil
                               action:nil];
    UIBarButtonItem *setButton = [[UIBarButtonItem alloc]initWithTitle:@"Set"
                                                                 style:UIBarButtonItemStyleDone
                                                                target:self
                                                                action:@selector(dismissDateSet)];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"Cancel"
                                                                    style:UIBarButtonItemStyleBordered
                                                                   target:self
                                                                   action:@selector(cancelDateSet)];
    [controlToolBar setItems:[NSArray
                              arrayWithObjects:
                              spacer,
                              cancelButton,
                              setButton,
                              nil]animated:NO];
    
    [dateSheet addSubview:controlToolBar];
    
    [dateSheet showInView:self.view];
    
    [dateSheet setBounds:CGRectMake(0, 0, 320, 485)];
    
    
}

- (void)dismissDateSet
{
    NSArray *listOfViews = [dateSheet subviews];
    
    for (UIView *subView in listOfViews) {
        if ([subView isKindOfClass:[UIDatePicker class]]) {
            self.birthDate = [(UIDatePicker *)subView date];
        }
    }
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"MM/dd/yyyy"];
    
    [birthTextField setText:[dateformatter stringFromDate:self.birthDate]];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    
    NSDateComponents * ageCalc = [calendar components:unitFlags
                                             fromDate:self.birthDate
                                                toDate:[NSDate date]
                                               options:0];
    int months = [ageCalc month];
    int days = [ageCalc day];
    int years = [ageCalc year];
    
    if (years < 0 || days < 0 || months < 0) {
        [self.ageLaebl setText:@"Not born Yet"];
    } else if (years == 0 && days == 0 && months == 0){
        [self.ageLaebl setText:@"Born Today!"];
    } else {
        NSString *outPut = [NSString stringWithFormat:@"%i yr %i mn %i dy old", years, months, days];
        [self.ageLaebl setText:outPut];
    }
    [dateSheet dismissWithClickedButtonIndex:0 animated:YES];

}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self setBirth];
    return NO;
}

- (void)cancelDateSet
{
    [dateSheet dismissWithClickedButtonIndex:0 animated:YES];
    
}
@end
