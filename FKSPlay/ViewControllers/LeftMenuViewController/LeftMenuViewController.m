//
//  LeftMenuViewController.m
//  FKSPlay
//
//  Created by Cong Thanh on 12/19/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "MainViewController.h"
#import "MFSideMenu.h"

@interface LeftMenuViewController ()

@end

@implementation LeftMenuViewController
{
    NSArray *listCategories;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_tblMenuItems setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    _tblMenuItems.dataSource = self;
    _tblMenuItems.delegate = self;
    
    listCategories = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MenuItems" ofType:@"plist"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (listCategories) {
        return listCategories.count;
    }
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (listCategories && listCategories.count> section) {
        NSDictionary *categoryDict = [listCategories objectAtIndex:section];
        if (categoryDict) {
            NSArray *listItems = [categoryDict objectForKey:@"listItems"];
            if (listItems) {
                return listItems.count;
            }
        }
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
    if (!headerView) {
        headerView = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:@"headerView"];
        if (listCategories && listCategories.count > section) {
            NSDictionary *categoryDict = [listCategories objectAtIndex:section];
            if (categoryDict) {
                UILabel *headerTitle = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 240, 40)];
                headerTitle.backgroundColor = [UIColor clearColor];
                headerTitle.font = [UIFont systemFontOfSize:24];
                headerTitle.text = [categoryDict objectForKey:@"title"];
                headerTitle.textAlignment = NSTextAlignmentLeft;
                headerTitle.textColor = [UIColor whiteColor];
                [headerView addSubview:headerTitle];
            }
        }
        headerView.backgroundView = [[UIView alloc]initWithFrame:headerView.frame];
        headerView.backgroundView.backgroundColor = [UIColor clearColor];
        headerView.backgroundColor = [UIColor clearColor];
    }
   
    return headerView;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"itemCell"];
    }
    if (listCategories && listCategories.count > indexPath.section) {
        NSDictionary *categoryDict = [listCategories objectAtIndex:indexPath.section];
        if (categoryDict) {
            NSArray *listItems = [categoryDict objectForKey:@"listItems"];
            if (listItems.count > indexPath.row) {
                NSDictionary *dictItem = [listItems objectAtIndex:indexPath.row];
                if (dictItem) {
                    cell.imageView.image = [UIImage imageNamed:[dictItem objectForKey:@"icon"]];
                    cell.textLabel.text = [dictItem objectForKey:@"title"];
                    cell.textLabel.font = [UIFont systemFontOfSize:20];
                    cell.textLabel.textColor = [UIColor whiteColor];
                    cell.textLabel.textAlignment = NSTextAlignmentLeft;
                }
            }

        }
    }
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    MainViewController *mainVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    
    if (listCategories && listCategories.count > indexPath.section) {
        NSDictionary *categoryDict = [listCategories objectAtIndex:indexPath.section];
        if (categoryDict) {
            NSArray *listItems = [categoryDict objectForKey:@"listItems"];
            if (listItems.count > indexPath.row) {
                NSDictionary *dictItem = [listItems objectAtIndex:indexPath.row];
                if (dictItem) {
                    [mainVC setTitle:[dictItem objectForKey:@"title"]];
                }
            }
            
        }
    }

    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    NSArray *controllers = [NSArray arrayWithObject:mainVC];
    navigationController.viewControllers = controllers;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
