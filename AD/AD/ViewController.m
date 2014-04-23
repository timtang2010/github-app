//
//  ViewController.m
//  AD
//
//  Created by yuxin tang on 14-4-22.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *sv;
@property (strong, nonatomic) IBOutlet UIPageControl *page;
@property (strong, nonatomic) IBOutlet UIWebView *wb;

@end

@implementation ViewController{
    NSArray *Arr;
    int TimeNum;
    BOOL Tend;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //创建并返回一个新的NSTimer对象，并将其时间表在默认模式下，当前运行的循环。
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(handleTimer:)
                                   userInfo:nil
                                    repeats:YES];
    
    Arr = [[NSArray alloc]initWithObjects:
    @"http://www.baidu.com/img/bdlogo.gif",
    @"http://www.sogou.com/images/logo_l2.gif",
    @"http://www.soso.com/soso/images/logo_index.png",nil];
    
    [self AdImg:Arr];;
    [self setCurrentPage:self.page.currentPage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleTimer:(NSTimer *)timer
{
    if (TimeNum % 5 == 0) {
        if (!Tend) {
            self.page.currentPage++;
            if (self.page.currentPage == self.page.numberOfPages - 1) {
                Tend = YES;
            }
        } else {
            self.page.currentPage--;
            if (self.page.currentPage == 0) {
                Tend = NO;
            }
        }
        [UIView animateWithDuration:0/7 //速度0.7秒
                         animations:^{ //修改坐标
                             self.sv.contentOffset = CGPointMake(self.page.currentPage *320, 0);
                         }];
    }
    TimeNum ++;
}

#pragma mark - 下载图片
void UIImageFormURl(NSURL * URL, void (^imageBlock)(UIImage * image),void(^errorBlock)(void))
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        NSData * data = [[NSData alloc] initWithContentsOfURL:URL];
        UIImage *image = [[UIImage alloc]initWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            if (image != nil) {
                imageBlock(image);
            }else {
                errorBlock();
            }
        });
    });
    
}

- (void)AdImg:(NSArray *)arr {
    [self.sv setContentSize:CGSizeMake(320*[Arr count], 189)];
    self.page.numberOfPages = [arr count];
    
    for (int i = 0; i < [arr count]; i++) {
        NSString *url = [arr objectAtIndex:i];
        UIButton *img = [[UIButton alloc] initWithFrame:CGRectMake(320*i, 0, 320, 189)];
        [img addTarget:self
                action:@selector(Action)
      forControlEvents:UIControlEventTouchUpInside];
        [self.sv addSubview:img];
        UIImageFormURl([NSURL URLWithString:url], ^(UIImage *image) {
            [img setImage:image forState:UIControlStateNormal];
        }, ^(void){
            
        });
    }
}

- (void)Action {
    NSURL *theurl = [NSURL URLWithString:[Arr objectAtIndex:self.page.currentPage]];
    [self.wb loadRequest:[NSURLRequest requestWithURL:theurl]];
    
}

#pragma mark - scrollView && Page
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _page.currentPage=scrollView.contentOffset.x/320;
    [self setCurrentPage:_page.currentPage];
}

- (void)setCurrentPage:(NSInteger)secondPage {
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.page.subviews count];
         subviewIndex++) {
        UIImageView * subview = [self.page.subviews objectAtIndex:subviewIndex];
        CGSize size;
        size.height = 24/2;
        size.width = 24/2;
        [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,  size.width, size.height)];
//        if (subviewIndex == secondPage)[subview setImage:[UIImage imageNamed:@"a.png"]];
//        else [subview setImage:[UIImage imageNamed:@"d.png"]];
    }
}

@end
