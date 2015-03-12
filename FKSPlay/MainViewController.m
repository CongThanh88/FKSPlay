//
//  MainViewController.m
//  FKSPlay
//
//  Created by Cong Thanh on 12/18/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import "MainViewController.h"
#import "VideoCategory.h"
#import "VideoCategoryTableViewCell.h"
#import "VideoCategoryViewController.h"
#import "HeaderTableViewCell.h"
#import "VideoDetailViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController
{
    NSArray *listVideoCategory;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_tblCategory registerNib:[UINib nibWithNibName:@"HeaderTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"HeaderTableViewCell"];
    [_tblCategory registerNib:[UINib nibWithNibName:@"VideoCategoryTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CategoryCell"];
    _tblCategory.dataSource = self;
    _tblCategory.delegate = self;
    [self initDummyData];
    [_tblCategory reloadData];
}


-(void)initDummyData
{
    listVideoCategory = [[NSArray alloc]init];
    NSArray *categoryDicts = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"VideoData" ofType:@"plist"]];
    if (categoryDicts) {
        for (NSDictionary *categoryDict in categoryDicts) {
            if (categoryDict) {
                VideoCategory *category = [[VideoCategory alloc]init];
                category.categoryTitle = [categoryDict objectForKey:@"category_title"];
                NSArray *listItems = [categoryDict objectForKey:@"listVideos"];
                if (listItems) {
                    for (NSDictionary *videoDict in listItems) {
                        if (videoDict) {
                            Video *video = [[Video alloc]init];
                            video.videoTitle = [videoDict objectForKey:@"video_title"];
                            video.author = @"None";
                            video.viewsCount = [[videoDict objectForKey:@"video_view_counts"] intValue];
                            video.durationTime = [[videoDict objectForKey:@"video_duration_time"] intValue];
                            video.thumbVideo = [videoDict objectForKey:@"video_thumb_image"];
                            video.videoUrl = [videoDict objectForKey:@"video_url"];
                            category.listVideos = [category.listVideos arrayByAddingObject:video];
                        }
                    }
                    listVideoCategory = [listVideoCategory arrayByAddingObject:category];
                }
                
            }
            
        }
    }

}

#pragma mark - UITableViewDatasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (listVideoCategory) {
        return listVideoCategory.count;
    }
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {//HeaderCell
        HeaderTableViewCell *headerCell = [tableView dequeueReusableCellWithIdentifier:@"HeaderTableViewCell"];
        if (!headerCell) {
            headerCell = [[HeaderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HeaderTableViewCell"];
        }
        if (listVideoCategory && indexPath.row < listVideoCategory.count) {
            VideoCategory *category = [listVideoCategory objectAtIndex:indexPath.row];
            if (category) {
                headerCell.listVideos = category.listVideos;
            }
        }
        headerCell.delegate = self;
        return headerCell;
    }else{
        VideoCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryCell"];
        if (!cell) {
            cell = [[VideoCategoryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CategoryCell"];
        }
        
        if (listVideoCategory && indexPath.row < listVideoCategory.count) {
            VideoCategory *category = [listVideoCategory objectAtIndex:indexPath.row];
            if (category) {
                cell.videoCategory = category;
            }
        }
        cell.delegate = self;
        return cell;
    }
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    VideoCategoryViewController *videoCategoryVC = [[VideoCategoryViewController alloc]initWithNibName:@"VideoCategoryViewController" bundle:nil];
    if (listVideoCategory && listVideoCategory.count > indexPath.row) {
        VideoCategory *category = [listVideoCategory objectAtIndex:indexPath.row];
        if (category) {
            videoCategoryVC.category = category;
        }
    }
    [self.navigationController pushViewController:videoCategoryVC animated:YES];
}


#pragma mark - VideoItemViewDelegate
-(void)didSelectVideo:(Video *)video
{
    [self gotoDetailVideo:video];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)gotoDetailVideo:(Video*)video
{
    if (video) {
        VideoDetailViewController *detailVC = [[VideoDetailViewController alloc]initWithNibName:@"VideoDetailViewController" bundle:nil];
        detailVC.video = video;
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}
@end
