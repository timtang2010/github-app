//
//  DetailViewController.h
//  TreeNavigation
//
//  Created by yuxin tang on 14-3-16.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) NSString *url;

@end
