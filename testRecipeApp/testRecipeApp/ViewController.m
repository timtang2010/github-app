//
//  ViewController.m
//  testRecipeApp
//
//  Created by yuxin tang on 14-4-14.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "gaodeViewController.h"

@interface ViewController ()

- (IBAction)pushToGaodeMapView:(id)sender;


@end

@implementation ViewController
{
    NSDictionary *dictData;
    NSArray *nameData;
    NSArray *adressData;
    NSArray *phoneDate;
    NSArray *imagePhoto;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Property List" ofType:@"plist"];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    nameData = [dict objectForKey:@"name"];
    adressData = [dict objectForKey:@"address"];
    phoneDate = [dict objectForKey:@"phone"];
    imagePhoto = [dict objectForKey:@"image"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [nameData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTabelIdentifier = @"Cell";
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTabelIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.name.text = [nameData objectAtIndex:indexPath.row];
    cell.address.text = [adressData objectAtIndex:indexPath.row];
    cell.phone.text = [phoneDate objectAtIndex:indexPath.row];
    cell.image.image = [UIImage imageNamed:[imagePhoto objectAtIndex:indexPath.row]];
    
    return cell;
}


- (IBAction)pushToGaodeMapView:(id)sender {
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    gaodeViewController *gaodeViewControllerView = [storyboard instantiateViewControllerWithIdentifier:@"gaodeViewController"];
    
//    gaodeViewControllerView.hidesBottomBarWhenPushed = YES;
    
    [self setHidesBottomBarWhenPushed:YES];
 
    [self.navigationController pushViewController:gaodeViewControllerView animated:YES];
}



@end
