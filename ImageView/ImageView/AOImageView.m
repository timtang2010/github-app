//
//  AOImageView.m
//  ImageView
//
//  Created by yuxin tang on 14-4-8.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "AOImageView.h"
#import "UrlImageButton.h"

@implementation AOImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
//新定义初始化视图方法
- (id)initWithImageName:(NSString *)imageName title:(NSString *)titleStr x:(float)xPoint y:(float)yPoint height:(float)height
{
    //调用原始的初始化方法
    self = [super initWithFrame:CGRectMake(xPoint,
                                           yPoint,
                                           320,
                                           height)];
    if (self) {
        //Initialization code
        //设置图片视图
        UrlImageButton *imageView = [[UrlImageButton alloc] initWithFrame:CGRectMake(0, 64, 320, height)];
        //设置网络图片路径
        [imageView setImageFromUrl:YES withUrl:imageName];
        //设置点击方法
        [imageView addTarget:self
                      action:@selector(click)
            forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:imageView];
        
        //设置背景条
        UIView *titleBack = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 25, 320, 25)];
        titleBack.backgroundColor = [UIColor blackColor];
        titleBack.alpha = 0.6;
        [self addSubview:titleBack];
        
        //设置标题文字
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height-25, 320, 25)];
        titleLabel.text = titleStr;
        [titleLabel setFont:[UIFont systemFontOfSize:10.0f]];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:titleLabel];
        NSLog(@"%@, %@, %@", imageName, titleStr, self);
                                
    }
    return self;
}

- (void)click {
    [self.uBdelegate click:self.tag];
}

@end
