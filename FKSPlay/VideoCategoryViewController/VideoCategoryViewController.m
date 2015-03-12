//
//  VideoCategoryViewController.m
//  FKSPlay
//
//  Created by Cong Thanh on 12/18/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import "VideoCategoryViewController.h"
#import "VideoTableViewCell.h"
#import "VideoDetailViewController.h"

@interface VideoCategoryViewController ()

@end

@implementation VideoCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:64.0/255 green:74.0/255 blue:85.0/255 alpha:1]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"back_button.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(closeView)];
    self.navigationItem.leftBarButtonItems = [[NSArray alloc]initWithObjects:leftBarButton , nil];

    
    [_tblVideos registerNib:[UINib nibWithNibName:@"VideoTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"VideoCell"];
    _tblVideos.dataSource = self;
    _tblVideos.delegate = self;
    [_tblVideos setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    if (_category) {
        [self.navigationItem setTitle:_category.categoryTitle];
        [_tblVideos reloadData];
    }
}

-(void)closeView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_category.listVideos) {
        return _category.listVideos.count;
    }
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoCell"];
    if (!cell) {
        cell = [[VideoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"VideoCell"];
    }
    if (_category && _category.listVideos.count > indexPath.row) {
        Video *video = [_category.listVideos objectAtIndex:indexPath.row];
        if (video) {
            cell.video = video;
        }
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_category && _category.listVideos && indexPath.row < _category.listVideos.count) {
        Video *video = [_category.listVideos objectAtIndex:indexPath.row];
        [self gotoDetailVideo:video];
    }
}

-(void)gotoDetailVideo:(Video*)video
{
    if (video) {
        VideoDetailViewController *detailVC = [[VideoDetailViewController alloc]initWithNibName:@"VideoDetailViewController" bundle:nil];
        detailVC.video = video;
        [self.navigationController pushViewController:detailVC animated:YES];
    }
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
