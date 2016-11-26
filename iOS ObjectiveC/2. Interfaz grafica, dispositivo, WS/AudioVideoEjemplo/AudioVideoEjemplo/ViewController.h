//
//  ViewController.h
//  AudioVideoEjemplo
//
//  Created by Julio Laptop on 11/23/16.
//  Copyright © 2016 Julio Galeano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController{
    AVAudioPlayer *audioPlayer;
   
}

-(IBAction)playAudio:(id)sender;
-(IBAction)playVideoController:(id)sender;
-(IBAction)playVideoLayer:(id)sender;


@end

