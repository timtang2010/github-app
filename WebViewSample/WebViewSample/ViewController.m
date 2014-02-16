//
//  ViewController.m
//  WebViewSample
//
//  Created by yuxin tang on 14-2-16.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)testLoadHTMLString:(id)sender;
- (IBAction)testLoadData:(id)sender;
- (IBAction)testLoadRequest:(id)sender;

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

- (IBAction)testLoadHTMLString:(id)sender {
    
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *bundleRrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]bundlePath]];
    NSError *error = nil;
    
    NSString *html = [[NSString alloc] initWithContentsOfFile:htmlPath
                                                     encoding:NSUTF8StringEncoding
                                                        error:&error];
    
    if (error == nil) {//数据加载没有错误的情况下
        [self.webView loadHTMLString:html  baseURL:bundleRrl];
        
    }
}

- (IBAction)testLoadData:(id)sender {
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index"
                                                         ofType:@"html"];
    NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]bundlePath]];
    NSError *error = nil;
    
    NSData *htmlData = [[NSData alloc]initWithContentsOfFile:htmlPath];
    
    if (error == nil) {//数据没有加载错误的情况下
        [self.webView loadData:htmlData
                      MIMEType:@"test.html"
              textEncodingName:@"UTF-8"
                       baseURL:bundleUrl];
    }
}

- (IBAction)testLoadRequest:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http:www.apple.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
//    self.webView.delegate = self;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"%@", [webView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"]);
}
@end
