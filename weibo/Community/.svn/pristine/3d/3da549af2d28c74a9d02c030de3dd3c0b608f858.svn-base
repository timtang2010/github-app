//
//  ZCHelper_TableViewCell.m
//  Community
//
//  Created by yuxin tang on 14-4-11.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "ZCHelper_TableViewCell.h"
#import "ZCHelper_TableViewController.h"

@implementation ZCHelper_TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, 320, 20)];
        self.lblTitle.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.lblTitle];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//勾画出子视图。
- (void)layoutSubviews
{
    [super layoutSubviews];
    //缩进级别单元格的内容indentationLevel。
    //宽度为一个单元格缩进的每一层indentationWidth
    float indentPoints = self.indentationLevel * self.indentationWidth;
    //返回单元格对象的内容视图。contentView 
    self.contentView.frame = CGRectMake(indentPoints,
                                        self.contentView.frame.origin.y,
                                        self.contentView.frame.size.width - indentPoints,
                                        self.contentView.frame.size.height);
}

@end
