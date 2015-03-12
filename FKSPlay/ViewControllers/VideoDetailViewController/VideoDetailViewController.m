//
//  VideoDetailViewController.m
//  FKSPlay
//
//  Created by Apple on 12/23/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import "VideoDetailViewController.h"
#import "MoviePlayerViewController.h"
#import "Datamanager.h"

@interface VideoDetailViewController ()

@end

@implementation VideoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBar.barTintColor = kNavigationbarColor;
    
    UITapGestureRecognizer *tapGesture= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toggleToolbarTopView)];
    [_thumbVideoView addGestureRecognizer:tapGesture];
    
    [self setupTitleView];
}

-(void)toggleToolbarTopView
{
    if (_menuTopView.hidden) {
        _menuTopView.alpha = 0.0;
        _menuTopView.hidden = NO;
        [UIView animateWithDuration:0.4 animations:^{
            _menuTopView.alpha = 1.0;
        }];
    }else{
        [UIView animateWithDuration:0.4 animations:^{
            _menuTopView.alpha = 0.0;
        } completion:^(BOOL finished) {
            _menuTopView.hidden = YES;
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setVideo:(Video *)video{
    _video = video;
    [self setupTitleView];
}

-(void)setupTitleView
{
    if (_video) {
        [self.navigationItem setTitle:_video.videoTitle];
        _imvThumbVideo.image = [UIImage imageNamed:_video.thumbVideo];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addToFavorite:(id)sender {
    [[Datamanager sharedInstance] addToFavoriteVideo:_video];
}

- (IBAction)playVideo:(id)sender {
    MoviePlayerViewController *moviePlayerVC = [[MoviePlayerViewController alloc]initWithNibName:@"MoviePlayerViewController" bundle:nil];
    if (_video) {
        moviePlayerVC.selectedVideo = _video;
    }
    [self.navigationController pushViewController:moviePlayerVC animated:YES];
}
@end
