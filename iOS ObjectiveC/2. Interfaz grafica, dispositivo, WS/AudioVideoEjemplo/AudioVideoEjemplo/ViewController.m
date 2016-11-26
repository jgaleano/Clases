//
//  ViewController.m
//  AudioVideoEjemplo
//
//  Created by Julio Laptop on 11/23/16.
//  Copyright © 2016 Julio Galeano. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVPlayerViewController.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)playAudio:(id)sender{
    NSString *path = [[NSBundle mainBundle]
                      pathForResource:@"Cancion" ofType:@"mp3"];
    
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:
                   [NSURL fileURLWithPath:path] error:NULL];
    [audioPlayer play];
}

-(IBAction)playVideoController:(id)sender{
    // remote file from server:
    NSURL *videoURL = [NSURL URLWithString:@"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    AVPlayerViewController *playerViewController = [AVPlayerViewController new];
    playerViewController.player = player;
    [self.view addSubview: playerViewController.view];
    [self presentViewController:playerViewController animated:YES completion:nil];
}


-(IBAction)playVideoLayer:(id)sender {
    NSURL *videoURL = [NSURL URLWithString:@"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:playerLayer];
    [player play];
}

@end
