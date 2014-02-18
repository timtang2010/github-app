//
//  ViewController.m
//  ActivityIndicatorViewProgressViewSample
//
//  Created by yuxin tang on 14-2-17.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer *myTimer;
}
@property (strong, nonatomic) NSTimer *_myTimer;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *myActivityIndicatorView;
@property (weak, nonatomic) IBOutlet UIProgressView *myProgressView;

- (IBAction)startToMove:(id)sender;
- (IBAction)downloadProgress:(id)sender;

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

- (IBAction)startToMove:(id)sender {
    //isAnimating方法用于判断，是否动画
    if ([self.myActivityIndicatorView isAnimating]) {
        [self.myActivityIndicatorView stopAnimating];
    } else {
        [self.myActivityIndicatorView startAnimating];
    }
}

- (IBAction)downloadProgress:(id)sender {
    myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 //设定间隔时间/S
                                               target:self
                                             selector:@selector(download)// 调用方法
                                             userInfo:nil //可以给消息发送参数
                                              repeats:YES]; //是否重复
    
}

- (void)download
{
    self.myProgressView.progress = self.myProgressView.progress + 0.05;//下载进度每次加1
    if (self.myProgressView.progress == 1.0) {
        [myTimer invalidate];//停止定时器
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"download completed!"
                                                        message:@""
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles: nil];
        [alert show];
    }
}
@end
