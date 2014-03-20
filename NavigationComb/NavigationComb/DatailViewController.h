//
//  DatailViewController.h
//  NavigationComb
//
//  Created by yuxin tang on 14-3-20.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatailViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) NSString *url;
@end
