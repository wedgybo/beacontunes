//
//  FirstViewController.h
//  beacontunes
//
//  Created by Jamie Sutherland on 25/04/2014.
//  Copyright (c) 2014 Pussy Galore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
@property (nonatomic,weak) IBOutlet UITextView *distanceLabel;

@property (nonatomic,weak) IBOutlet UILabel *venueName;
@property (nonatomic,weak) IBOutlet UILabel *artistName;
@property (nonatomic,weak) IBOutlet UILabel *trackName;
@property (nonatomic,weak) IBOutlet UIImageView *albumArt;

@end
