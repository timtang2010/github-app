//
//  YYCommunityNew_ViewController.h
//  Community
//
//  Created by yuxin tang on 14-4-10.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYCommunityNew_ViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *CommunityNewView;

@property (strong, nonatomic) NSArray *listData;
@property (weak, nonatomic) NSString *url;
@end
