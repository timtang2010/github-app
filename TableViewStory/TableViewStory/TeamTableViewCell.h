//
//  TeamTableViewCell.h
//  TableViewStory
//
//  Created by yuxin tang on 14-2-22.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *TeamImage;
@property (strong, nonatomic) IBOutlet UILabel *TeamLabel;
@property (strong, nonatomic) IBOutlet UILabel *TeamName;

@end
