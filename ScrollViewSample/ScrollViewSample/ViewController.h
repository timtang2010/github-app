//
//  ViewController.h
//  ScrollViewSample
//
//  Created by yuxin tang on 14-2-17.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
{
    BOOL keyboardVisible; //键盘打开标示
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *textField;


@end
