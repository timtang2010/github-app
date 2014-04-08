//
//  ViewController.m
//  test3
//
//  Created by yuxin tang on 14-4-3.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // alocate and initialize scroll
    UIScrollView *myScroll = [[UIScrollView alloc]
                              initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 460.0f)];
    
    // alocate and initialize label
    UILabel *myLabel = [[UILabel alloc]
                        initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 460.0f)];
    
    // add long text to label
    myLabel.text = @"昨日，《新大话西游2》的发布会上，为了答谢过去12年支持“大话西游”的老玩家，\n网易首次公开送出了4块“网易猪肉”作为答谢厚礼。而这4位玩家是从5\n万多名给丁磊写信的玩家中抽取的。“我觉得看上去挺\n像土猪肉。”获得“网易猪肉”的一位“90后”游戏玩家对记者说。拿着真空包装好的10斤猪肉，        他有些激动。记者发现和普通的猪肉相比，“唐僧肉”的肥肉占比较多，肉皮更厚实，包装袋上则并未标明猪肉\n的品名等其他相关信息此次亮相的“唐僧肉”也是为推广游戏所设立的奖品，旨在拉拢人气。据网易游戏副总裁王怡透露，        未来还将有超过千名玩家能得到这样的独家定制“唐僧肉”。“预计在6月份进行线上抽奖，至少有几千斤猪肉将被送出，由于猪肉产量不可控，还不能确定具体\n的数量。”吴亦告诉记者。2012年10月17日，网易员工发微博晒公司食堂出品的白水煮猪肉，称是传说\n中的“网易猪”，连肥肉都好吃。从微博晒出的照片看，餐盘上的“网易”字样清晰可见，更有杭州公司员工力证试吃确有其事。网友纷纷打趣内测版NeteasePig Beta1.0(中文名：网易猪1.0版)已上市，并疯狂转发求“试吃邀请码”。慢工出细活。5\n年的等待后，         丁氏猪肉何时能上你我的餐盘？网易方面表示，目前“丁氏猪肉”产量并不确定，对于正式上市的时间依然是个未知数。从目前的阶段看，丁氏猪肉只能算处于游戏玩家圈内答谢阶段，不过这也算是丁氏猪肉走向大众的第一步。";
    // set line break mode to word wrap
//    myLabel.numberOfLines = 2;

    myLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    // set number of lines to zero
    myLabel.numberOfLines = 0;
    // resize label
    [myLabel sizeToFit];
    
    
    // set scroll view size
    myScroll.contentSize = CGSizeMake(myScroll.contentSize.width, myLabel.frame.size.height);
    // add myLabel
    [myScroll addSubview:myLabel];
    // add scroll view to main view
    [self.view addSubview:myScroll];
    // release label and scroll view
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
