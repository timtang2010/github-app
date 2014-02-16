//
//  ViewController.m
//  SwitchSliderSegmentedControlSample
//
//  Created by yuxin tang on 14-2-16.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UILabel *SliderValue;
- (IBAction)switchValueChanged:(id)sender;
- (IBAction)touchDown:(id)sender;
- (IBAction)sliderValueChange:(id)sender;

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

//始两个开关保持一致
- (IBAction)switchValueChanged:(id)sender {
    UISwitch *witchSwitch = (UISwitch *)sender;
    BOOL setting = witchSwitch.isOn;
    [self.leftSwitch setOn:setting animated:YES];
    [self.rightSwitch setOn:setting animated:YES];
}

//点击分段控制开关控件的隐藏或显示
- (IBAction)touchDown:(id)sender {
    if (self.leftSwitch.hidden == YES) {
        self.rightSwitch.hidden = NO;
        self.leftSwitch.hidden = NO;
    } else {
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
    }
}

//用标签显示滑块的值
- (IBAction)sliderValueChange:(id)sender {
    UISlider *slider = (UISlider *)sender;
    int progressAsInt = (int)(slider.value + 0.05f);
    NSString *newText = [[NSString alloc]initWithFormat:@"%d",progressAsInt];
    self.SliderValue.text = newText;
}
@end
