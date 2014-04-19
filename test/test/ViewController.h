//
//  ViewController.h
//  test
//
//  Created by yuxin tang on 14-4-12.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UISplitViewControllerDelegate>{
}

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
