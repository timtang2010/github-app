//
//  ViewController.m
//  ScreenRotateSample
//
//  Created by yuxin tang on 14-2-19.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"
#import "LandscapeViewController.h"


#define deg2rad (M_PI/180.0)// //角度转换弧度
@interface ViewController ()

@property (nonatomic, strong) UIView *mailPortaitView; //横屏
@property (nonatomic, strong) UIView *mailLabdscapeView; //竖屏

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    LandscapeViewController *landscapeViewController = [[UIStoryboard storyboardWithName:@"LandscapeStoryboard" bundle:NULL]instantiateViewControllerWithIdentifier:@"LandscapeViewController"];
    
    self.mailLabdscapeView = landscapeViewController.view;
    self.mailPortaitView =  self.view;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 //设置是否支持自动旋转 Yes 支持 no 不支持
- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
//    return UIInterfaceOrientationMaskPortrait;
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        self.view = self.mailLabdscapeView;
        self.view.transform = CGAffineTransformMakeRotation(deg2rad*(90));
        self.view.bounds = CGRectMake(0.0, 0.0, 460.0, 320.0);
    } else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        self.view = self.mailLabdscapeView;
        self.view.transform = CGAffineTransformMakeRotation(deg2rad*(-90));
        self.view.bounds = CGRectMake(0.0, 0.0, 460.0, 320.0);
    } else {
        self.view = self.mailPortaitView;
        self.view.transform =CGAffineTransformMakeRotation(deg2rad*(0));
        self.view.bounds = CGRectMake(0.0, 0.0, 320.0, 460.0);
    }
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
}
@end
