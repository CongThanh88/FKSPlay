//
//  MoviePlayerViewController.m
//  FKSPlay
//
//  Created by Cong Thanh on 12/19/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import "MoviePlayerViewController.h"
#import "ReachabilityManager.h"
#import "MBProgressHUD.h"


@interface MoviePlayerViewController ()

@end

@implementation MoviePlayerViewController
{
    MPMoviePlayerController *moviePlayer;
    MBProgressHUD *loadingView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = NO;
    loadingView = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [loadingView showUsingAnimation:YES];
    self.navigationController.navigationBarHidden = YES;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(setUpViews) object:nil];
    [self performSelector:@selector(setUpViews) withObject:nil afterDelay:0.5f];
}

- (void)setUpViews
{
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(movieLoadStateChanged:)
                                                 name:MPMoviePlayerLoadStateDidChangeNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(done:)
                                                 name:MPMoviePlayerDidExitFullscreenNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePreloadDidFinish:)
                                                 name:MPMediaPlaybackIsPreparedToPlayDidChangeNotification
                                               object:nil];
    
    
    //MPMoviePlayerScalingModeDidChangeNotification
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    moviePlayer.controlStyle = MPMovieControlStyleFullscreen;
    
    
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:nil];
    
    if([moviePlayer respondsToSelector:@selector(setAllowsAirPlay:)])
    {
        [moviePlayer setAllowsAirPlay:YES];
    }
    
    moviePlayer.controlStyle = MPMovieControlStyleFullscreen;
    [moviePlayer setFullscreen:YES animated:YES];
    [self.view addSubview:moviePlayer.view];
    [self resetFrame];
    [moviePlayer.view setHidden:YES];
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(prepareMovie) object:nil];
    [self performSelector:@selector(prepareMovie) withObject:nil afterDelay:0.1f];
}

-(void)resetFrame
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    moviePlayer.view.frame = CGRectMake(0, 0, screenSize.width, screenSize.height);
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    moviePlayer.view.frame = CGRectMake(0, 0, screenSize.width, screenSize.height);
}

- (void)done:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSURL*)movieURL
{
    if (_selectedVideo && _selectedVideo.videoUrl) {
        return [NSURL URLWithString:_selectedVideo.videoUrl];
    }
    return nil;
}

- (void)prepareMovie
{
    if (![[ReachabilityManager sharedInstance] isInternetConnected]) {
        [loadingView hide:YES];
        UIAlertView *networkError = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Network Error" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [networkError show];
        return;
    }
    
    NSURL *url = [self movieURL];
    BOOL result = [self responseForURL:url];
    if (result == NO) {//Link invailable
        //replace with new link
    }
    
    moviePlayer.contentURL = url;
    [moviePlayer prepareToPlay];
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self performSelector:@selector(moviePlayBackDidFinish:) withObject:nil];
}

- (BOOL)responseForURL:(NSURL *)url
{
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"GET"];
    NSHTTPURLResponse *resp;
    [NSURLConnection sendSynchronousRequest:req returningResponse:&resp error:NULL];
#if 1
    int status = (int)[resp statusCode];
    return status == 200;   // OK
#else
    // test
    static int test = 0;
    test++;
    NSLog(@"responseForURL: %@", test == 3 ? @"YES" : @"NO");
    return test >= 3;
#endif
}


#pragma mark  Notification for MPMoviePlayerController

- (void)moviePreloadDidFinish:(NSNotification *)movieNotification
{
    [loadingView hideUsingAnimation:YES];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSError *error = [[movieNotification userInfo] objectForKey:@"error"];
    if (error) {
        NSLog(@"error:%@", error);
        [self performSelector:@selector(moviePlayBackDidFinish:) withObject:nil];
    } else {
        [moviePlayer play];
        moviePlayer.view.hidden = NO;
    }
}

- (void)moviePlayBackDidFinish:(NSError *)error
{
    NSLog(@"mpMoviePlayBackDidFinish:");
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [moviePlayer stop];
    moviePlayer.initialPlaybackTime = -1.0;
    [self done:nil];
}

- (void)movieLoadStateChanged:(NSNotification *)aNotification
{
    int loadState = moviePlayer.loadState;
    if (loadState == MPMovieLoadStatePlayable || loadState == MPMovieLoadStatePlaythroughOK) {
        
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
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
