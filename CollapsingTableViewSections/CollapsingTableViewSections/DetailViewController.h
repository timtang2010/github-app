//
//  DetailViewController.h
//  CollapsingTableViewSections
//
//  Created by yuxin tang on 14-4-11.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;


@end
