//
//  DetailViewController.m
//  TreeNavigation
//
//  Created by yuxin tang on 14-3-16.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.webView.delegate = self;
    NSURL * url = [NSURL URLWithString: self.url];
	NSURLRequest * request = [NSURLRequest requestWithURL:url];
	[self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark WebView 委托
#pragma mark --
- (void)webViewDidFinishLoad: (UIWebView *) webView {
	NSLog(@"finish");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%@", [error description]);
}


@end
