//
//  VideoFavoriteViewController.m
//  FKSPlay
//
//  Created by Cong Thanh on 12/19/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import "VideoFavoriteViewController.h"
#import "Datamanager.h"
#import "FavoriteTableViewCell.h"
#import "MFSideMenu.h"

@interface VideoFavoriteViewController ()

@end

@implementation VideoFavoriteViewController
{
    Datamanager *datamanager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    datamanager = [Datamanager sharedInstance];
    _tblListFavorites.dataSource = self;
    _tblListFavorites.delegate = self;
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor orangeColor]}];
    [self.navigationController.navigationBar setBarTintColor:kNavigationbarColor];
    [self.navigationItem setTitle:@"Yêu Thích"];
    [_tblListFavorites setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    [_tblListFavorites registerNib:[UINib nibWithNibName:@"FavoriteTableViewCell" bundle:nil] forCellReuseIdentifier:@"FavoriteCell"];
    [self refreshData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:MFSideMenuStateNotificationEvent object:nil];
}

-(void)willShowView:(NSNotification*)notification
{
    NSDictionary *userInfo = notification.userInfo;
    if (userInfo && (MFSideMenuStateEventMenuWillOpen == [[userInfo objectForKey:@"eventType"] intValue])) {
        [self refreshData];
    }
}

-(void)refreshData
{
    [_tblListFavorites reloadData];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (datamanager.favoriteVideosList) {
        return datamanager.favoriteVideosList.count;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FavoriteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FavoriteCell"];
    if (!cell) {
        cell = [[FavoriteTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FavoriteCell"];
    }
    if (datamanager.favoriteVideosList.count > indexPath.row) {
        Video *video = [datamanager.favoriteVideosList objectAtIndex:indexPath.row];
        if (video) {
            cell.video = video;
        }
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
