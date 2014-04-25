//
//  AppDelegate.h
//  beacontunes
//
//  Created by Jamie Sutherland on 25/04/2014.
//  Copyright (c) 2014 Pussy Galore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Spotify/Spotify.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, readwrite) SPTTrackPlayer *trackPlayer;

@end
